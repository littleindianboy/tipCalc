//
//  SettingsViewController.swift
//  tipCalc
//
//  Created by Saagar Varu on 12/14/15.
//  Copyright © 2015 Saagar Varu. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {

    
    @IBOutlet var defaultTip: UISegmentedControl!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
    }
    
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaultTip.selectedSegmentIndex = defaults.integerForKey("defaultTip")
    }
    
    @IBAction func changeDefaultTip(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTip.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
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
