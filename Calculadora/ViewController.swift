//
//  ViewController.swift
//  Calculadora
//
//  Created by Rayana Prata Neves on 08/10/21.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    var numberOfScreen: Double = 0
    
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
        labelValue.text = labelValue.text! + String((sender as AnyObject).tag)
        numberOfScreen = Double(labelValue.text!)!
    }
    
    @IBAction func allCancel(_ sender: Any) {
        labelValue.text = "0"
    }
    
    // MARK: Methods
    private func setupUI() {
        
    }
}

