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

    let defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        badField.text = "\(defaults.integerForKey("tip_bad"))";
        normalField.text = "\(defaults.integerForKey("tip_normal"))";
        goodField.text = "\(defaults.integerForKey("tip_good"))";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSaveClicked(sender: AnyObject) {
        defaults.setInteger(NSString(string: badField.text!).integerValue, forKey: "tip_bad")
        defaults.setInteger(NSString(string: normalField.text!).integerValue, forKey: "tip_normal")
        defaults.setInteger(NSString(string: goodField.text!).integerValue, forKey: "tip_good")
        self.navigationController?.popViewControllerAnimated(true)
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
