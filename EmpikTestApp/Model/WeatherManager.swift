//
//  WeatherManager.swift
//  EmpikTestApp
//
//  Created by Michael on 7/26/23.
//

import Foundation


// API Key: dc6ae0d32c6a5e570873504f1d755c4c
struct WeatherManager {
    let url = "https://api.openweathermap.org/data/2.5/forecast?appid=dc6ae0d32c6a5e570873504f1d755c4c&units=metric"
    // &q={cityName: String}
    // &cnt={numberOfTimestamps: Int}
    func getWeather(for cityName: String, with numberOfTimestamps: Int?) {
        if let timestamps = numberOfTimestamps {
            performRequest(with: "\(url)&q=\(cityName)&cnt=\(timestamps)")
        }else{
            //Default
            performRequest(with: "\(url)&q=\(cityName)&cnt=5")
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
                    return
                }
                
                if let safeData = data {
                    parseJSON(weatherData: safeData)
                }
            }
            // 4. Start the task.
            task.resume()
        }

    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let cityName = decodedData.city.name
            let country = decodedData.city.country
            let list = decodedData.list
            //print(cityName, country)
        }catch{
            print(error)
        }
    }
}
