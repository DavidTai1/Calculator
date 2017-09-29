//
//  ViewController.swift
//  Calculator
//
//  Created by David on 2017-09-26.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    // white status bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    // display
    @IBOutlet weak var display: UILabel!
    
    // UserTyping
    private var UserTyping = false
    
    // CalModel
    private var calmodel = CalModel()
    
    // 0-9, 10 buttons
    @IBAction func numbers(_ sender: UIButton) {
        if let touched = sender.currentTitle{
            if UserTyping{
                display!.text = display.text! + touched
            }else{
                display.text = touched
                UserTyping = true
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
        if let op = sender.currentTitle {
            if op == "c"{
                if displayvalue == 0{
                    calmodel.Operations("c_all")
                }else{
                    calmodel.Operations(op)
                }
                displayvalue = 0
                UserTyping = false
            }
        }
        if UserTyping{
            calmodel.setOperand(displayvalue)
            UserTyping = false
        }
        if let op = sender.currentTitle{
            calmodel.Operations(op)
        }
        if let result = calmodel.result{
            displayvalue = result
        }
    }

    
    

}

