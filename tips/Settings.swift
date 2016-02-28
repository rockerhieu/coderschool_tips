//
//  Settings.swift
//  tips
//
//  Created by Hieu Rocker on 2/28/16.
//  Copyright © 2016 Hieu Rocker. All rights reserved.
//

import Foundation

class Settings {
    private let defaults = NSUserDefaults.standardUserDefaults()
    init() {
        if (tipPercentageForBadQuality == 0) {
            tipPercentageForBadQuality = Constants.DEFAULT_TIP_BAD
            tipPercentageForNormalQuality = Constants.DEFAULT_TIP_NORMAL
            tipPercentageForGoodQuality = Constants.DEFAULT_TIP_GOOD
        }
    }

    var tipPercentageForBadQuality:Int {
        get {
            return defaults.integerForKey(Constants.KEY_TIP_BAD)
        }
        set {
            defaults.setInteger(newValue, forKey: Constants.KEY_TIP_BAD)
        }
    }

    var tipPercentageForNormalQuality:Int {
        get {
        return defaults.integerForKey(Constants.KEY_TIP_NORMAL)
        }
        set {
            defaults.setInteger(newValue, forKey: Constants.KEY_TIP_NORMAL)
        }
    }
    
    var tipPercentageForGoodQuality:Int {
        get {
            return defaults.integerForKey(Constants.KEY_TIP_GOOD)
        }
        set {
            defaults.setInteger(newValue, forKey: Constants.KEY_TIP_GOOD)
        }
    }
    
    
    var tipControlIndex:Int {
        get {
            return defaults.integerForKey(Constants.KEY_TIP_INDEX)
        }
        set {
            defaults.setInteger(newValue, forKey: Constants.KEY_TIP_INDEX)
        }
    }

    var billAmount:Double {
        get {
            return defaults.doubleForKey(Constants.KEY_BILL)
        }
        set {
            defaults.setDouble(newValue, forKey: Constants.KEY_BILL)
            billAmountTimestamp = NSDate().timeIntervalSince1970
        }
    }
    
    var billAmountTimestamp:NSTimeInterval {
        get {
            return defaults.doubleForKey(Constants.KEY_BILL_TS)
        }
        set {
            defaults.setDouble(newValue, forKey: Constants.KEY_BILL_TS)
        }
    }
}
