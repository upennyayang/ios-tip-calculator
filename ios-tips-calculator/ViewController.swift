//
//  ViewController.swift
//  ios-tips-calculator
//
//  Created by Yayang Tian on 9/9/15.
//  Copyright © 2015 Walmart Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var percentageControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let percentages = [0.18, 0.20, 0.22]
        let billAmount = NSString(string: billField.text!).doubleValue
        let percentage = percentages[tipControl.selectedSegmentIndex]
        let tip = billAmount * percentage
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }


    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}
