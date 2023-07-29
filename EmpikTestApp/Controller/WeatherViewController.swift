//
//  ViewController.swift
//  EmpikTestApp
//
//  Created by Michael on 7/26/23.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController  {

    @IBOutlet var conditionImage: UIImageView!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var descriptionLabel: UILabel!
    
    var weatherManager = WeatherManager()
    var fullWeatherData = [FullWeatherData]()
    var locationManager = CLLocationManager()
    var cityName: String = ""
    var numberOfTimestamps = 5
    var ready = false
    var location = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherManager.delegate = self
        locationManager.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: K.weatherCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: K.colCellIndetifier)
        weatherManager.getWeather(for: cityName, with: nil)
        navigationItem.title = cityName
        
        locationManager.requestWhenInUseAuthorization()
        if location {
            locationManager.requestLocation()
        }
    }
    
}
// MARK: - CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate {
    @IBAction func locationButtonPressed(_ sender: UIBarButtonItem) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.getWeather(for: lat, and: lon, with: nil)
            collectionView.reloadData()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

// MARK: - WeatherModelDelegate
extension WeatherViewController: WeatherModelDelegate {
    func didUpdateWeather(_ weatherManger: WeatherManager, weather: WeatherModel) {
        fullWeatherData = weather.fullWeatherData
        ready = true
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.navigationItem.title = "\(weather.cityName), \(weather.country)"
            self.temperatureLabel.text = weather.temperatureString
            self.temperatureLabel.textColor = K.WeatherFuncs.temperatureColor(for: weather.temperatureString)
            self.descriptionLabel.text = weather.description.capitalized
            self.conditionImage.image = UIImage(systemName: weather.weatherImage)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error.localizedDescription)
    }
}

// MARK: - UICollectionViewDataSource
extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfTimestamps
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.colCellIndetifier, for: indexPath) as! WeatherCollectionViewCell
        if ready {
            for i in 0..<numberOfTimestamps {
                if i == indexPath.row {
                    DispatchQueue.main.async {
                        cell.tempLabel.text = self.fullWeatherData[i].temperature+"ºC"
                        cell.timeLabel.text = self.fullWeatherData[i].time
                        cell.cellConditionImage.image = UIImage.init(systemName: self.fullWeatherData[i].weatherConditionImage)
                    }
                }
            }
        }
        return cell
    }
}
