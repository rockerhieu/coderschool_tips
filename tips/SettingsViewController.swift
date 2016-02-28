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
        badField.text = "\(defaults.integerForKey(Constants.KEY_TIP_BAD))";
        normalField.text = "\(defaults.integerForKey(Constants.KEY_TIP_NORMAL))";
        goodField.text = "\(defaults.integerForKey(Constants.KEY_TIP_GOOD))";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSaveClicked(sender: AnyObject) {
        defaults.setInteger(NSString(string: badField.text!).integerValue, forKey: Constants.KEY_TIP_BAD)
        defaults.setInteger(NSString(string: normalField.text!).integerValue, forKey: Constants.KEY_TIP_NORMAL)
        defaults.setInteger(NSString(string: goodField.text!).integerValue, forKey: Constants.KEY_TIP_GOOD)
        defaults.synchronize()
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
