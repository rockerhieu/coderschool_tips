//
//  ViewController.swift
//  tips
//
//  Created by Hieu Rocker on 2/24/16.
//  Copyright © 2016 Hieu Rocker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    var tipPercentages = [Constants.DEFAULT_TIP_BAD, Constants.DEFAULT_TIP_NORMAL, Constants.DEFAULT_TIP_GOOD]
    let settings = Settings()
    let formatter = NSNumberFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.numberStyle = .DecimalStyle
        formatter.locale = NSLocale.currentLocale()

        if (settings.billAmountTimestamp + Constants.BILL_REMEMBER_WITHIN >= NSDate().timeIntervalSince1970) {
            billFieldAmount = settings.billAmount
        }
        
        billField.becomeFirstResponder()
        billField.selectAll(billField)
    }
    
    override func viewWillAppear(animated: Bool) {
        tipPercentages = [settings.tipPercentageForBadQuality, settings.tipPercentageForNormalQuality, settings.tipPercentageForGoodQuality]

        for index in 0...tipPercentages.count-1 {
            tipControl.setTitle("\(tipPercentages[index])%", forSegmentAtIndex: index)
        }
        tipControl.selectedSegmentIndex = settings.tipControlIndex
        updateTip()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        saveBillAmount();
        updateTip();
    }
    
    func saveBillAmount() {
        settings.billAmount = billFieldAmount
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func onTipPercentageChanged(sender: AnyObject) {
        updateTip()
    }
    
    func updateTip() {
        settings.tipControlIndex = tipControl.selectedSegmentIndex
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let billAmount = billFieldAmount
        let tip = billAmount * Double(tipPercentage) / 100.0
        let total = billAmount + tip
        
        tipLabel.text = tip.asLocaleCurrency
        totalLabel.text = total.asLocaleCurrency
    }
    
    var billFieldAmount:Double {
        get {
            let number = formatter.numberFromString(billField.text!);
            if number != nil {
                return number!.doubleValue
            }
            return 0.0
        }
        set {
            billField.text = formatter.stringFromNumber(newValue)
        }
    }
}

