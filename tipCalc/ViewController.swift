//
//  ViewController.swift
//  tipCalc
//
//  Created by Saagar Varu on 12/14/15.
//  Copyright © 2015 Saagar Varu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    Outlets
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var tipValue: UISegmentedControl!
    @IBOutlet var totalAmount: UILabel!
    @IBOutlet var billField: UITextField!
    
//    Setting Values
    override func viewWillAppear(animated: Bool) {
//        Set Initial Values
        tipLabel.text = "$0.00"
        totalAmount.text = "$0.00"
        let defaults = NSUserDefaults()
        tipValue.selectedSegmentIndex = defaults.integerForKey("defaultTip")
        preferredStatusBarStyle()
//        Styles
        self.navigationController!.navigationBar.barTintColor = UIColor(red:0.40, green:0.23, blue:0.72, alpha:1.0)
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional Setup
        let defaults = NSUserDefaults()
        tipValue.selectedSegmentIndex = defaults.integerForKey("defaultTip")
        print(self)
        // Auto select text field on load
        billField.becomeFirstResponder()
        tipValue.alpha = 0
        tipLabel.alpha = 0
        totalAmount.alpha = 0

        UIView.animateWithDuration(0.25, animations: {
            self.tipValue.alpha = 1;
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Changing Status Bar
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
//  Hide numpad
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

//    Dynamic change of text field
    @IBAction func onEditingChanged(sender: AnyObject) {
        UIView.animateWithDuration(0.5, animations: {
            self.tipLabel.alpha = 1
            self.totalAmount.alpha = 1
        })
        // check and select the tip value from history
        // Selected Tip Percents
        let tipPercentages = [0.18, 0.20, 0.22]
        let tipPercent = tipPercentages[tipValue.selectedSegmentIndex]
        // Bill calculations
        let billAmount =  NSString(string: billField.text!).doubleValue
        var tip = Double(billAmount * tipPercent)
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalAmount.text = String(format: "$%.2f", total)
    }

}

