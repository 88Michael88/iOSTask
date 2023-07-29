//
//  ViewController.swift
//  EmpikTestApp
//
//  Created by Michael on 7/26/23.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet var conditionImage: UIImageView!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var descriptionLabel: UILabel!
    
    var cityName: String = ""
    var numberOfTimestamps = 5
    var weatherManager = WeatherManager()
    var fullWeatherData = [FullWeatherData]()
    var ready = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherManager.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: K.weatherCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: K.colCellIndetifier)
        weatherManager.getWeather(for: cityName, with: nil)
        navigationItem.title = cityName
    }
}

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

extension WeatherViewController: UICollectionViewDelegate {
    
}
