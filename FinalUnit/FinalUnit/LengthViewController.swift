//
//  LengthViewController.swift
//  FinalUnit
//
//  Created by Bror Andreas Nordstrom on 15/03/2019.
//  Copyright © 2019 Bror Andreas Nordstrom. All rights reserved.
//

import UIKit

class LengthViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var textFieldMetre: UITextField!
    @IBOutlet weak var textFieldMile: UITextField!
    @IBOutlet weak var textFieldCm: UITextField!
    @IBOutlet weak var textFieldMm: UITextField!
    @IBOutlet weak var textFieldYard: UITextField!
    @IBOutlet weak var textFieldInch: UITextField!
    @IBOutlet weak var buttonDecimalPoint: UIButton!
    
    
    var selectedTextField = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Removes build in keyboard
        textFieldMetre.delegate = self
        textFieldMile.delegate = self
        textFieldCm.delegate = self
        textFieldMm.delegate = self
        textFieldYard.delegate = self
        textFieldInch.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    
    
    
    @IBAction func textFieldOneSelected(_ sender: UITextField) {
        
        selectedTextField = "textFieldMetre"
        textFieldMetre.text = ""
        textFieldMile.text = ""
        textFieldCm.text = ""
        textFieldMm.text = ""
        textFieldYard.text = ""
        textFieldInch.text = ""
        
    }
    
    func metreTextField() {
        
//Once the string has been converted to a double, the mile,centimetre, millimeter, yard & inch values are calculated and rounded to four decimal places
        
        if(textFieldMetre.text == ""){
            textFieldMetre.text = "0"}
        
        let metreValue = Double(textFieldMetre.text!)
        
        let mileValue = String(format:"%.4f",(metreValue! / 1609.344))
        
        let cmValue = String(format:"%.4f", (metreValue! * 100))
        
        let mmValue = String(format:"%.4f", (metreValue! * 1000))
        
        let yardValue = String(format:"%.4f", (metreValue! * 1.094))
        
        let inchValue = String(format:"%.4f",(metreValue! * 39.37))
        
        textFieldMile.text = String(mileValue)
        textFieldCm.text = String(cmValue)
        textFieldMm.text = String(mmValue)
        textFieldYard.text = String(yardValue)
        textFieldInch.text = String(inchValue)
        
    }
    
    
    @IBAction func textFieldTwoSelected(_ sender: UITextField) {
        
        selectedTextField = "textFieldMile"
        textFieldMetre.text = ""
        textFieldMile.text = ""
        textFieldCm.text = ""
        textFieldMm.text = ""
        textFieldYard.text = ""
        textFieldInch.text = ""
        
    }
    
    func mileTextField() {
        //Once the string has been converted to a double, the metre,centimetre, millimeter, yard & inch values are calculated and rounded to four decimal places
        
        if(textFieldMile.text == ""){
            textFieldMile.text = "0"}
        
        let mileValue = Double(textFieldMile.text!)
        
        let metreValue = String(format:"%.4f", (mileValue! * 1609.344))
        
        let cmValue = String(format:"%.4f", (mileValue! * 160934.4))
        
        let mmValue = String(format:"%.4f", (mileValue! * 1.609e+6))
        
        let yardValue = String(format:"%.4f", (mileValue! * 1760))
        
        let inchValue = String(format:"%.4f",(mileValue! * 63360))
        
        textFieldMetre.text = String(metreValue)
        textFieldCm.text = String(cmValue)
        textFieldMm.text = String(mmValue)
        textFieldYard.text = String(yardValue)
        textFieldInch.text = String(inchValue)
        
    }
    
    
    @IBAction func textFieldThreeSelected(_ sender: UITextField) {
        
        selectedTextField = "textFieldCm"
        textFieldMetre.text = ""
        textFieldMile.text = ""
        textFieldCm.text = ""
        textFieldMm.text = ""
        textFieldYard.text = ""
        textFieldInch.text = ""
        
    }
    
    func cmTextField() {
    //Once the string has been converted to a double, the mile,metre, millimeter, yard & inch values are calculated and rounded to four decimal places
        
        if(textFieldCm.text == ""){
            textFieldCm.text = "0"}
        
        let cmValue = Double(textFieldCm.text!)
        
        let metreValue = String(format:"%.4f", (cmValue! / 100))
        
        let mileValue = String(format:"%.4f", (cmValue! / 160934.4))
        
        let mmValue = String(format:"%.4f", (cmValue! * 10))
        
        let yardValue = String(format:"%.4f", (cmValue! / 91.44))
        
        let inchValue = String(format:"%.4f",(cmValue! / 2.53))
        
        textFieldMetre.text = String(metreValue)
        textFieldMile.text = String(mileValue)
        textFieldMm.text = String(mmValue)
        textFieldYard.text = String(yardValue)
        textFieldInch.text = String(inchValue)
        
    }
    
    
    @IBAction func textFieldFourSelected(_ sender: UITextField) {
        
        selectedTextField = "textFieldMm"
        textFieldMetre.text = ""
        textFieldMile.text = ""
        textFieldCm.text = ""
        textFieldMm.text = ""
        textFieldYard.text = ""
        textFieldInch.text = ""
        
    }
    
    func mmTextField() {
        
        //Once the string has been converted to a double, the mile,centimetre,metre, yard & inch values are calculated and rounded to four decimal places
        
        if(textFieldMm.text == ""){
            textFieldMm.text = "0"}
        
        let mmValue = Double(textFieldMm.text!)
        
        let metreValue = String(format: "%.4f",(mmValue! / 1000))
        let mileValue = String(format:"%.4f", (mmValue! / 1.609e+6))
        let cmValue = String(format:"%.4f",(mmValue! / 10))
        
        let yardValue = String(format:"%.4f", (mmValue! / 914.4))
        
        let inchValue = String(format:"%.4f",(mmValue! / 25.4))
        
        textFieldMetre.text = String(metreValue)
        textFieldMile.text = String(mileValue)
        textFieldCm.text = String(cmValue)
        textFieldYard.text = String(yardValue)
        textFieldInch.text = String(inchValue)
        
    }
    
    @IBAction func textFieldFiveSelected(_ sender: UITextField) {
        
        selectedTextField = "textFieldYard"
        textFieldMetre.text = ""
        textFieldMile.text = ""
        textFieldCm.text = ""
        textFieldMm.text = ""
        textFieldYard.text = ""
        textFieldInch.text = ""
        
    }
    
    func yardTextField() {
        
//Once the string has been converted to a double, the mile,centimetre, millimeter, metre & inch values are calculated and rounded to four decimal places
        
        if(textFieldYard.text == ""){
            textFieldYard.text = "0"}
        
        let yardValue = Double(textFieldYard.text!)
        let metreValue = String(format: "%.4f",(yardValue! / 1.094))
        let mileValue = String(format:"%.4f", (yardValue! / 1760))
        let cmValue = String(format:"%.4f",(yardValue! * 91.44))
        
        let mmValue = String(format:"%.4f",(yardValue! * 914.4))
        
        let inchValue = String(format:"%.4f",(yardValue! * 36))
        
        textFieldMetre.text = String(metreValue)
        textFieldMile.text = String(mileValue)
        textFieldCm.text = String(cmValue)
        textFieldMm.text = String(mmValue)
        textFieldInch.text = String(inchValue)
        
    }
    
    
    @IBAction func textFieldSixSelected(_ sender: UITextField) {
        
        selectedTextField = "textFieldInch"
        textFieldMetre.text = ""
        textFieldMile.text = ""
        textFieldCm.text = ""
        textFieldMm.text = ""
        textFieldYard.text = ""
        textFieldInch.text = ""
        
    }
    
    
    func inchTextField() {
        //Once the string has been converted to a double, the mile,centimetre, millimeter, yard & metre values are calculated and rounded to four decimal places
        
        if(textFieldInch.text == ""){
            textFieldInch.text = "0"}
        
        let inchValue = Double(textFieldInch.text!)
        let metreValue = String(format: "%.4f",(inchValue! / 39.37))
        let mileValue = String(format:"%.4f", (inchValue! / 63360))
        let cmValue = String(format:"%.4f",(inchValue! * 2.54))
        
        let mmValue = String(format:"%.4f",(inchValue! * 25.4))
        
        let yardValue = String(format:"%.4f", (inchValue! / 36))
        
        
        textFieldMetre.text = String(metreValue)
        textFieldMile.text = String(mileValue)
        textFieldCm.text = String(cmValue)
        textFieldMm.text = String(mmValue)
        textFieldYard.text = String(yardValue)
        
    }
    
    // save button
    
    @IBAction func buttonSave(_ sender: Any) {
        
        let metreValue = (textFieldMetre.text?.isEmpty)! ? "" : textFieldMetre.text!
        let mileValue = (textFieldMile.text?.isEmpty)! ? "" : textFieldMile.text!
        let cmValue = (textFieldCm.text?.isEmpty)! ? "" : textFieldCm.text!
        let mmValue = (textFieldMm.text?.isEmpty)! ? "" : textFieldMm.text!
        let yardValue = (textFieldYard.text?.isEmpty)! ? "" : textFieldYard.text!
        let inchValue = (textFieldInch.text?.isEmpty)! ? "" : textFieldInch.text!
        
        // if function to ensure count equal zero
        
        if metreValue.count == 0 && mileValue.count == 0 && cmValue.count == 0 && mmValue.count == 0 && yardValue.count == 0 && inchValue.count == 0 {
            return
        } else {
            
            let history = CreateHistory()
            
            history.createLengthHistory(metreValue: metreValue, mileValue: mileValue, cmValue: cmValue, mmValue: mmValue, yardValue: yardValue, inchValue: inchValue)
            
            // create pop up window to notify users that everything has been saves
            let popUpMessage = UIAlertController(title: "Unit Converter App", message: "Data has been saved", preferredStyle: .alert)
            popUpMessage.addAction(UIAlertAction(title:"OK", style: .default, handler: nil))
            self.present(popUpMessage, animated: true, completion: nil)
            
        }
        
    }
    
    // history view
    
    @IBAction func buttonHistory(_ sender: Any) {
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "HistoryController") as! HistoryController
        
        if let arrayList = UserDefaults.standard.value(forKey: User_Default.length) as? [[String:String]] {
            controller.arrayList = arrayList
        }
        
        self.present(controller, animated: true, completion: nil)
        
        
        
    }
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        switch (sender as UIButton).titleLabel?.text {
        case "1":
            print("1 pressed")
            switch selectedTextField{
            case "textFieldMetre":
                textFieldMetre.text = textFieldMetre.text! + "1"
                metreTextField()
                
            case "textFieldMile":
                textFieldMile.text = textFieldMile.text! + "1"
                mileTextField()
                
            case "textFieldCm":
                textFieldCm.text = textFieldCm.text! + "1"
                cmTextField()
            case "textFieldMm":
                textFieldMm.text = textFieldMm.text! + "1"
                mmTextField()
            case "textFieldYard":
                textFieldYard.text = textFieldYard.text! + "1"
                yardTextField()
            case "textFieldInch":
                textFieldInch.text = textFieldInch.text! + "1"
                inchTextField()
            default:
                break
            }
        case "2":
            print("2 pressed")
            switch selectedTextField{
            case "textFieldMetre":
                textFieldMetre.text = textFieldMetre.text! + "2"
                metreTextField()
                
            case "textFieldMile":
                textFieldMile.text = textFieldMile.text! + "2"
                mileTextField()
                
            case "textFieldCm":
                textFieldCm.text = textFieldCm.text! + "2"
                cmTextField()
            case "textFieldMm":
                textFieldMm.text = textFieldMm.text! + "2"
                mmTextField()
            case "textFieldYard":
                textFieldYard.text = textFieldYard.text! + "2"
                yardTextField()
            case "textFieldInch":
                textFieldInch.text = textFieldInch.text! + "2"
                inchTextField()
            default:
                break
            }
        case "3":
            print("3 pressed")
            switch selectedTextField{
            case "textFieldMetre":
                textFieldMetre.text = textFieldMetre.text! + "3"
                metreTextField()
                
            case "textFieldMile":
                textFieldMile.text = textFieldMile.text! + "3"
                mileTextField()
                
            case "textFieldCm":
                textFieldCm.text = textFieldCm.text! + "3"
                cmTextField()
            case "textFieldMm":
                textFieldMm.text = textFieldMm.text! + "3"
                mmTextField()
            case "textFieldYard":
                textFieldYard.text = textFieldYard.text! + "3"
                yardTextField()
            case "textFieldInch":
                textFieldInch.text = textFieldInch.text! + "3"
                inchTextField()
            default:
                break
            }
        case "4":
            print("4 pressed")
            switch selectedTextField{
            case "textFieldMetre":
                textFieldMetre.text = textFieldMetre.text! + "4"
                metreTextField()
                
            case "textFieldMile":
                textFieldMile.text = textFieldMile.text! + "4"
                mileTextField()
                
            case "textFieldCm":
                textFieldCm.text = textFieldCm.text! + "4"
                cmTextField()
            case "textFieldMm":
                textFieldMm.text = textFieldMm.text! + "4"
                mmTextField()
            case "textFieldYard":
                textFieldYard.text = textFieldYard.text! + "4"
                yardTextField()
            case "textFieldInch":
                textFieldInch.text = textFieldInch.text! + "4"
                inchTextField()
            default:
                break
            }
        case "5":
            print("5 pressed")
            switch selectedTextField{
            case "textFieldMetre":
                textFieldMetre.text = textFieldMetre.text! + "5"
                metreTextField()
                
            case "textFieldMile":
                textFieldMile.text = textFieldMile.text! + "5"
                mileTextField()
                
            case "textFieldCm":
                textFieldCm.text = textFieldCm.text! + "5"
                cmTextField()
            case "textFieldMm":
                textFieldMm.text = textFieldMm.text! + "5"
                mmTextField()
            case "textFieldYard":
                textFieldYard.text = textFieldYard.text! + "5"
                yardTextField()
            case "textFieldInch":
                textFieldInch.text = textFieldInch.text! + "5"
                inchTextField()
            default:
                break
            }
        case "6":
            print("6 pressed")
            switch selectedTextField{
            case "textFieldMetre":
                textFieldMetre.text = textFieldMetre.text! + "6"
                metreTextField()
                
            case "textFieldMile":
                textFieldMile.text = textFieldMile.text! + "6"
                mileTextField()
                
            case "textFieldCm":
                textFieldCm.text = textFieldCm.text! + "6"
                cmTextField()
            case "textFieldMm":
                textFieldMm.text = textFieldMm.text! + "6"
                mmTextField()
            case "textFieldYard":
                textFieldYard.text = textFieldYard.text! + "6"
                yardTextField()
            case "textFieldInch":
                textFieldInch.text = textFieldInch.text! + "6"
                inchTextField()
            default:
                break
            }
        case "7":
            print("7 pressed")
            switch selectedTextField{
            case "textFieldMetre":
                textFieldMetre.text = textFieldMetre.text! + "7"
                metreTextField()
                
            case "textFieldMile":
                textFieldMile.text = textFieldMile.text! + "7"
                mileTextField()
                
            case "textFieldCm":
                textFieldCm.text = textFieldCm.text! + "7"
                cmTextField()
            case "textFieldMm":
                textFieldMm.text = textFieldMm.text! + "7"
                mmTextField()
            case "textFieldYard":
                textFieldYard.text = textFieldYard.text! + "7"
                yardTextField()
            case "textFieldInch":
                textFieldInch.text = textFieldInch.text! + "7"
                inchTextField()
            default:
                break
            }
        case "8":
            print("8 pressed")
            switch selectedTextField{
            case "textFieldMetre":
                textFieldMetre.text = textFieldMetre.text! + "8"
                metreTextField()
                
            case "textFieldMile":
                textFieldMile.text = textFieldMile.text! + "8"
                mileTextField()
                
            case "textFieldCm":
                textFieldCm.text = textFieldCm.text! + "8"
                cmTextField()
            case "textFieldMm":
                textFieldMm.text = textFieldMm.text! + "8"
                mmTextField()
            case "textFieldYard":
                textFieldYard.text = textFieldYard.text! + "8"
                yardTextField()
            case "textFieldInch":
                textFieldInch.text = textFieldInch.text! + "8"
                inchTextField()
            default:
                break
            }
        case "9":
            print("9 pressed")
            switch selectedTextField{
            case "textFieldMetre":
                textFieldMetre.text = textFieldMetre.text! + "9"
                metreTextField()
                
            case "textFieldMile":
                textFieldMile.text = textFieldMile.text! + "9"
                mileTextField()
                
            case "textFieldCm":
                textFieldCm.text = textFieldCm.text! + "9"
                cmTextField()
            case "textFieldMm":
                textFieldMm.text = textFieldMm.text! + "9"
                mmTextField()
            case "textFieldYard":
                textFieldYard.text = textFieldYard.text! + "9"
                yardTextField()
            case "textFieldInch":
                textFieldInch.text = textFieldInch.text! + "9"
                inchTextField()
            default:
                break
            }
        case "0":
            print("0 pressed")
            switch selectedTextField{
            case "textFieldMetre":
                textFieldMetre.text = textFieldMetre.text! + "0"
                metreTextField()
                
            case "textFieldMile":
                textFieldMile.text = textFieldMile.text! + "0"
                mileTextField()
                
            case "textFieldCm":
                textFieldCm.text = textFieldCm.text! + "0"
                cmTextField()
            case "textFieldMm":
                textFieldMm.text = textFieldMm.text! + "0"
                mmTextField()
            case "textFieldYard":
                textFieldYard.text = textFieldYard.text! + "0"
                yardTextField()
            case "textFieldInch":
                textFieldInch.text = textFieldInch.text! + "0"
                inchTextField()
            default:
                break
            }
        case "DEL":
            print("DEL pressed")
            switch selectedTextField{
            case "textFieldMetre":
                
                if(textFieldMetre.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldMetre.text = String(textFieldMetre.text!.dropLast())
                
                if(textFieldMetre.text == "") {
                    textFieldMetre.text = "0"
                }
                if(textFieldMetre.text == "-") {
                    textFieldMetre.text = "0"
                }
                

                metreTextField()
                
            case "textFieldMile":
                
                if(textFieldMile.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldMile.text = String(textFieldMile.text!.dropLast())
                
                if(textFieldMile.text == "") {
                    textFieldMile.text = "0"
                }
                if(textFieldMile.text == "-") {
                    textFieldMile.text = "0"
                }
                mileTextField()
                
            case "textFieldCm":
                if(textFieldCm.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldCm.text = String(textFieldCm.text!.dropLast())
                
                if(textFieldCm.text == "") {
                    textFieldCm.text = "0"
                }
                if(textFieldCm.text == "-") {
                    textFieldCm.text = "0"
                }
                cmTextField()
            case "textFieldMm":
                if(textFieldMm.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldMm.text = String(textFieldMm.text!.dropLast())
                
                if(textFieldMm.text == "") {
                    textFieldMm.text = "0"
                }
                if(textFieldMm.text == "-") {
                    textFieldMm.text = "0"
                }
                mmTextField()
                
            case "textFieldYard":
                if(textFieldYard.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldYard.text = String(textFieldYard.text!.dropLast())
                
                if(textFieldYard.text == "") {
                    textFieldYard.text = "0"
                }
                if(textFieldYard.text == "-") {
                    textFieldYard.text = "0"
                }
                yardTextField()
                
            case "textFieldInch":
                if(textFieldInch.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldInch.text = String(textFieldInch.text!.dropLast())
                
                if(textFieldInch.text == "") {
                    textFieldInch.text = "0"
                }
                if(textFieldInch.text == "-") {
                    textFieldInch.text = "0"
                }
                inchTextField()
            default:
                break
            }
        case ".":
            print(". pressed")
            
            buttonDecimalPoint.isEnabled = false
            
            buttonDecimalPoint.alpha = 0.5
            
            switch selectedTextField{
            case "textFieldMetre":
                textFieldMetre.text = textFieldMetre.text! + "."
                metreTextField()
                
            case "textFieldMile":
                textFieldMile.text = textFieldMile.text! + "."
                mileTextField()
                
            case "textFieldCm":
                textFieldCm.text = textFieldCm.text! + "."
                cmTextField()
            case "textFieldMm":
                textFieldMm.text = textFieldMm.text! + "."
                mmTextField()
            case "textFieldYard":
                textFieldYard.text = textFieldYard.text! + "."
                yardTextField()
            case "textFieldInch":
                textFieldInch.text = textFieldInch.text! + "."
                inchTextField()
            default:
                break
            }
            
        default:
            break
        }
        
        
    }
 

}
