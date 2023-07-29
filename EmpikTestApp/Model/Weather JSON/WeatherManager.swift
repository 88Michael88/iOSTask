//
//  WeatherManager.swift
//  EmpikTestApp
//
//  Created by Michael on 7/26/23.
//

import Foundation
protocol WeatherModelDelegate {
    func didUpdateWeather(_  weatherManger: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

// API Key: dc6ae0d32c6a5e570873504f1d755c4c
struct WeatherManager {
    let url = "https://api.openweathermap.org/data/2.5/forecast?appid=dc6ae0d32c6a5e570873504f1d755c4c&units=metric"
    // &q={cityName: String}
    // &cnt={numberOfTimestamps: Int}
    var delegate: WeatherModelDelegate?

     func getWeather(for cityName: String, with numberOfTimestamps: Int?) {
        
        let city = cityName.components(separatedBy: " ").joined(separator: "%20")
        
        if let timestamps = numberOfTimestamps {
            performRequest(with: "\(url)&q=\(city)&cnt=\(timestamps)")
        }else{
            performRequest(with: "\(url)&q=\(city)&cnt=5")
        }
    }
    
    func getWeather(for latitude: Double, and longitude: Double, with numberOfTimestamps: Int?) {
        
        if let timestamps = numberOfTimestamps {
            performRequest(with: "\(url)&lat=\(Double(round(1000 * latitude) / 1000))&lon=\(Double(round(1000 * longitude) / 1000))&cnt=\(timestamps)")
        }else{
            performRequest(with: "\(url)&lat=\(Double(round(1000 * latitude) / 1000))&lon=\(Double(round(1000 * longitude) / 1000))&cnt=5")
            print("\(url)&lat=\(Double(round(1000 * latitude) / 1000))&lon=\(Double(round(1000 * longitude) / 1000))&cnt=5")
        }
    }
    
    func performRequest(with urlString: String) {
        // 1. Create a URL.
        if let url = URL(string: urlString) {
            // 2. Create a URLSession.
            let session = URLSession(configuration: .default)
            // 3. Give the URLSession a task.
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            // 4. Start the task.
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let list = decodedData.list
            var fullWeatherArray = [FullWeatherData]()
            for item in 0..<list.count {
                let element = FullWeatherData(time: K.WeatherFuncs.dataFormatting(list[item].dt_txt),
                                              weatherConditionImage: K.WeatherFuncs.weatherImage(from: list[item].weather[0].id),
                                              temperature: K.WeatherFuncs.roundDownString(list[item].main.temp))
                fullWeatherArray.append(element)
            }
            return WeatherModel(temperature: list[0].main.temp,
                                cityName: decodedData.city.name, country: decodedData.city.country,
                                weatherID: list[0].weather[0].id,
                                description: list[0].weather[0].description,
                                fullWeatherData: fullWeatherArray)
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
