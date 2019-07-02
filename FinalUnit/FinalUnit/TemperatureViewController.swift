//
//  TemperatureViewController.swift
//  FinalUnit
//
//  Created by Bror Andreas Nordstrom on 14/03/2019.
//  Copyright © 2019 Bror Andreas Nordstrom. All rights reserved.
//

import UIKit

class TemperatureViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var textFieldCelsius: UITextField!
    @IBOutlet weak var textFieldFahrenheit: UITextField!
    @IBOutlet weak var textFieldKelvin: UITextField!
    @IBOutlet weak var buttonDecimalPoint: UIButton!
    
    
   var selectedTextField = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // removes build in keyboard
      /*
        textFieldCelsius.delegate = self
        textFieldFahrenheit.delegate = self
        textFieldKelvin.delegate = self */
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    
    @IBAction func textFieldOneSelected(_ sender: UITextField) {
        
        selectedTextField = "textFieldCelsius"
        textFieldCelsius.text = ""
        textFieldFahrenheit.text = ""
        textFieldKelvin.text = ""

    }
    
    
    func celsiusTextField() {
        
      //Once the string has been converted to a double on line 63, the farenheit and kelvin values are calculated and rounded to four decimal places
        
        if(textFieldCelsius.text == ""){
            textFieldCelsius.text = "0"}
    
    let celsiusValue = Double(textFieldCelsius.text!)
    
    let fahrenheitValue = String(format:"%.4f",((celsiusValue! * 9/5) + 32)) + "˚F"
    
    let kelvinValue = String(format:"%.4f", ((celsiusValue! + 273.15))) + "K"
    
    textFieldFahrenheit.text = String(fahrenheitValue)
    textFieldKelvin.text = String(kelvinValue)
    
    }
    
    
    @IBAction func textFieldTwoSelcted(_ sender: UITextField) {
        
        selectedTextField = "textFieldFahrenheit"
        textFieldCelsius.text = ""
        textFieldFahrenheit.text = ""
        textFieldKelvin.text = ""
        
    }
    
    func fahrenheitTextField() {
        //Once the string has been converted to a double, the celsius & kelvin values are calculated and rounded to four decimal places, the respective signals are appended to the converted values before they are put into text fields
        
        if(textFieldFahrenheit.text == ""){
            textFieldFahrenheit.text = "0"}
        
        let fahrenheitValue = Double(textFieldFahrenheit.text!)
        
        let celsiusValue = String(format:"%.4f",(fahrenheitValue! - 32) * 5/9) + "˚C"
        
        let kelvinValue = String(format:"%.4f",((fahrenheitValue! - 32) * 5/9 + 273.15)) + "K"
        
        textFieldCelsius.text = String(celsiusValue)
        textFieldKelvin.text = String(kelvinValue)
        
    }
    
    
    
    @IBAction func textFieldThreeSelected(_ sender: UITextField) {
        
        selectedTextField = "textFieldKelvin"
        textFieldCelsius.text = ""
        textFieldFahrenheit.text = ""
        textFieldKelvin.text = ""
        
    }
    
    func kelvinTextField() {
//Once the string has been converted to a double, the celsius & farenheit values are calculated and rounded to four decimal places, the respective signals are appended to the converted values before they are put into text fields
        
        if(textFieldKelvin.text?.isEmpty)!{
            textFieldKelvin.text="" }
        let kelvinValue = Double(textFieldKelvin.text!)
       guard kelvinValue != nil else {
        return
        
        }
        
        
      //  let kelvinValue = Double(textFieldKelvin.text!)
        
        let celsiusValue = String(format:"%.4f",(kelvinValue! - 273.15)) + "˚C"
        
        let fahrenheitValue = String(format:"%.4f", ((kelvinValue! - 273.15) * 9/5 + 32)) + "˚F"
        
        textFieldCelsius.text = String(celsiusValue)
        textFieldFahrenheit.text = String(fahrenheitValue)
    }
    
    
    
    
    @IBAction func buttonSave(_ sender: Any) {
        
        let celsiusValue = (textFieldCelsius.text?.isEmpty)! ? "" : textFieldCelsius.text!
        let fahrenheitValue = (textFieldFahrenheit.text?.isEmpty)! ? "": textFieldFahrenheit.text!
        let kelvinValue = (textFieldKelvin.text?.isEmpty)! ? "": textFieldKelvin.text!
        
        if celsiusValue.count == 0 && fahrenheitValue.count == 0 && kelvinValue.count == 0 {
            return
            
        } else {
            let history = CreateHistory()
            history.createTemperatureHistory(celsiusValue:celsiusValue, fahrenheitValue:fahrenheitValue,kelvinValue:kelvinValue)
            
            // create pop up window to notify users that everything has been saves
            let popUpMessage = UIAlertController(title: "Unit Converter App", message: "Data has been saved", preferredStyle: .alert)
            popUpMessage.addAction(UIAlertAction(title:"OK", style: .default, handler: nil))
            self.present(popUpMessage, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func buttonHistory(_ sender: Any) {
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "HistoryController") as! HistoryController
        if let arrayList = UserDefaults.standard.value(forKey: User_Default.temperature) as? [[String:String]] {
            controller.arrayList = arrayList
        }
        
        self.present(controller, animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        switch (sender as UIButton).titleLabel?.text {
        case "1":
            print("1 pressed")
            switch selectedTextField{
            case "textFieldCelsius":
                textFieldCelsius.text = textFieldCelsius.text! + "1"
                celsiusTextField()
                
            case "textFieldFahrenheit":
                textFieldFahrenheit.text = textFieldFahrenheit.text! + "1"
                fahrenheitTextField()
                
            case "textFieldKelvin":
                textFieldKelvin.text = textFieldKelvin.text! + "1"
                kelvinTextField()
            default:
                break
            }
        case "2":
            print("2 pressed")
            switch selectedTextField{
            case "textFieldCelsius":
                textFieldCelsius.text = textFieldCelsius.text! + "2"
                celsiusTextField()
                
            case "textFieldFahrenheit":
                textFieldFahrenheit.text = textFieldFahrenheit.text! + "2"
                fahrenheitTextField()
                
            case "textFieldKelvin":
                textFieldKelvin.text = textFieldKelvin.text! + "2"
                kelvinTextField()
            default:
                break
            }
        case "3":
            print("3 pressed")
            switch selectedTextField{
            case "textFieldCelsius":
                textFieldCelsius.text = textFieldCelsius.text! + "3"
                celsiusTextField()
                
            case "textFieldFahrenheit":
                textFieldFahrenheit.text = textFieldFahrenheit.text! + "3"
                fahrenheitTextField()
                
            case "textFieldKelvin":
                textFieldKelvin.text = textFieldKelvin.text! + "3"
                kelvinTextField()
            default:
                break
            }
        case "4":
            print("4 pressed")
            switch selectedTextField{
            case "textFieldCelsius":
                textFieldCelsius.text = textFieldCelsius.text! + "4"
                celsiusTextField()
                
            case "textFieldFahrenheit":
                textFieldFahrenheit.text = textFieldFahrenheit.text! + "4"
                fahrenheitTextField()
                
            case "textFieldKelvin":
                textFieldKelvin.text = textFieldKelvin.text! + "4"
                kelvinTextField()
            default:
                break
            }
        case "5":
            print("5 pressed")
            switch selectedTextField{
            case "textFieldCelsius":
                textFieldCelsius.text = textFieldCelsius.text! + "5"
                celsiusTextField()
                
            case "textFieldFahrenheit":
                textFieldFahrenheit.text = textFieldFahrenheit.text! + "5"
                fahrenheitTextField()
                
            case "textFieldKelvin":
                textFieldKelvin.text = textFieldKelvin.text! + "5"
                kelvinTextField()
            default:
                break
            }
        case "6":
            print("6 pressed")
            switch selectedTextField{
            case "textFieldCelsius":
                textFieldCelsius.text = textFieldCelsius.text! + "6"
                celsiusTextField()
                
            case "textFieldFahrenheit":
                textFieldFahrenheit.text = textFieldFahrenheit.text! + "6"
                fahrenheitTextField()
                
            case "textFieldKelvin":
                textFieldKelvin.text = textFieldKelvin.text! + "6"
                kelvinTextField()
            default:
                break
            }
        case "7":
            print("7 pressed")
            switch selectedTextField{
            case "textFieldCelsius":
                textFieldCelsius.text = textFieldCelsius.text! + "7"
                celsiusTextField()
                
            case "textFieldFahrenheit":
                textFieldFahrenheit.text = textFieldFahrenheit.text! + "7"
                fahrenheitTextField()
                
            case "textFieldKelvin":
                textFieldKelvin.text = textFieldKelvin.text! + "7"
                kelvinTextField()
            default:
                break
            }
        case "8":
            print("8 pressed")
            switch selectedTextField{
            case "textFieldCelsius":
                textFieldCelsius.text = textFieldCelsius.text! + "8"
                celsiusTextField()
                
            case "textFieldFahrenheit":
                textFieldFahrenheit.text = textFieldFahrenheit.text! + "8"
                fahrenheitTextField()
                
            case "textFieldKelvin":
                textFieldKelvin.text = textFieldKelvin.text! + "8"
                kelvinTextField()
            default:
                break
            }
        case "9":
            print("9 pressed")
            switch selectedTextField{
            case "textFieldCelsius":
                textFieldCelsius.text = textFieldCelsius.text! + "9"
                celsiusTextField()
                
            case "textFieldFahrenheit":
                textFieldFahrenheit.text = textFieldFahrenheit.text! + "9"
                fahrenheitTextField()
                
            case "textFieldKelvin":
                textFieldKelvin.text = textFieldKelvin.text! + "9"
                kelvinTextField()
            default:
                break
            }
        case "0":
            print("0 pressed")
            switch selectedTextField{
            case "textFieldCelsius":
                textFieldCelsius.text = textFieldCelsius.text! + "0"
                celsiusTextField()
                
            case "textFieldFahrenheit":
                textFieldFahrenheit.text = textFieldFahrenheit.text! + "0"
                fahrenheitTextField()
                
            case "textFieldKelvin":
                textFieldKelvin.text = textFieldKelvin.text! + "0"
                kelvinTextField()
            default:
                break
            }
        case "DEL":
            print("DEL pressed")
            switch selectedTextField{
            case "textFieldCelsius":
                
                if(textFieldCelsius.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldCelsius.text = String(textFieldCelsius.text!.dropLast())
                
                if(textFieldCelsius.text == "") {
                    textFieldCelsius.text = "0"
                }
                if(textFieldCelsius.text == "-") {
                    textFieldCelsius.text = "0"
                }
                
                celsiusTextField()
                
            case "textFieldFahrenheit":
                
                if(textFieldFahrenheit.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldFahrenheit.text = String(textFieldFahrenheit.text!.dropLast())
                
                if(textFieldFahrenheit.text == "") {
                    textFieldFahrenheit.text = "0"
                }
                if(textFieldFahrenheit.text == "-") {
                    textFieldFahrenheit.text = "0"
                }

                fahrenheitTextField()
                
            case "textFieldKelvin":
                if(textFieldKelvin.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldKelvin.text = String(textFieldKelvin.text!.dropLast())
                
                if(textFieldKelvin.text == "") {
                    textFieldKelvin.text = "0"
                }
                if(textFieldKelvin.text == "-") {
                    textFieldKelvin.text = "0"
                }
           
                kelvinTextField()
            default:
                break
            }
        case ".":
            print(". pressed")
            // disables after pressed
            buttonDecimalPoint.isEnabled = false
            // creates difference when disabled
            buttonDecimalPoint.alpha = 0.5
            
            switch selectedTextField{
            case "textFieldCelsius":
                textFieldCelsius.text = textFieldCelsius.text! + "."
                celsiusTextField()
                
            case "textFieldFahrenheit":
                textFieldFahrenheit.text = textFieldFahrenheit.text! + "."
                fahrenheitTextField()
                
            case "textFieldKelvin":
                textFieldKelvin.text = textFieldKelvin.text! + "."
                kelvinTextField()
            default:
                break
            }
        case "NEG":
            print("NEG pressed")
            switch selectedTextField{
            case "textFieldCelsius":
               
                
            if(textFieldCelsius.text!.first == "-"){
                
                textFieldCelsius.text = String(textFieldCelsius.text!.dropFirst())
                    textFieldFahrenheit.text = String(textFieldFahrenheit.text!.dropFirst())
                    textFieldKelvin.text = String(textFieldKelvin.text!.dropFirst())
                }
            else {
                
                textFieldCelsius.text = "-" + textFieldCelsius.text!
                textFieldFahrenheit.text = "-" + textFieldFahrenheit.text!
                textFieldKelvin.text = "-" + textFieldKelvin.text!
                
            }
                
                celsiusTextField()
                
            case "textFieldFahrenheit":
                
                if(textFieldFahrenheit.text!.first == "-"){
                    
                    textFieldCelsius.text = String(textFieldCelsius.text!.dropFirst())
                    textFieldFahrenheit.text = String(textFieldFahrenheit.text!.dropFirst())
                    textFieldKelvin.text = String(textFieldKelvin.text!.dropFirst())
                }
                else {
                    
                    textFieldCelsius.text = "-" + textFieldCelsius.text!
                    textFieldFahrenheit.text = "-" + textFieldFahrenheit.text!
                    textFieldKelvin.text = "-" + textFieldKelvin.text!
                    
                }
                fahrenheitTextField()
                
            case "textFieldKelvin":
                
                if(textFieldKelvin.text!.first == "-"){
                    
                    textFieldCelsius.text = String(textFieldCelsius.text!.dropFirst())
                    textFieldFahrenheit.text = String(textFieldFahrenheit.text!.dropFirst())
                    textFieldKelvin.text = String(textFieldKelvin.text!.dropFirst())
                }
                else {
                    
                    textFieldCelsius.text = "-" + textFieldCelsius.text!
                    textFieldFahrenheit.text = "-" + textFieldFahrenheit.text!
                    textFieldKelvin.text = "-" + textFieldKelvin.text!
                    
                }
                kelvinTextField()
            default:
                break
            }
            
        default:
            break
        }
        
    }
    
    
}

