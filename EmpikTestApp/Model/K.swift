//
//  Constances.swift
//  EmpikTestApp
//
//  Created by Michael on 7/26/23.
//

import UIKit

struct K {
    static let tabCellIndetifier = "resultCell"
    static let colCellIndetifier = "weatherCell"
    static let segueIdentifier = "weatherView"
    static let weatherCollectionViewCell = "WeatherCollectionViewCell"
    static let resultTableViewCell = "SearchTableViewCell" 
    
    struct ImageNames {
        static let thunderstorm = "cloud.bolt.rain.fill"
        static let drizzle = "cloud.drizzle.fill"
        static let rain = "cloud.rain.fill"
        static let snow = "cloud.snow"
        
        static let fog = "cloud.fog.fill"
        static let tornado = "tornado"
        
        static let sunAndClouds = "cloud.sun.fill"
        
        static let clear = "sun.max.fill"
        static let cloudsSmall = "cloud.fill"
        static let cloudsBig = "smoke.fill"
    }
    
    struct WeatherFuncs {
        static func weatherImage(from id: Int) -> String {
            switch id {
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
                return K.ImageNames.sunAndClouds
            case 803:
                return K.ImageNames.cloudsSmall
            case 804:
                return K.ImageNames.cloudsBig
            default:
                return K.ImageNames.cloudsSmall
            }
        }
        static func roundDownString(_ input: Double) -> String {
            return String(format: "%.1f", input)
        }
        static func dataFormatting(_ date: String) -> String {
            
            let regex = try! NSRegularExpression(pattern: "(?<time>\\w{2}:\\w{2})")
            if let match = regex.firstMatch(in: date,options: [], range: NSRange(location: 0, length: date.utf8.count)) {
                if let range = Range(match.range, in: date) {
                    return String(date[range])
                }
            }
            return ""
        }
        static func temperatureColor(for temperature: String) -> UIColor {
            switch Double(temperature)! {
            case 20...:
                return UIColor(named: K.ColorNames.TemperatureColors.hot)!
            case ...10:
                return UIColor(named: K.ColorNames.TemperatureColors.cold)!
            default:
                return UIColor.black
            }
        }
    }
    
    struct ColorNames {
        
        struct ViewColors {
            static let backgroundBlue = "BackgroundBlue"
            static let borderBlue = "BorderBlue"
            static let colCellBackgroundBlue = "ColCellBackgroundBlue"
            static let tabCellBackgroundBlue = "TabCellBackgroundBlue"
            
        }
        
        struct TemperatureColors {
            static let hot = "Hot"
            static let cold = "Cold"
        }
        
    }
}
