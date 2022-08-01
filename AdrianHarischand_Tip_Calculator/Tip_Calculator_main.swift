//
//  Tip_Calculator_main.swift
//  AdrianHarischand_Tip_Calculator
//
//  Created by Adrian Harischand on 8/1/22.
//

import UIKit
class Tip_Calculator_main : UIViewController
{
    
    @IBOutlet weak var amountBeforeTaxTXT : UITextField!
    
    @IBOutlet weak var tipPercentageLabel : UILabel!
    
    @IBOutlet weak var tipPercentageTXT: UITextField!
    
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    
    @IBOutlet weak var eachPersonAmountLabel: UILabel!
    
    @IBOutlet weak var totalBillLabel : UILabel!
    
    
    
    
    // create an instance of the TipCalculator_Model class
    var tipCalculator = TipCalculator_Model(amountBeforeTax: 0, tipPercentage: 0)
    
    // have keyboard pop up and have the amountbeforetax text field be my first responder
    override func viewDidLoad() {
        super.viewDidLoad()
        amountBeforeTaxTXT.becomeFirstResponder()
    }
    
    // helper method that get the tip percentage and the amountbefore tax
    // and then feed the info to the calculateTip function located in
    // the class TipCalculator_Model
    func calculateBill()
    {
        let getTipPercentage = (tipPercentageTXT.text! as NSString).doubleValue
        let getAmountBeforeTax = (amountBeforeTaxTXT.text! as NSString).doubleValue
        tipCalculator.tipPercentage = getTipPercentage/100
        tipCalculator.amountBeforeTax = getAmountBeforeTax
        tipCalculator.calculateTip()
        //calling updateUI so that it can make adjustments
        updateUI()
    }
    
    // updater method that format the total Bill and each people's fee
    func updateUI()
    {
        
        let numberOfPeople: Int = Int (numberOfPeopleSlider.value)
        totalBillLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount)
        eachPersonAmountLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount / Double(numberOfPeople))
        
        
    }
    
    
    //  As the slider moves it changes and display the number of people
    // and also to get right away calculation of the totalBill and each person fee
    @IBAction func numberOfPeopleSliderValueChanged ( sender: Any)
    {
        
        numberOfPeopleLabel.text = "SPLIT: \(Int(numberOfPeopleSlider.value))"
        calculateBill()
    }
    
    // connects the UI to the code and when changes occured in the
    // amountBeforetax TEXT FIELD it sends the info so that
    // new calculation can be made
    @IBAction func amountBeforeTaxTXTChanged ( sender: Any)
    {
        calculateBill()
        
    }
    
    // connects the UI to the code and when changes occured in the
    // tipPercentage TEXT FIELD it sends the info so that
    // new calculation can be made
  @IBAction func tipPercentageChanged( sender: Any)
   {
       calculateBill()
    }
    
    
    // resets the UI so that it is easier for the user to make quick changes
    @IBAction func Reset(_ sender: Any)
       {
         
             tipCalculator.tipPercentage = 0
             tipCalculator.amountBeforeTax = 0
             tipCalculator.calculateTip()
             tipPercentageTXT.text = "0.00"
             amountBeforeTaxTXT.text = "0.00"
             numberOfPeopleSlider.value = 1
             numberOfPeopleLabel.text = "SPLIT: 1"
             updateUI()
             
             
        
       }
    }
  
    
    
    
    
