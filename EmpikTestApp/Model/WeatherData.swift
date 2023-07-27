//
//  WeatherData.swift
//  EmpikTestApp
//
//  Created by Michael on 7/26/23.
//

import Foundation

struct WeatherData: Codable {
    let list: [List]
    let city: Country
}

struct List: Codable {
    let main: Main
    let weather: [Weather]
    let dt_txt: String
}

struct Main: Codable {
    let temp: Double
    let humidity: Int
    let pressure: Int
}

struct Weather: Codable {
    let id: Int
    let main: String
}

struct Country: Codable {
    let country: String
    let name: String
}
