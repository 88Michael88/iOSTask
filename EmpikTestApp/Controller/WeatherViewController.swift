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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingView: UIView! {
        didSet {
            loadingView.layer.cornerRadius = 6
        }
    }
    
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
        showSpinner()
        weatherManager.delegate = self
        locationManager.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: K.weatherCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: K.colCellIndetifier)
        weatherManager.getWeather(for: cityName, with: Int(UserDefaults.standard.double(forKey: K.UserDefaults.savedIntervales)))
        navigationItem.title = cityName
        
        locationManager.requestWhenInUseAuthorization()
        if location {
            locationManager.requestLocation()
        }
        if UserDefaults.standard.double(forKey: K.UserDefaults.savedIntervales) != 0.0 {
            numberOfTimestamps = Int(UserDefaults.standard.double(forKey: K.UserDefaults.savedIntervales))
        }
    }
}

// MARK: - CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate {
    @IBAction func locationButtonPressed(_ sender: UIBarButtonItem) {
        showSpinner()
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.getWeather(for: lat, and: lon, with: Int(UserDefaults.standard.double(forKey: K.UserDefaults.savedIntervales)))
            collectionView.reloadData()
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        errorAlert(withMessage: K.Error.errorMessageLocation)
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
        if !location {
            if error.localizedDescription == "The data couldn’t be read because it is missing."{
                errorAlert(withMessage: K.Error.errorMessageCity)
            }
            errorAlert(withMessage: K.Error.errorMessageInternet)
        }
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
                        self.hideSpinner()
                        cell.tempLabel.text = self.fullWeatherData[i].temperature+"ºC"
                        cell.tempLabel.textColor = K.WeatherFuncs.temperatureColor(for: self.fullWeatherData[i].temperature)
                        cell.timeLabel.text = self.fullWeatherData[i].time
                        cell.cellConditionImage.image = UIImage.init(systemName: self.fullWeatherData[i].weatherConditionImage)
                        if !self.location {
                            self.historyArray(append: self.cityName)
                        }
                    }
                }
            }
        }
        return cell
    }
}

// MARK: - UIActivityIndicatorView
extension WeatherViewController {
    private func showSpinner() {
        activityIndicator.startAnimating()
        loadingView.isHidden = false
    }
    
    private func hideSpinner() {
        activityIndicator.stopAnimating()
        loadingView.isHidden = true
    }
}

// MARK: - ErrorPopUp
extension WeatherViewController {
    func errorAlert(withMessage errorMessage: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: K.Error.error, message: errorMessage, preferredStyle: .alert)
            let action = UIAlertAction(title: K.Error.okay, style: .cancel) { _ in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
        }
    }
}

// MARK: - HistoryArray
extension WeatherViewController {
    func historyArray(append string: String) {
        var historyArray: [String] = UserDefaults.standard.array(forKey: K.UserDefaults.savedHistory) as? [String] ?? [cityName]
        print(historyArray)
        if !historyArray.contains(string) {
            if historyArray.count < 20 {
                historyArray.append(string)
            }else{
                historyArray.removeFirst()
                historyArray.append(string)
            }
        }
        print(historyArray.count)
        UserDefaults.standard.set(historyArray, forKey: K.UserDefaults.savedHistory)
        print(historyArray)
    }
}
