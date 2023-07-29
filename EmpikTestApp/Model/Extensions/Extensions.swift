//
//  Extensions.swift
//  EmpikTestApp
//
//  Created by Michael on 7/29/23.
//

import Foundation

extension Double {
    func roundBy(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
