//
//  ViewController.swift
//  Calculator
//
//  Created by Russell Gordon on 4/30/17.
//  Copyright © 2017 Russell Gordon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //outlet to display(label)
    @IBOutlet weak var LabelDisplay: UILabel!
    //create an instance (object) of the calculator class
    var model = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //  clear the contents of the label
        LabelDisplay.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onePressed(_ sender: Any) {
        model.addToNewValue(digit: "1")
        LabelDisplay.text = model.providedValue
    }
    @IBAction func twoPressed(_ sender: Any) {
        model.addToNewValue(digit: "2")
        LabelDisplay.text = model.providedValue
    }
    
    @IBAction func threePressed(_ sender: Any) {
        model.addToNewValue(digit: "3")
        LabelDisplay.text = model.providedValue
    }
    @IBAction func fourPressed(_ sender: Any) {
        model.addToNewValue(digit: "4")
        LabelDisplay.text = model.providedValue
    }
    
    @IBAction func fivePressed(_ sender: Any) {
        model.addToNewValue(digit: "5")
        LabelDisplay.text = model.providedValue
    }
    
    @IBAction func sixPressed(_ sender: Any) {
        model.addToNewValue(digit: "6")
        LabelDisplay.text = model.providedValue
    }
    
    @IBAction func sevenPressed(_ sender: Any) {
        model.addToNewValue(digit: "7")
        LabelDisplay.text = model.providedValue
    }
    
    @IBAction func eightPressed(_ sender: Any) {
        model.addToNewValue(digit: "8")
        LabelDisplay.text = model.providedValue
    }
    
    @IBAction func ninePressed(_ sender: Any) {
        model.addToNewValue(digit: "9")
        LabelDisplay.text = model.providedValue
    }
    
    @IBAction func zeroPressed(_ sender: Any) {
        model.addToNewValue(digit: "0")
        LabelDisplay.text = model.providedValue
    }
    
    @IBAction func multiply(_ sender: Any) {
        model.multiply()
    }
    
    @IBAction func divide(_ sender: Any) {
        model.divide()
    }
    //provided value is not changing to computed value
    @IBAction func subtract(_ sender: Any) {
        
        model.subtract()
    }
    
    @IBAction func add(_ sender: Any) {
        model.add()
    }
    @IBAction func clear(_ sender: Any) {
        model.clear()
        LabelDisplay.text = model.providedValue
    }
    @IBAction func plusMinus(_ sender: Any) {
        //    model.plusMinus()
        
        if model.computedValue == nil{
            model.plusMinus()
            LabelDisplay.text = model.providedValue
        }else{
            model.plusMinus()
            if model.providedValue == ""{
                LabelDisplay.text = String(describing: model.computedValue!)
            }else{
                model.plusMinus()
                LabelDisplay.text = model.providedValue
            }
        }
    }
    
    @IBAction func percentage(_ sender: Any) {

            model.percentage()
        equals("")
    }
    
    @IBAction func decimal(_ sender: Any) {
        model.decimal()
        LabelDisplay.text = model.providedValue
    }
    
    @IBAction func equals(_ sender: Any) {
        model.equals()
        if model.computedValue != nil {
            LabelDisplay.text = String(format: "%g", model.computedValue!)
        }
    }
}

