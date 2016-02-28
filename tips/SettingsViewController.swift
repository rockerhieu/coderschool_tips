//
//  SettingsViewController.swift
//  tips
//
//  Created by Hieu Rocker on 2/24/16.
//  Copyright © 2016 Hieu Rocker. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var badField: UITextField!
    @IBOutlet weak var normalField: UITextField!
    @IBOutlet weak var goodField: UITextField!

    let settings = Settings()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        badField.text = "\(settings.tipPercentageForBadQuality)";
        normalField.text = "\(settings.tipPercentageForNormalQuality)";
        goodField.text = "\(settings.tipPercentageForGoodQuality)";
    }
    
    @IBAction func onSaveClicked(sender: AnyObject) {
        settings.tipPercentageForBadQuality = NSString(string: badField.text!).integerValue
        settings.tipPercentageForNormalQuality = NSString(string: normalField.text!).integerValue
        settings.tipPercentageForGoodQuality = NSString(string: goodField.text!).integerValue
        self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
