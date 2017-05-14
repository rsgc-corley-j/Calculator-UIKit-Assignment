//
//  Calculator.swift
//  CalculatorTestRun
//
//  Created by Russell Gordon on 4/27/17.
//  Copyright © 2017 Russell Gordon. All rights reserved.
//

import Foundation

class Calculator {
    
    // MARK: Properties
    var providedValue : String = ""
    var computedValue : Double? = nil
    var operation : Operation? = nil
    var overflow : Double = 0
    //overflow is a variable for equations and a place to store something if need be
    
    // MARK: Initializer(s)
    
    // MARK: Method(s) a.k.a. Function(s)
    func addToNewValue(digit : String) {
        
        providedValue = providedValue + digit
        
    }
    
    /**
     Sets calculator operation to multiplication, and computes a new value, if needed.
     */
    func multiply() {
        
        // Set the operation
        operation = Operation.multiplication
        
        updateState()
    }
    
    /**
     Sets calculator operation to division, and computes a new value, if needed.
     */
    func divide() {
        
        // Set the operation
        operation = Operation.division
        
        updateState()
    }
    
    /**
     Updates calculator state.
     
     This means: what the current computed value is, what the new value provided by the user is, and whether to perform an operation on the computed value and provided value.
     */
    //turns operation too addition, and creates new value
    func add(){
        operation = Operation.addition
        updateState()
    }
    //turns operation too subtraction, and creates new value
    func subtract(){
        
        operation = Operation.subtraction
        updateState()
    }
    
    
    
    func updateState() {
        
        if computedValue == nil {
            
            // 1. When in this branch, there is no current computed value, just a new provided value.
            
            // Now then, the only thing to do is make the provided value become the computed value.
            makeProvidedValueComputedValue()
            
        } else {
            
            // 1. When in this branch, there is a current computed value.
            
            if providedValue == "" {
                
                // 2. When in this branch, there no provided value yet (an empty string: "")
                //    Only an operation has been logged (multiply, divide, et cetera).
                
                // So, do nothing.
                
            } else {
                
                // 2. When in this branch, a new provided value has been given.
                
                // So, perform the operation!
                equals()
            }
            
        }
        
    }
    
    /**
     Determine a new computed value.
     
     The current operation is performed on the computed value and the provided value.
     */
    func equals() {
        
//        if Double(providedValue) == nil {
            
 //       }else{
  //           Check operation type
            if operation == Operation.multiplication {
                computedValue = computedValue! * Double(providedValue)!
            } else if operation == Operation.division {
                computedValue = computedValue! / Double(providedValue)!
            } else if operation == Operation.addition{
                computedValue = computedValue! + Double(providedValue)!
            } else if operation == Operation.subtraction{
                computedValue = computedValue! - Double(providedValue)!
            } else if operation == Operation.percentage{
                if computedValue == nil{
                    computedValue = 0.01 * Double(providedValue)!
                }else if providedValue == ""{
                    computedValue = 0.01 * computedValue!
                }else{
                    makeProvidedValueOverflow()
                    overflow = 0.01 * overflow
                }
                
                
                
                
//           }
        }
        
        // The operation selected has been performed, so get ready to receive new operation
        // and new value
//        if operation == Operation.percentage{
//        }else{
            providedValue = ""
//        }
        operation = nil
    }
    
    /**
     Makes the computed value become whatever value the user has typed into the calculator.
     */
    func makeProvidedValueComputedValue() {
        
        computedValue = Double(providedValue)
        providedValue = ""
    }
    
    //does the exact opposite task as the previous. i used this to avoid changing a computed value to negative. i can simply use this and makeprovidedvaluecomputedvalue to standardize my way to change the pos/neg value.
    func makeComputedValueProvidedValue(){
        if computedValue == nil{
        }else{
        providedValue = String(describing: computedValue!)
        computedValue = nil
        }
    }
    
    //these functions are simply to turn the computed value back and forth from computevalue to overflow to do equations. Useful in some instances, and testing
    func makeProvidedValueOverflow(){
        overflow = Double(providedValue)!
        providedValue = ""
    }
    
    func makeOverflowProvidedValue(){
        providedValue = String(overflow)
        overflow = 0
    }
    
    func plusMinus(){
    
        
        // this section uses to overflow variable to do calculations before returning it to the code
        if providedValue == ""{
            if computedValue == nil {
            }else{
            overflow = computedValue!
            overflow = -1 * overflow
            computedValue = overflow
            }
        }else{
            overflow = Double(providedValue)!
            overflow = -1 * overflow
            providedValue = String(overflow)
        }

    }
    
    func percentage(){
//        checks if both providedvalue and computedvalue have no value with boolean operation
        if providedValue == "" && computedValue == nil{
        }else{
            if operation == Operation.addition{
        operation = Operation.percentage
            equals()
        operation = Operation.addition
                makeOverflowProvidedValue()
        }else if operation == Operation.subtraction{
                operation = Operation.percentage
                equals()
                operation = Operation.subtraction
                makeOverflowProvidedValue()
            }else if operation == Operation.multiplication{
                operation = Operation.percentage
                equals()
                operation = Operation.multiplication
                makeOverflowProvidedValue()
            }else if operation == Operation.division{
                operation = Operation.percentage
                equals()
                operation = Operation.division
                makeOverflowProvidedValue()
            }else{
                operation = Operation.percentage
                equals()
            }
            
          //simply checks the operation so that it can turn the number into a percentage before it returns it to the before stated operation

        
    }
    }
    
    func decimal(){
        //simply puts in a "." for decimal
        providedValue = providedValue + "."
        
    }
    
    
    //    func percentage{
    //    providedValue = "
    //
    //    }
    
    /**
     Resets the operation, provided value, and computed value.
     */
    func clear() {
        
        // Reset everthing
        operation = nil
        providedValue = ""
        computedValue = nil
    }
    
}
