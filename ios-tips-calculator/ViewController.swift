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

    func getPercentages() -> [Double] {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let percentage0 =  defaults.doubleForKey("percentage0")
        let percentage1 =  defaults.doubleForKey("percentage1")
        let percentage2 =  defaults.doubleForKey("percentage2")
        return [percentage0, percentage1, percentage2]
    }
    
    func setValues() -> Void {
        let percentages:[Double] = getPercentages()
        let billAmount = NSString(string: billField.text!).doubleValue
        let percentage = percentages[tipControl.selectedSegmentIndex]
        let tip = billAmount * percentage / 100
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        setValues()
    }


    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
        setTipPercentages()
        setValues()
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    func setTipPercentages() -> Void {
        let percentages : [Double] = getPercentages()
        for percentage in percentages {
            let value = NSInteger(percentage)
            tipControl.setTitle("\(value)%", forSegmentAtIndex: percentages.indexOf(percentage)!)
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }


}
