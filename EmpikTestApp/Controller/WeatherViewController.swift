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
    
    var cityName: String = ""
    var numberOfTimestamps = 5
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherManager.delegate = self
        print(cityName)
        weatherManager.getWeather(for: cityName, with: nil)
        navigationItem.title = cityName
    }
}

extension WeatherViewController: WeatherModelDelegate {
    func didUpdateWeather(_ weatherManger: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.navigationItem.title = "\(weather.cityName), \(weather.country)"
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImage.image = UIImage(systemName: weather.weatherImage)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error.localizedDescription)
    }
}
