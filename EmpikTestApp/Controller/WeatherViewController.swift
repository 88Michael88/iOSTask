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
    
    var cityName: String = ""
    var numberOfTimestamps = 5
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherManager.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: K.WeatherCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: K.weatherCellIndetifier)
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

extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfTimestamps
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.weatherCellIndetifier, for: indexPath) as! WeatherCollectionViewCell
        cell.tempLabel.text = "14.3ºC"
        cell.timeLabel.text = "12 PM"
        cell.cellConditionImage.image = UIImage.init(systemName: K.ImageNames.sunAndClouds)
        cell.backgroundColor = .black
        
        return cell
    }
}

extension WeatherViewController: UICollectionViewDelegate {
    
}
