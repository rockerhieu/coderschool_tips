//
//  Float.swift
//  tips
//
//  Created by Hieu Rocker on 2/28/16.
//  Copyright © 2016 Hieu Rocker. All rights reserved.
//

import Foundation

extension Double {
    var asLocaleCurrency:String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        return formatter.stringFromNumber(self)!
    }
}