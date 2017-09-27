//
//  CalModel.swift
//  Calculator
//
//  Created by David on 2017-09-26.
//  Copyright © 2017 David. All rights reserved.
//

import Foundation
// helper functions
func changeSign(num: Double) -> Double{
    return -num
}
func multiply(num1: Double, num2: Double) -> Double{
    return num1 * num2
}
func divide(num1: Double, num2: Double) -> Double{
    return num1 / num2
}
func minuse(num1: Double, num2: Double) -> Double{
    return num1 - num2
}



struct CalModel{
    
    // functions
    private enum functions{
        case constant(Double)
        case unaryfun((Double) -> Double)
        case binaryfun((Double,Double)-> Double)
        case equal
        case _clear
        case _clear_all
    }
    // operations
    private var ops: Dictionary<String,functions> = [
    "π": functions.constant(Double.pi),
    "e": functions.constant(M_E),
    "±": functions.unaryfun(-),
    "cos": functions.unaryfun(cos),
    "sin": functions.unaryfun(sin),
    "√": functions.unaryfun(sqrt),
    "x": functions.binaryfun(multiply),
    "+": functions.binaryfun(+),
    "=": functions.equal,
    "c": functions._clear,
    "c_all": functions._clear_all,
    "÷": functions.binaryfun(divide),
    "-": functions.binaryfun(minuse)
    ]
    mutating private func _clear_all(){
        PendingBOP = nil
        accumulator = nil
    }
    mutating private func _clear(){
        accumulator = nil
    }
    // accumulator for calculator
    private var accumulator: Double?
    
    // perform op
    mutating func Operations(_ op: String){
        if let operations = ops[op]{
            switch operations{
            case .constant(let value):
                accumulator = value
            case .unaryfun(let fun):
                if accumulator != nil{
                    accumulator = fun(accumulator!)
                }
            case .binaryfun(let fun):
                if PendingBOP != nil && accumulator != nil{
                    accumulator = PendingBOP?.perform(with: accumulator!)
                    PendingBOP = PendingBinaryOP(function: fun,firstOperand: accumulator!)
                }
                else if accumulator != nil{
                    PendingBOP = PendingBinaryOP(function: fun,firstOperand: accumulator!)
                    accumulator = nil
                }
            case ._clear:
                _clear()
            case ._clear_all:
                _clear_all()
            case .equal:
                equals()
                
            }
        }
    }
    // for binary operations
    mutating private func equals(){
        if PendingBOP != nil && accumulator != nil{
            accumulator = PendingBOP?.perform(with: accumulator!)
            PendingBOP = nil
        }
        
    }
    private var PendingBOP: PendingBinaryOP?
    
    private struct PendingBinaryOP{
        let function: (Double,Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double)-> Double{
            return function(firstOperand,secondOperand)
        }
    }
    mutating func setOperand(_ operand: Double){
        accumulator = operand
    }
    var result: Double?{
        get{
            return accumulator
        }
    }
}
