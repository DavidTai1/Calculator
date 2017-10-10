//
//  SecondViewController.swift
//  Calculator
//
//  Created by David on 2017-09-29.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit



class SecondViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var PassBoard: UITextField!

    @IBAction func Submit(_ sender: UIButton) {
        // using guard learned from https://ericcerney.com/swift-guard-statement/
        // improve functionality & readbility, changes for other statements later
        guard let new_pass = PassBoard.text else {
            print("new_pass not set")
            print("password not changed")
            return
        }
        // check if it is a valid password
        var mutate = true
        for i in new_pass.characters.indices{
            if new_pass[i] != "."{
                guard let test = Int(String(new_pass[i])) else{
                    mutate = false
                    break
                }
            }
        }
        if mutate{
            UserDefaults.standard.set(new_pass, forKey: "PASS")
            self.PassBoard.text = "Password has been changed!"
        }
        else{
            PassWord_Alert()
            //self.PassBoard.text = "Numbers 0-9 and . only"
        }
    }
    // hide keyboard -> https://www.youtube.com/watch?v=l-Uup2lKw1Y
    override func viewDidLoad() {
        super.viewDidLoad()
        self.PassBoard.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // hide keyboard when touching outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let new_pass = PassBoard.text else {
            print("new_pass not set")
            print("password not changed")
            return (true)
        }
        var mutate = true
        for i in new_pass.characters.indices{
            if new_pass[i] != "."{
                guard let test = Int(String(new_pass[i])) else{
                    mutate = false
                    break
                }
            }
        }
        if mutate{
            UserDefaults.standard.set(new_pass, forKey: "PASS")
            self.PassBoard.text = "Password has been changed!"
        }
        else{
            PassWord_Alert()
        }
        PassBoard.resignFirstResponder()
        return (true)
    }
    
    // Error message
    func PassWord_Alert(){
        let alert = UIAlertController()
        alert.title = "Error"
        alert.message = "Password should only contain:\nNumbers 0-9 and \".\" only"
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }

}
