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
    var tipPercentages = [15, 20, 25]
    let defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        if (defaults.integerForKey("tip_bad") == 0) {
            defaults.setInteger(15, forKey: "tip_bad")
            defaults.setInteger(20, forKey: "tip_normal")
            defaults.setInteger(25, forKey: "tip_good")
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        let tipPercentageBad = defaults.integerForKey("tip_bad")
        let tipPercentageNormal = defaults.integerForKey("tip_normal")
        let tipPercentageGood = defaults.integerForKey("tip_good")
        tipPercentages = [tipPercentageBad, tipPercentageNormal, tipPercentageGood]

        tipControl.setTitle("\(tipPercentageBad)%", forSegmentAtIndex: 0)
        tipControl.setTitle("\(tipPercentageNormal)%", forSegmentAtIndex: 1)
        tipControl.setTitle("\(tipPercentageGood)%", forSegmentAtIndex: 2)
        tipControl.selectedSegmentIndex = defaults.integerForKey("tip_index")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateTip();
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func onTipPercentageChanged(sender: AnyObject) {
        updateTip()
    }
    
    func updateTip() {
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: "tip_index")
        defaults.synchronize()
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * Double(tipPercentage) / 100.0
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

