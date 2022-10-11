//
//  ResultsExpandedViewController.swift
//  Body Fat Calculator
//
//  Created by Michael Green on 2022-07-15.
//

import UIKit
import SwiftUI

class ResultsExpandedViewController: UIViewController {

    var fatMass: Float = 0.00
    var leanMass: Float = 0.00
    var bmi: Float = 0.00
    var bfp: Float = 0.00
    var idealPercentage: Float = 0.00
    var idealFatMass: Float = 0.00
    var fatToLose: Float = 0.00
    var age: Int = 0
    var weight: Int = 0
    var sex: String = ""
    
    @IBOutlet weak var bodyFatLabel: UILabel!
    
    @IBOutlet weak var idealPercentageLabel: UILabel!
    
    @IBOutlet weak var idealFatMassLabel: UILabel!
    
    @IBOutlet weak var fatToLoseLabel: UILabel!
    
    @IBOutlet weak var leanMassLabel: UILabel!
    
    @IBOutlet weak var bmiLabel: UILabel!
    
    @IBOutlet weak var fatMassLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("ATTEMPT LOAD REVC")
        
        updateIdealFatPercentage()
        calculateIdealFatMass()
    
        bodyFatLabel.text = String(format: "%.1f", bfp);
        idealPercentageLabel.text = String(format: "%.1f", idealPercentage)
        idealFatMassLabel.text = String(format: "%.1f", idealFatMass)
        fatToLoseLabel.text = String(format: "%.1f", fatMass - idealFatMass)
        leanMassLabel.text = String(format: "%.1f", leanMass);
        bmiLabel.text = String(format: "%.1f", bmi);
        fatMassLabel.text = String(format: "%.1f", fatMass);
        
        if(bfp <= 3.00){
            categoryLabel.text = "Dangerously Lean"
            view.backgroundColor = UIColor.red;
        }
        else if(bfp >= 3.01 && bfp <= 6.00){
            categoryLabel.text = "Excessively Lean"
            view.backgroundColor = UIColor.yellow;
        }
        else if(bfp >= 6.01 && bfp <= 12.00){
            categoryLabel.text = "Very fit"
            view.backgroundColor = UIColor.systemGreen
        }
        else if(bfp >= 12.01 && bfp <= 18.01){
            categoryLabel.text = "Athletic"
            view.backgroundColor = UIColor.green
        }
        else if(bfp >= 18.01 && bfp <= 25.00){
            categoryLabel.text = "Average"
            view.backgroundColor = UIColor.yellow;
        }
        else if(bfp >= 25.00){
            categoryLabel.text = "Over-weight/ Obese"
            view.backgroundColor = UIColor.red;
        }
        
    }

    func calculateIdealFatMass(){
        idealFatMass = Float(weight) * (idealPercentage / 100)
    }
    
    func updateIdealFatPercentage(){
        if(sex == "male"){
            switch age {
                case 20,21,22,23,24: idealPercentage = 8.5
                
                case 25,26,27,28,29: idealPercentage = 10.5
                    
                case 30,31,32,33,34: idealPercentage = 12.7
                    
                case 35,36,37,38,39: idealPercentage = 13.7
                    
                case 40,41,42,43,44: idealPercentage = 15.3
                    
                case 45,46,47,48,49: idealPercentage = 16.4
                    
                case 50,51,52,53,54: idealPercentage = 18.9
                    
                case 55: idealPercentage = 20.9
                    
                default: idealPercentage = 0.0
            }
        }
        else{
            switch age {
                case 20,21,22,23,24: idealPercentage = 17.7
                    
                case 25,26,27,28,29: idealPercentage = 18.4
                        
                case 30,31,32,33,34: idealPercentage = 19.3
                        
                case 35,36,37,38,39: idealPercentage = 21.5
                        
                case 40,41,42,43,44: idealPercentage = 22.2
                        
                case 45,46,47,48,49: idealPercentage = 22.9
                        
                case 50,51,52,53,54: idealPercentage = 25.2
                        
                case 55: idealPercentage = 26.3
                    
                default: idealPercentage = 0.0
            }
        }
    }
}
