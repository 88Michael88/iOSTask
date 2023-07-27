//
//  WeatherModel.swift
//  EmpikTestApp
//
//  Created by Michael on 7/26/23.
//

import Foundation

struct WeatherModel {
    let temperature: Double
    let cityName: String
    let country: String
    //let nextHours: []
    let weatherID: Int
    let fullWeatherData: [FullWeatherData]
    
    var temperatureString: String {
        return K.WeatherFuncs.roundDownString(temperature)
        
    }
    
    var weatherImage: String {
        return K.WeatherFuncs.weatherImage(from: weatherID)
    }
    
    
}
