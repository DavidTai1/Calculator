//
//  ViewController.swift
//  Calculator
//
//  Created by David on 2017-09-26.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    // display
    @IBOutlet weak var display: UILabel!
    
    // CalModel
    private var calmodel = CalModel()
    
    // 0-9, 10 buttons
    @IBAction func numbers(_ sender: UIButton) {
        if let touched = sender.currentTitle{
            if !(Int(displayvalue) == 0 && Int(touched) == 0){
                display!.text = String(displayvalue) + touched
            }
        }
        else{
            print("ERROR: numbers title not set")
        }
    }
    // get/set display
    var displayvalue: Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    // operations
    @IBAction func Operations(_ sender: UIButton) {
        calmodel.setOperand(displayvalue)
        if let op = sender.currentTitle{
            calmodel.Operations(op)
        }
        if let result = calmodel.result{
            displayvalue = result
        }
    }

    
    

}

