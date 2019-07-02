//
//  SpeedViewController.swift
//  FinalUnit
//
//  Created by Bror Andreas Nordstrom on 15/03/2019.
//  Copyright © 2019 Bror Andreas Nordstrom. All rights reserved.
//

import UIKit

class SpeedViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var textFieldMetresS: UITextField!
    @IBOutlet weak var textFieldKmH: UITextField!
    @IBOutlet weak var textFieldMilesH: UITextField!
    @IBOutlet weak var textFieldNauticalMilesH: UITextField!
    @IBOutlet weak var buttonDecimalPoint: UIButton!
    
    
    var selectedTextField = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Removes build in keyboard
        
        textFieldMetresS.delegate = self
        textFieldKmH.delegate = self
        textFieldMilesH.delegate = self
        textFieldNauticalMilesH.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

    
    @IBAction func textFieldOneSelected(_ sender: UITextField) {
        
        selectedTextField = "textFieldMetresS"
        textFieldMetresS.text = ""
        textFieldKmH.text = ""
        textFieldMilesH.text = ""
        textFieldNauticalMilesH.text = ""
    }
    
    func metresTextField(){
        
//Once the string has been converted to a double, the miles,kilometres & mph values are calculated and rounded to four decimal places
        
        if(textFieldMetresS.text == ""){
            textFieldMetresS.text = "0"}
        
        let mSecondsValue = Double(textFieldMetresS.text!)
        
        let kmHourValue = String(format:"%.4f",(mSecondsValue! * 3.6))
        
        let milesHourValue = String(format:"%.4f",(mSecondsValue! * 2.237))
        
        let nauticalMphValue = String(format:"%.4f",(mSecondsValue! * 1.944))
        
        
        textFieldKmH.text = String(kmHourValue)
        textFieldMilesH.text = String(milesHourValue)
        textFieldNauticalMilesH.text = String(nauticalMphValue)
        
    }
    
    
    @IBAction func textFieldTwoSelected(_ sender: UITextField) {
        
        selectedTextField = "textFieldKmH"
        textFieldMetresS.text = ""
        textFieldKmH.text = ""
        textFieldMilesH.text = ""
        textFieldNauticalMilesH.text = ""
        
    }
    
    
    func kmTextField(){
        
        //Once the string has been converted to a double, the milliseconds,miles & mph values are calculated and rounded to four decimal places
        
        if(textFieldKmH.text == ""){
            textFieldKmH.text = "0"}
        
        let kmHourValue = Double(textFieldKmH.text!)
        let mSecondsValue = String(format:"%.4f",(kmHourValue! / 3.6))
        
        let milesHourValue = String(format:"%.4f",(kmHourValue! / 1.609))
        
        let nauticalMphValue = String(format:"%.4f",(kmHourValue! / 1.852))
        
        
        textFieldMetresS.text = String(mSecondsValue)
        textFieldMilesH.text = String(milesHourValue)
        textFieldNauticalMilesH.text = String(nauticalMphValue)
        
    }
    
    @IBAction func textFieldThreeSelected(_ sender: UITextField) {
        
        selectedTextField = "textFieldMilesH"
        textFieldMetresS.text = ""
        textFieldKmH.text = ""
        textFieldMilesH.text = ""
        textFieldNauticalMilesH.text = ""
        
    }
    
    func milesTextField() {
        
        //Once the string has been converted to a double, the milliseconds,kilometres & miles values are calculated and rounded to four decimal places
        
        if(textFieldMilesH.text == ""){
            textFieldMilesH.text = "0"}
        
        let milesHourValue = Double(textFieldMilesH.text!)
        
        let mSecondsValue = String(format:"%.4f",(milesHourValue! / 2.237))
        
        let kmHourValue = String(format:"%.4f",(milesHourValue! * 1.609))
        
        let nauticalMphValue = String(format:"%.4f",(milesHourValue! / 1.151))
        
        
        textFieldMetresS.text = String(mSecondsValue)
        textFieldKmH.text = String(kmHourValue)
        textFieldNauticalMilesH.text = String(nauticalMphValue)
        
    }

    
    
    @IBAction func textFieldFourSelected(_ sender: UITextField) {
        
        selectedTextField = "textFieldNauticalMilesH"
        textFieldMetresS.text = ""
        textFieldKmH.text = ""
        textFieldMilesH.text = ""
        textFieldNauticalMilesH.text = ""
        
    }
    
    
    func nauticalTextField() {
        //Once the string has been converted to a double, the milliseconds,kilometres & mph values are calculated and rounded to four decimal places
        
        if(textFieldNauticalMilesH.text == ""){
            textFieldNauticalMilesH.text = "0"}
        
        let nauticalMphValue = Double(textFieldNauticalMilesH.text!)
        
        let mSecondsValue = String(format:"%.4f",(nauticalMphValue! / 1.944))
        
        let kmHourValue = String(format:"%.4f",(nauticalMphValue! * 1.852))
        
        let milesHourValue = String(format:"%.4f",(nauticalMphValue! * 1.151))
        
        
        textFieldMetresS.text = String(mSecondsValue)
        textFieldKmH.text = String(kmHourValue)
        textFieldMilesH.text = String(milesHourValue)
        
        
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        
        let mSecondsValue = (textFieldMetresS.text?.isEmpty)! ? "" : textFieldMetresS.text!
        let kmHValue = (textFieldKmH.text?.isEmpty)! ? "" : textFieldKmH.text!
        let milesHourValue = (textFieldMilesH.text?.isEmpty)! ? "" : textFieldMilesH.text!
        let nauticalMphValue = (textFieldNauticalMilesH.text?.isEmpty)! ? "" : textFieldNauticalMilesH.text!
        
        
        // if function to ensure count equal zero
        
        if mSecondsValue.count == 0 && kmHValue.count == 0 && milesHourValue.count == 0 && nauticalMphValue.count == 0{
            return
        } else {
            
            let history = CreateHistory()
            
            history.createSpeedHistory(mSecondsValue: mSecondsValue, kmHValue: kmHValue, milesHourValue: milesHourValue, nauticalMphValue: nauticalMphValue)
            
            // create pop up window to notify users that everything has been saves
            let popUpMessage = UIAlertController(title: "Unit Converter App", message: "Data has been saved", preferredStyle: .alert)
            popUpMessage.addAction(UIAlertAction(title:"OK", style: .default, handler: nil))
            self.present(popUpMessage, animated: true, completion: nil)
            
        }
        
        
    }
    
    
    
    @IBAction func buttonHistory(_ sender: Any) {
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "HistoryController") as! HistoryController
        
        if let arrayList = UserDefaults.standard.value(forKey: User_Default.speed) as? [[String:String]] {
            controller.arrayList = arrayList
        }
        
        self.present(controller, animated: true, completion: nil)
        
        
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        switch (sender as UIButton).titleLabel?.text {
        case "1":
            print("1 pressed")
            switch selectedTextField{
            case "textFieldMetresS":
                textFieldMetresS.text = textFieldMetresS.text! + "1"
                metresTextField()
                
            case "textFieldKmH":
                textFieldKmH.text = textFieldKmH.text! + "1"
                kmTextField()
                
            case "textFieldMilesH":
                textFieldMilesH.text = textFieldMilesH.text! + "1"
                milesTextField()
            case "textFieldNauticalMilesH":
                textFieldNauticalMilesH.text = textFieldNauticalMilesH.text! + "1"
                nauticalTextField()
            default:
                break
            }
        case "2":
            print("2 pressed")
            switch selectedTextField{
            case "textFieldMetresS":
                textFieldMetresS.text = textFieldMetresS.text! + "2"
                metresTextField()
                
            case "textFieldKmH":
                textFieldKmH.text = textFieldKmH.text! + "2"
                kmTextField()
                
            case "textFieldMilesH":
                textFieldMilesH.text = textFieldMilesH.text! + "2"
                milesTextField()
            case "textFieldNauticalMilesH":
                textFieldNauticalMilesH.text = textFieldNauticalMilesH.text! + "2"
                nauticalTextField()
            default:
                break
            }
        case "3":
            print("3 pressed")
            switch selectedTextField{
            case "textFieldMetresS":
                textFieldMetresS.text = textFieldMetresS.text! + "3"
                metresTextField()
                
            case "textFieldKmH":
                textFieldKmH.text = textFieldKmH.text! + "3"
                kmTextField()
                
            case "textFieldMilesH":
                textFieldMilesH.text = textFieldMilesH.text! + "3"
                milesTextField()
            case "textFieldNauticalMilesH":
                textFieldNauticalMilesH.text = textFieldNauticalMilesH.text! + "3"
                nauticalTextField()
            default:
                break
            }
        case "4":
            print("4 pressed")
            switch selectedTextField{
            case "textFieldMetresS":
                textFieldMetresS.text = textFieldMetresS.text! + "4"
                metresTextField()
                
            case "textFieldKmH":
                textFieldKmH.text = textFieldKmH.text! + "4"
                kmTextField()
                
            case "textFieldMilesH":
                textFieldMilesH.text = textFieldMilesH.text! + "4"
                milesTextField()
            case "textFieldNauticalMilesH":
                textFieldNauticalMilesH.text = textFieldNauticalMilesH.text! + "4"
                nauticalTextField()
            default:
                break
            }
        case "5":
            print("5 pressed")
            switch selectedTextField{
            case "textFieldMetresS":
                textFieldMetresS.text = textFieldMetresS.text! + "5"
                metresTextField()
                
            case "textFieldKmH":
                textFieldKmH.text = textFieldKmH.text! + "5"
                kmTextField()
                
            case "textFieldMilesH":
                textFieldMilesH.text = textFieldMilesH.text! + "5"
                milesTextField()
            case "textFieldNauticalMilesH":
                textFieldNauticalMilesH.text = textFieldNauticalMilesH.text! + "5"
                nauticalTextField()
            default:
                break
            }
        case "6":
            print("6 pressed")
            switch selectedTextField{
            case "textFieldMetresS":
                textFieldMetresS.text = textFieldMetresS.text! + "6"
                metresTextField()
                
            case "textFieldKmH":
                textFieldKmH.text = textFieldKmH.text! + "6"
                kmTextField()
                
            case "textFieldMilesH":
                textFieldMilesH.text = textFieldMilesH.text! + "6"
                milesTextField()
            case "textFieldNauticalMilesH":
                textFieldNauticalMilesH.text = textFieldNauticalMilesH.text! + "6"
                nauticalTextField()
            default:
                break
            }
        case "7":
            print("7 pressed")
            switch selectedTextField{
            case "textFieldMetresS":
                textFieldMetresS.text = textFieldMetresS.text! + "7"
                metresTextField()
                
            case "textFieldKmH":
                textFieldKmH.text = textFieldKmH.text! + "7"
                kmTextField()
                
            case "textFieldMilesH":
                textFieldMilesH.text = textFieldMilesH.text! + "7"
                milesTextField()
            case "textFieldNauticalMilesH":
                textFieldNauticalMilesH.text = textFieldNauticalMilesH.text! + "7"
                nauticalTextField()
            default:
                break
            }
        case "8":
            print("8 pressed")
            switch selectedTextField{
            case "textFieldMetresS":
                textFieldMetresS.text = textFieldMetresS.text! + "8"
                metresTextField()
                
            case "textFieldKmH":
                textFieldKmH.text = textFieldKmH.text! + "8"
                kmTextField()
                
            case "textFieldMilesH":
                textFieldMilesH.text = textFieldMilesH.text! + "8"
                milesTextField()
            case "textFieldNauticalMilesH":
                textFieldNauticalMilesH.text = textFieldNauticalMilesH.text! + "8"
                nauticalTextField()
            default:
                break
            }
        case "9":
            print("9 pressed")
            switch selectedTextField{
            case "textFieldMetresS":
                textFieldMetresS.text = textFieldMetresS.text! + "9"
                metresTextField()
                
            case "textFieldKmH":
                textFieldKmH.text = textFieldKmH.text! + "9"
                kmTextField()
                
            case "textFieldMilesH":
                textFieldMilesH.text = textFieldMilesH.text! + "9"
                milesTextField()
            case "textFieldNauticalMilesH":
                textFieldNauticalMilesH.text = textFieldNauticalMilesH.text! + "9"
                nauticalTextField()
            default:
                break
            }
        case "0":
            print("0 pressed")
            switch selectedTextField{
            case "textFieldMetresS":
                textFieldMetresS.text = textFieldMetresS.text! + "0"
                metresTextField()
                
            case "textFieldKmH":
                textFieldKmH.text = textFieldKmH.text! + "0"
                kmTextField()
                
            case "textFieldMilesH":
                textFieldMilesH.text = textFieldMilesH.text! + "0"
                milesTextField()
            case "textFieldNauticalMilesH":
                textFieldNauticalMilesH.text = textFieldNauticalMilesH.text! + "0"
                nauticalTextField()
            default:
                break
            }
        case "DEL":
            print("0 pressed")
            switch selectedTextField{
            case "textFieldMetresS":
            if(textFieldMetresS.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldMetresS.text = String(textFieldMetresS.text!.dropLast())
                
                if(textFieldMetresS.text == "") {
                    textFieldMetresS.text = "0"
                }
                if(textFieldMetresS.text == "-") {
                    textFieldMetresS.text = "0"
                }

                metresTextField()
                
            case "textFieldKmH":
                if(textFieldKmH.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldKmH.text = String(textFieldKmH.text!.dropLast())
                
                if(textFieldKmH.text == "") {
                    textFieldKmH.text = "0"
                }
                if(textFieldKmH.text == "-") {
                    textFieldKmH.text = "0"
                }

                kmTextField()
                
            case "textFieldMilesH":
                if(textFieldMilesH.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldMilesH.text = String(textFieldMilesH.text!.dropLast())
                
                if(textFieldMilesH.text == "") {
                    textFieldMilesH.text = "0"
                }
                if(textFieldMilesH.text == "-") {
                    textFieldMilesH.text = "0"
                }
                milesTextField()
            case "textFieldNauticalMilesH":
                
                if(textFieldNauticalMilesH.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldNauticalMilesH.text = String(textFieldNauticalMilesH.text!.dropLast())
                
                if(textFieldNauticalMilesH.text == "") {
                    textFieldNauticalMilesH.text = "0"
                }
                if(textFieldNauticalMilesH.text == "-") {
                    textFieldNauticalMilesH.text = "0"
                }

                nauticalTextField()
            default:
                break
            }
        case ".":
            print(". pressed")
            
            buttonDecimalPoint.isEnabled = false
            buttonDecimalPoint.alpha = 0.5
            
            switch selectedTextField{
            case "textFieldMetresS":
                textFieldMetresS.text = textFieldMetresS.text! + "."
                metresTextField()
                
            case "textFieldKmH":
                textFieldKmH.text = textFieldKmH.text! + "."
                kmTextField()
                
            case "textFieldMilesH":
                textFieldMilesH.text = textFieldMilesH.text! + "."
                milesTextField()
            case "textFieldNauticalMilesH":
                textFieldNauticalMilesH.text = textFieldNauticalMilesH.text! + "."
                nauticalTextField()
            default:
                break
            }
            
        default:
            break
        }
        
    }

    }
