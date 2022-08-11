//
//  MainViewController.swift
//  Body Fat Calculator
//
//  Created by Michael Green on 2022-05-28.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {

    //
    // Buttons and widgets
    
    @IBOutlet weak var maleSwitch: UISwitch!
    @IBOutlet weak var femaleSwitch: UISwitch!
    
    
    @IBOutlet var heightPicker: UIPickerView!
    @IBOutlet weak var weightInput: UITextField!
    
    @IBOutlet weak var neckSlider: UISlider!
    @IBOutlet weak var waistSlider: UISlider!
    @IBOutlet weak var hipsSlider: UISlider!
    
    
    @IBOutlet weak var calculateButton: UIButton!
    
    //
    // Labels
    
    @IBOutlet weak var neckDisplay: UILabel!
    @IBOutlet weak var waistDisplay: UILabel!
    @IBOutlet weak var hipsDisplay: UILabel!
    
    //
    // Data and code

    let feetData = [1,2,3,4,5,6,7,8,9,10,11,12]
    let inchesData = [0,1,2,3,4,5,6,7,8,9,10,11]
    
    var feetSelectedRow = 0
    var inchesSelectedRow = 0
    
    // 0 = Female 1 = Male
    var lastSexChosen = 0
    var bfp = 0.00
    var bmi = 0.00
    var leanMass = 0.00
    var fatMass = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        // This will make weight input placeholder text white.
        self.weightInput.delegate = self
        weightInput.attributedPlaceholder = NSAttributedString(
            string: "Weight (lbs)",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        
        // Height Picker
        heightPicker.dataSource = self
        heightPicker.delegate = self
        
        maleSwitch.addTarget(self, action: #selector(switchChange), for: UIControl.Event.valueChanged)
        femaleSwitch.addTarget(self, action: #selector(switchChange), for: UIControl.Event.valueChanged)
        maleSwitch.isOn = false
        femaleSwitch.isOn = false
        
    }
    
    // Hide weight Input when clicking outside of bounds
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    //
    // This function will handle the calculation for the results.
    @IBAction func calculateHandler(_ sender: Any){
        
        let waistMinusNeck = CGFloat(waistSlider.value) - CGFloat( neckSlider.value)
        
        let heightInInches = CGFloat(feetData[feetSelectedRow] * 12) + CGFloat(inchesData[inchesSelectedRow])
        
        // Variable for Women only.
        let waistPlusHipsMinusNeck = CGFloat(waistSlider.value) + CGFloat(hipsSlider.value) - CGFloat(neckSlider.value)
        
        // Calulation formulas
        let weight : String = weightInput.text ?? "0.00"
        
        if(lastSexChosen == 0){
            // For Women
            bfp = 163.205 * log10(waistPlusHipsMinusNeck) - 97.684 * log10(heightInInches) - 78.387
        }
        else if(lastSexChosen == 1){
            // For Men
            bfp = 86.010 * log10(waistMinusNeck) - 70.041 * log10(heightInInches) + 36.76
        }
        else {
            print("CRITICAL ERROR - PLEASE REPORT")
        }
        
        // Lean mass, fat mass, bmi ...
        bmi = Double((Float(weight) ?? 0.00) / (Float(heightInInches) * Float(heightInInches)) * Float(703.0))
        fatMass = Double((Float(weight) ?? 0.00) * Float(bfp / 100))
        leanMass = Double((Float(weight) ?? 0.00)) - fatMass
        
        
        print("waistMinusNeck = \(CGFloat(waistSlider.value)) - \(CGFloat(neckSlider.value)) \n heightInInches = \(CGFloat(heightInInches)) \n Sex = \(lastSexChosen) \n weight = \(weight) \n LM = \(leanMass) \n FM = \(fatMass) \n BMI = \(bmi)")
        print(bfp)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        print("TESTING SEG PREPARE \n FatMass = \(fatMass)")
        if segue.destination is ResultsViewController {
            let vc = segue.destination as? ResultsViewController
            vc?.fatMass = Float(fatMass)
            vc?.leanMass = Float(leanMass)
            vc?.bmi = Float(bmi)
            vc?.bfp = Float(bfp)
        }
    }
    
    
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        let step: Float = 0.05
        let roundedValue = round(sender.value / step) * step
          sender.value = roundedValue
        
        let currentValue = String(format: "%.2f\"", sender.value)
        
        if(sender.maximumValue == 30.0){
            neckDisplay.text = String(currentValue)
        }
        else if(sender.maximumValue == 70.0){
            waistDisplay.text = String(currentValue)
        }
        else if(sender.maximumValue == 75.0){
            hipsDisplay.text = String(currentValue)
        }
        
    }
    
    @IBAction func switchChange(sender: UISwitch){
        // This should set the male switch on at default start
        if(femaleSwitch.isOn == true && maleSwitch.isOn == false) {
            femaleSwitch.isOn = true
            lastSexChosen = 0
            print("Female ON")
            print("lsc = \(lastSexChosen)")
        }
        else if(femaleSwitch.isOn == false && maleSwitch.isOn == true){
            maleSwitch.isOn = true
            lastSexChosen = 1
            print("Male ON")
            print("lsc = \(lastSexChosen)")
        }
        else if(femaleSwitch.isOn == false && maleSwitch.isOn == false){
            if(lastSexChosen == 0){
                maleSwitch.isOn = true
                lastSexChosen = 1
                print("Male ON")
                print("lsc = \(lastSexChosen)")
            }
            else if(lastSexChosen == 1){
                femaleSwitch.isOn = true
                lastSexChosen = 0
                print("Female ON")
                print("lsc = \(lastSexChosen)")
            }
            else{
                print("ERROR lastSexChosen: \(lastSexChosen) Should be 0 or 1")
            }
        }
        else if(femaleSwitch.isOn == true && maleSwitch.isOn == true){
            if(lastSexChosen == 0){
                femaleSwitch.isOn = false
                maleSwitch.isOn = true
                lastSexChosen = 1
                print("Male ON")
                print("lsc = \(lastSexChosen)")
            }
            else if(lastSexChosen == 1){
                femaleSwitch.isOn = true
                maleSwitch.isOn = false
                lastSexChosen = 0
                print("Female ON")
                print("lsc = \(lastSexChosen)")
            }
            else{
                print("ERROR lastSexChosen: \(lastSexChosen) Should be 0 or 1")
            }
        }
    }
}



//
// Picker Code
//

extension MainViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return feetData.count
    }
    
        
    }

extension MainViewController : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch component {
            case 0: return String(feetData[row])
            case 1: return String(inchesData[row])
            default: return "CRITICAL ERROR - PLEASE REPORT"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
            case 0: feetSelectedRow = row
            case 1: inchesSelectedRow = row
            default: print("CRITICAL ERROR - PLEASE REPORT")
        }
    }
    
    
}
