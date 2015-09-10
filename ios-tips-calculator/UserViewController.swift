//
//  UserViewController.swift
//  ios-tips-calculator
//
//  Created by Yayang Tian on 9/9/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var percentageLabel: UILabel!
   
    func setTipPercentages() -> Void {
        let percentages : [Double] = getPercentages()
        for percentage in percentages {
            tipControl.setTitle("\(percentage)", forSegmentAtIndex: percentages.indexOf(percentage)!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setTipPercentages()
        setSliderValue()
        
    }
    
    func getPercentages() -> [Double] {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let percentage0 =  defaults.doubleForKey("percentage0") / 100
        let percentage1 =  defaults.doubleForKey("percentage1") / 100
        let percentage2 =  defaults.doubleForKey("percentage2") / 100
        return [percentage0, percentage1, percentage2]
    }
    
    
    func setSliderValue() {
        let index = tipControl.selectedSegmentIndex
        let title = tipControl.titleForSegmentAtIndex(index)
        let percentage = NSString(string: title!).floatValue
        tipSlider.setValue(percentage, animated: true)
    }
    
    func getSegmentFloatValue(index: Int) -> Float {
        let title = tipControl.titleForSegmentAtIndex(index)
        let percentage = NSString(string: title!).floatValue
        return percentage
    }
    
    func save(array: [Float]) -> Void {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(array, forKey: "percentages")
            defaults.synchronize()
    }
    
    @IBAction func onPercentageEditingChanged(sender: AnyObject) {
        setSliderValue()
    }
    
   
    @IBAction func onSliderValueChanged(sender: UISlider) {
        let currentValue = Int(sender.value)
        
        let index = tipControl.selectedSegmentIndex
        tipControl.setTitle("\(currentValue)%", forSegmentAtIndex: index)
    }

    
    @IBAction func onBackClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onSaveClick(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        print(getSegmentFloatValue(0))
        
        
        defaults.setObject(getSegmentFloatValue(0), forKey: "percentage0")
        defaults.setObject(getSegmentFloatValue(1), forKey: "percentage1")
        defaults.setObject(getSegmentFloatValue(2), forKey: "percentage2")
        
        print("saved")
        dismissViewControllerAnimated(true, completion: nil)
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
