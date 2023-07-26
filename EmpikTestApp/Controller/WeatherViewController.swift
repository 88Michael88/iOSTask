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
    @IBOutlet var cityLabel: UILabel!
    
    var cityName: String = ""
    var numberOfTimestamps = 5
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(cityName)
        weatherManager.getWeather(for: cityName, with: nil)
        navigationItem.title = cityName
    }


}

