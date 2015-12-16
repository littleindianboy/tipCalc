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
    @IBOutlet var tipBackground: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional Setup
        let defaults = NSUserDefaults()
        tipValue.selectedSegmentIndex = defaults.integerForKey("defaultTip")
        // Set Initial Values
        tipLabel.text = "$0.00"
        totalAmount.text = "$0.00"

        // Auto select text field on load
        billField.becomeFirstResponder()
        tipValue.alpha = 0
        tipLabel.alpha = 0
        totalAmount.alpha = 0

        UIView.animateWithDuration(0.25, animations: {
            self.tipLabel.alpha = 1;
        })
        
        UIView.animateWithDuration(0.5, animations: {
            self.tipValue.alpha = 1;
        })
        
        UIView.animateWithDuration(0.75, animations: {
            self.totalAmount.alpha = 1;
        })
    }
    
    
    //    Setting Values
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults()
        tipValue.selectedSegmentIndex = defaults.integerForKey("defaultTip")
        preferredStatusBarStyle()
        //        Styles
        self.navigationController!.navigationBar.barTintColor = UIColor(red:0.37, green:0.21, blue:0.69, alpha:1.0)
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        
        // Set the tip background color
        setTipBackgroundColor()
        
        // Call main function
        onEditingChanged(self)
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
    
//    Changes the background color behind the current tip value based on the chosen tip percentage
    func setTipBackgroundColor() {
        UIView.animateWithDuration(0.4, animations: {
            if (self.tipValue.selectedSegmentIndex == 0) {
                self.tipBackground.backgroundColor = UIColor(red:0.33, green:0.43, blue:1.00, alpha:1.0)
            } else if (self.tipValue.selectedSegmentIndex == 1) {
                self.tipBackground.backgroundColor = UIColor(red:0.26, green:0.63, blue:0.28, alpha:1.0)
            } else {
                self.tipBackground.backgroundColor = UIColor(red:0.94, green:0.33, blue:0.31, alpha:1.0)
            }
        })
    }

//    Dynamic change of text field
    @IBAction func onEditingChanged(sender: AnyObject) {
        
//        Animate Tip Background based on tip amount
        setTipBackgroundColor()
        
        // check and select the tip value from history
        // Selected Tip Percents
        let tipPercentages = [0.18, 0.20, 0.22]
        let tipPercent = tipPercentages[tipValue.selectedSegmentIndex]
        // Bill calculations
        let billAmount =  NSString(string: billField.text!).doubleValue
        let tip = Double(billAmount * tipPercent)
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalAmount.text = String(format: "$%.2f", total)
    }

}

