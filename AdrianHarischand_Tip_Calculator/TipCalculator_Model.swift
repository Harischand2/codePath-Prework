//
//  TipCalculator_Model.swift
//  AdrianHarischand_Tip_Calculator
//
//  Created by Adrian Harischand on 8/1/22.
//

import Foundation
class TipCalculator_Model {
    
    // initializing and declaring
    var amountBeforeTax: Double = 0
    var tipAmount: Double = 0
    var tipPercentage: Double = 0
    var totalAmount: Double = 0
    
    // initializer with parameters of non constant variable
    init (amountBeforeTax: Double , tipPercentage: Double)
    {
        self.amountBeforeTax = amountBeforeTax
        self.tipPercentage = tipPercentage
    }
    
    // function that calculate tip amount for each person
    // and the total bill
    func calculateTip ()
    {
        tipAmount = amountBeforeTax * tipPercentage
        totalAmount = tipAmount + amountBeforeTax
        
    }
    
    
    
}
