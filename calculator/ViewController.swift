//
//  ViewController.swift
//  calculator
//
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var operation = 0
    
    
    @IBOutlet weak var mainField: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            
            mainField.text = String(sender.tag)
            
            guard let currentLabelNumber = Double(mainField.text!) else {
                return
            }
            
            numberOnScreen = currentLabelNumber
            
            performingMath = false
            
        }
            
        else {
            
            guard let currentLabelText = mainField?.text! else {
                return
            }
            
            let buttonNumber = String(sender.tag)
            
            if currentLabelText == "0" {
                mainField.text = buttonNumber
            } else {
                mainField.text = currentLabelText + buttonNumber
            }
            
            guard let newLabelNumber = Double(mainField.text!) else {
                return
            }
            
            numberOnScreen = newLabelNumber
        }
    }
    
    
    @IBAction func mathButton(_ sender: UIButton) {
        if mainField.text != "" && sender.tag != 11 && sender.tag != 16{
            
            if let prevLabelNumber = Double(mainField.text!) {
                previousNumber = prevLabelNumber
            }
            
            switch sender.tag {
            case 12:
                mainField.text = "/"
                
            case 13:
                mainField.text = "x"
            
            case 14:
                mainField.text = "-"
            
            case 15:
                mainField.text = "+"
            
            default:
                return
            }
            
            operation = sender.tag
            
            performingMath = true;
            
        }
            
        else if sender.tag == 16 {
            
            switch operation {
            case 12:
                mainField.text = String(previousNumber / numberOnScreen)
                
            case 13:
                mainField.text = String(previousNumber * numberOnScreen)
            
            case 14:
                mainField.text = String(previousNumber - numberOnScreen)
            
            case 15:
                mainField.text = String(previousNumber + numberOnScreen)
                
            default:
                return
            }
            
        }
            
        else if sender.tag == 11{
            
            mainField.text = "0"
            
            previousNumber = 0;
            
            numberOnScreen = 0;
            
            operation = 0;
            
            performingMath = false
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

