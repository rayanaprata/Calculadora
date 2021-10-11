//
//  ViewController.swift
//  Calculadora
//
//  Created by Rayana Prata Neves on 08/10/21.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var operation = 0
    
    // MARK: Outlets
    @IBOutlet weak var labelValue: UILabel!
    
    // MARK: Initialization
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: Actions
    @IBAction func numbers(_ sender: Any) {
        
        if performingMath {
            labelValue.text = String((sender as AnyObject).tag)
            
            guard let labelVal = labelValue.text else { return }
            numberOnScreen = Double(labelVal) ?? 0
            performingMath = false
        } else {
            guard let label = labelValue.text else { return }
            labelValue.text = label + String((sender as AnyObject).tag)
            
            guard let value = labelValue.text else { return }
            
            guard let doubleLabel = Double(value) else { return }
            numberOnScreen = doubleLabel
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if labelValue.text != "" {
            guard let labelVal = labelValue.text else { return }
            previousNumber = Double(labelVal) ?? 0
            
            switch sender.tag {
            case 11:
                labelValue.text = ""
                previousNumber = 0
                numberOnScreen = 0
                operation = 0
            case 12:
                print("divide")
                labelValue.text = "÷"
                operation = sender.tag
                performingMath = true
            case 13:
                print("multiply")
                labelValue.text = "×"
                operation = sender.tag
                performingMath = true
            case 14:
                print("minus")
                labelValue.text = "-"
                operation = sender.tag
                performingMath = true
            case 15:
                print("plus")
                labelValue.text = "+"
                operation = sender.tag
                performingMath = true
            case 16:
                switch operation {
                case 12:
                    labelValue.text = String(format: "%.0f", previousNumber / numberOnScreen)
                case 13:
                    labelValue.text = String(format: "%.0f", previousNumber * numberOnScreen)
                case 14:
                    labelValue.text = String(format: "%.0f", previousNumber - numberOnScreen)
                case 15:
                    labelValue.text = String(format: "%.0f", previousNumber + numberOnScreen)
                default:
                    break
                }
            default:
                break
            }
        }
    }
    
    
    // MARK: Methods
    private func setupUI() {
        labelValue.text = ""
    }
}

