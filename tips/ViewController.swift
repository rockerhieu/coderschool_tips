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
    let defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        if (defaults.integerForKey(Constants.KEY_TIP_BAD) == 0) {
            defaults.setInteger(Constants.DEFAULT_TIP_BAD, forKey: Constants.KEY_TIP_BAD)
            defaults.setInteger(Constants.DEFAULT_TIP_NORMAL, forKey: Constants.KEY_TIP_NORMAL)
            defaults.setInteger(Constants.DEFAULT_TIP_GOOD, forKey: Constants.KEY_TIP_GOOD)
        }
        
        let lastBillTimestamp = defaults.doubleForKey(Constants.KEY_BILL_TS)
        if (lastBillTimestamp + Constants.BILL_REMEMBER_WITHIN >= NSDate().timeIntervalSince1970) {
            billField.text = "\(defaults.doubleForKey(Constants.KEY_BILL).asLocaleCurrency)"
        }
        
        billField.becomeFirstResponder()
        billField.selectAll(billField)
    }
    
    override func viewWillAppear(animated: Bool) {
        let tipPercentageBad = defaults.integerForKey(Constants.KEY_TIP_BAD)
        let tipPercentageNormal = defaults.integerForKey(Constants.KEY_TIP_NORMAL)
        let tipPercentageGood = defaults.integerForKey(Constants.KEY_TIP_GOOD)
        tipPercentages = [tipPercentageBad, tipPercentageNormal, tipPercentageGood]

        tipControl.setTitle("\(tipPercentageBad)%", forSegmentAtIndex: 0)
        tipControl.setTitle("\(tipPercentageNormal)%", forSegmentAtIndex: 1)
        tipControl.setTitle("\(tipPercentageGood)%", forSegmentAtIndex: 2)
        tipControl.selectedSegmentIndex = defaults.integerForKey(Constants.KEY_TIP_INDEX)
        updateTip()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        saveBillAmount();
        updateTip();
    }

    @IBAction func onEditingEnded(sender: AnyObject) {
        billField.text = "\(NSString(string: billField.text!).doubleValue.asLocaleCurrency)"
    }
    
    func saveBillAmount() {
        let billAmount = NSString(string: billField.text!).doubleValue
        defaults.setDouble(billAmount, forKey: Constants.KEY_BILL)
        defaults.setDouble(NSDate().timeIntervalSince1970, forKey: Constants.KEY_BILL_TS)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func onTipPercentageChanged(sender: AnyObject) {
        updateTip()
    }
    
    func updateTip() {
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: Constants.KEY_TIP_INDEX)
        defaults.synchronize()
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * Double(tipPercentage) / 100.0
        let total = billAmount + tip
        
        tipLabel.text = tip.asLocaleCurrency
        totalLabel.text = total.asLocaleCurrency
    }
}

