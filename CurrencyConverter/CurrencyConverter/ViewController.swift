//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

// Currency Enum
enum Currency {
    case cad
    case mxn
}

//Setting up a default currency
var currency: Currency = .cad


class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        
        guard let dollarString = fromCurrencyTextField.text else {
            return
        }
        
        guard let dollarDouble = Double(dollarString) else {
            print("Invalid number")
            return
        }
        
        
        // Using the Number Formatter
        let convertedDollar = convert(dollarDouble)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
      
        toCurrencyTextField.text = formatter.string(from: convertedDollar as NSNumber) ?? ""
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        
        sender.isSelected.toggle()
        mxnButton.isSelected.toggle()
        
        if cadButton.isSelected {
            currency = .cad
            toCurrencyLabel.text = "CAD Currency"
        }
        
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        
        sender.isSelected.toggle()
        cadButton.isSelected.toggle()
        
        if mxnButton.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "MXN Currency"
        }
        
    }
    
    
    // MARK: - Helper Methods
    
    func convert(_ dollars: Double) -> Double {
        
        if currency == .cad {
            let canDollar = 1.33
            let convertion = canDollar * dollars
            
            return convertion
        }
        else {
            let mxnDollar = 19.70
            let convertion = mxnDollar * dollars
            
            return convertion
        }
    }
}


