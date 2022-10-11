//
//  ResultsViewController.swift
//  Body Fat Calculator
//
//  Created by Michael Green on 2022-07-15.
//

import UIKit
import SwiftUI

class ResultsViewController: UIViewController {
    
    var fatMass: Float = 0.00
    var leanMass: Float = 0.00
    var bmi: Float = 0.00
    var bfp: Float = 0.00
    var age: Int = 0
    var sex: String = ""
    var weight: Int = 0

    @IBOutlet weak var mainView: UIImageView!
    
    @IBOutlet weak var bfPercentLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    
    @IBOutlet weak var leanMassLabel: UILabel!
    
    @IBOutlet weak var fatMassLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var fitnessMapButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
    
        bfPercentLabel.text = String(format: "%.1f", bfp);
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        print("START ResultsVC Transfer")
        if segue.destination is ResultsExpandedViewController {
            let vc = segue.destination as? ResultsExpandedViewController
            vc?.fatMass = Float(fatMass)
            vc?.leanMass = Float(leanMass)
            vc?.bmi = Float(bmi)
            vc?.bfp = Float(bfp)
            vc?.age = age
            vc?.sex = sex
            vc?.weight = weight
        }
        print("COMPLETED ResultsVC prepare")
    }
    
    //
    // This function will start the map view procedures
    @IBAction func mapLauncher(_ sender: Any){
        let contentVC = ContentView()
        let contentMapController = UIHostingController(rootView: contentVC)

        addChild(contentMapController)
        view.addSubview(contentMapController.view)

        contentMapController.view.translatesAutoresizingMaskIntoConstraints = false
    }

   // Other IBActions.
}
