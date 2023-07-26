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
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var weatherImage: String {
        switch weatherID {
        case 200...232:
            return K.ImageNames.thunderstorm
        case 300...321:
            return K.ImageNames.drizzle
        case 500...531:
            return K.ImageNames.rain
        case 600...622:
            return K.ImageNames.snow
        case 701...740:
            return K.ImageNames.cloudsSmall
        case 742...780:
            return K.ImageNames.cloudsSmall
        case 741:
            return K.ImageNames.fog
        case 781:
            return K.ImageNames.tornado
        case 800:
            return K.ImageNames.clear
        case 801...802:
            return K.ImageNames.cloudsSmall
        case 803...804:
            return K.ImageNames.cloudsBig
        default:
            return K.ImageNames.cloudsSmall
        }
    }
    
    
}
