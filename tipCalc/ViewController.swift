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
    
    override func viewWillAppear(animated: Bool) {
        tipLabel.text = "~"
        totalAmount.text = "$0.00"
        let defaults = NSUserDefaults()
        tipValue.selectedSegmentIndex = defaults.integerForKey("defaultTip")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Initializing values
        let defaults = NSUserDefaults()
        print(defaults.integerForKey("topChoice"))
        
        tipValue.selectedSegmentIndex = defaults.integerForKey("defaultTip")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
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

