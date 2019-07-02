//
//  WeightViewController.swift
//  FinalUnit
//
//  Created by Bror Andreas Nordstrom on 14/03/2019.
//  Copyright © 2019 Bror Andreas Nordstrom. All rights reserved.
//

import UIKit


class WeightViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var textFieldKg: UITextField!
    @IBOutlet weak var textFieldGrams: UITextField!
    @IBOutlet weak var textFieldOunces: UITextField!
    @IBOutlet weak var textFieldPounds: UITextField!
    @IBOutlet weak var textFieldStone: UITextField!
    @IBOutlet weak var textFieldPound: UITextField!
    @IBOutlet weak var buttonDecimalPoint: UIButton!
    
    var selectedTextField = ""
    
    @IBOutlet weak var buttonNeg: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //removes build in keyboard
        
        textFieldKg.delegate = self
        textFieldGrams.delegate = self
        textFieldOunces.delegate = self
        textFieldPounds.delegate = self
        textFieldStone.delegate = self
        textFieldPound.delegate = self
    }
    // removes when pressed outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // removes keyboard when pressing return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    
  // select text field
    @IBAction func textFieldOneSelected(_ sender: UITextField) {
    
    
        selectedTextField = "textFieldKg"

        textFieldKg.text = ""
        textFieldGrams.text = ""
        textFieldOunces.text = ""
        textFieldPounds.text = ""
        textFieldStone.text = ""
        textFieldPound.text = ""

    }
    
    
    // function created for calculations of Kg
    
    func kgTextField() {
        
        
        if(textFieldKg.text == ""){
            textFieldKg.text = "0"}
 
        
        let kgValue = Double(textFieldKg.text!)
        
        // Textfield will display calculated value
        let gramsValue = String(format:"%.4f",(kgValue! * 1000))
        let ouncesValue = String(format:"%.4f",(kgValue! * 35.274))
        let poundsValue = String(format:"%.4f",(kgValue! * 2.205))
        let stoneValue = String(format:"%.4f",(kgValue! / 6.35))
        let stoneTwoValue = (kgValue! / 6.35).truncatingRemainder(dividingBy: 1)
        let poundValue = String(format:"%.4f",(stoneTwoValue * 14))
        
        
 
        textFieldGrams.text = String(gramsValue)
        textFieldOunces.text = String(ouncesValue)
        textFieldPounds.text = String(poundsValue)
        textFieldStone.text = String(stoneValue)
        textFieldPound.text = String(poundValue)
        
        
        
    }
    
    // select text field
   
    @IBAction func textFieldTwoSelected(_ sender: UITextField) {
    
        selectedTextField = "textFieldGrams"
        
        textFieldKg.text = ""
        textFieldGrams.text = ""
        textFieldOunces.text = ""
        textFieldPounds.text = ""
        textFieldStone.text = ""
        textFieldPound.text = ""
        
    }

    func gramsTextField() {
        
        if(textFieldGrams.text?.isEmpty)!{
            textFieldGrams.text="" }
        
        let gramsValue = Double(textFieldGrams.text!)
        guard gramsValue != nil else {
            return
        }
        // Textfield will display calculated value
        let kgValue = String(format:"%.4f",(gramsValue! / 1000))
        
        let ouncesValue = String(format:"%.4f",(gramsValue! / 28.35))
        
        let poundsValue = String(format:"%.4f",(gramsValue! / 453.592))
        
        let stoneValue = String(format:"%.4f",(gramsValue! / 6350.293))
        let stoneTwoValue = (gramsValue! / 6350.293).truncatingRemainder(dividingBy: 1)
        let poundValue = String(format:"%.4f",(stoneTwoValue * 14))
        
        // "%.4f" makes it to 4 decimal places
        
        
        textFieldKg.text = String(kgValue)
        textFieldOunces.text = String(ouncesValue)
        textFieldPounds.text = String(poundsValue)
        textFieldStone.text = String(stoneValue)
        textFieldPound.text = String(poundValue)
        
        
    }
    
    
    @IBAction func textFieldThreeSelected(_ sender: UITextField) {
    
    
        selectedTextField = "textFieldOunces"
        
        
        textFieldKg.text = ""
        textFieldGrams.text = ""
        textFieldOunces.text = ""
        textFieldPounds.text = ""
        textFieldStone.text = ""
        textFieldPound.text = ""
    }
    
    
    func ouncesTextField() {
        
        if(textFieldOunces.text?.isEmpty)!{
            textFieldOunces.text="" }
        
        let ouncesValue = Double(textFieldOunces.text!)
        guard ouncesValue != nil else {
            return
        }
        // Textfield will display calculated value
        let kgValue = String(format:"%.4f",(ouncesValue! / 35.274))
        
        let gramsValue = String(format:"%.4f",(ouncesValue! * 28.35))
        
        let poundsValue = String(format:"%.4f",(ouncesValue! / 16))
        
        let stoneValue = String(format:"%.4f",(ouncesValue! / 224))
        let stoneTwoValue = (ouncesValue! / 224).truncatingRemainder(dividingBy: 1)
        let poundValue = String(format:"%.4f",(stoneTwoValue * 14))
        
        
        textFieldKg.text = String(kgValue)
        textFieldGrams.text = String(gramsValue)
        textFieldPounds.text = String(poundsValue)
        textFieldStone.text = String(stoneValue)
        textFieldPound.text = String(poundValue)
        
    }
    
    
    @IBAction func textFieldFourSelected(_ sender: UITextField) {
    
    
        selectedTextField = "textFieldPounds"
    
        
        textFieldKg.text = ""
        textFieldGrams.text = ""
        textFieldOunces.text = ""
        textFieldPounds.text = ""
        textFieldStone.text = ""
        textFieldPound.text = ""
    }
    
   
    func poundsTextField() {
        
        if(textFieldPounds.text?.isEmpty)!{
            textFieldPounds.text="" }
        
        let poundsValue = Double(textFieldPounds.text!)
        guard poundsValue != nil else {
            return
        }
        // Textfield will display calculated value
        let kgValue = String(format:"%.4f",(poundsValue! / 2.205))
        
        let gramsValue = String(format:"%.4f",(poundsValue! * 453.592))
        
        let ouncesValue = String(format:"%.4f",(poundsValue! * 16))
        
        let stoneValue = String(format:"%.4f",(poundsValue! / 14))
        let stoneTwoValue = (poundsValue! / 14).truncatingRemainder(dividingBy: 1)
        let poundValue = String(format:"%.4f",(stoneTwoValue * 14))
        
        
        
        textFieldKg.text = String(kgValue)
        textFieldGrams.text = String(gramsValue)
        textFieldOunces.text = String(ouncesValue)
        textFieldStone.text = String(stoneValue)
        textFieldPound.text = String(poundValue)
        
    }
    
    @IBAction func textFieldFiveSelected(_ sender: UITextField) {
        selectedTextField = "textFieldStone"
        
        
        textFieldKg.text = ""
        textFieldGrams.text = ""
        textFieldOunces.text = ""
        textFieldPounds.text = ""
        textFieldStone.text = ""
        textFieldPound.text = ""
        
        
    }
    
    func stoneTextField() {
                //After checking if the stonetextfield is nil the value is converted into a double in order to calculate each respective value before it is assigned to the textboxes
        
        if(textFieldStone.text?.isEmpty)!{
            textFieldStone.text="" }
        
        let stoneValue = Double(textFieldStone.text!)
        guard stoneValue != nil else {
            return
        }
        // Textfield will display calculated value
        

        let kgValue = String(format:"%.4f",(stoneValue! * 6.35))
        
        let gramsValue = String(format:"%.4f",(stoneValue! * 6350.293))
        
        let ouncesValue = String(format:"%.4f",(stoneValue! * 224))
        
        let poundsValue = String(format:"%.4f",(stoneValue! * 14))
        
        let stoneTwoValue = (stoneValue! / 14).truncatingRemainder(dividingBy: 1)
        let poundValue = String(format:"%.4f",(stoneTwoValue * 14))
        
        
        textFieldKg.text = String(kgValue)
        textFieldGrams.text = String(gramsValue)
        textFieldOunces.text = String(ouncesValue)
        textFieldPounds.text = String(poundsValue)
        textFieldPound.text = String(poundValue)
        
        
    }
    
    
    
    @IBAction func textFieldSixSelected(_ sender: UITextField) {
        
        selectedTextField = "textFieldPound"
        
        
        textFieldKg.text = ""
        textFieldGrams.text = ""
        textFieldOunces.text = ""
        textFieldPounds.text = ""
        textFieldStone.text = ""
        textFieldPound.text = ""
        
    }
    
    func poundTextField() {
        
        if(textFieldPound.text?.isEmpty)!{
            textFieldPound.text="" }
        
        let poundValue = Double(textFieldPound.text!)
        guard poundValue != nil else {
        return
            
        }
        //Once the string has been converted to a double, the kilograms,grams & ounce values are calculated and rounded to four decimal places
        let kgValue = String(format:"%.4f",(poundValue! / 2.205))
        
        let gramsValue = String(format:"%.4f",(poundValue! * 453.592))
        
        let ouncesValue = String(format:"%.4f",(poundValue! * 16))
        
      //  let poundsValue = String(format:"%.0f",(stoneTwoValue * 14))
        
        let stoneValue = String(format:"%.4f",(poundValue! / 14))
        let stoneTwoValue = (poundValue! / 14).truncatingRemainder(dividingBy: 1)
        let poundsValue = String(format:"%.4f",(stoneTwoValue * 14))
        
        //The varibales are then converted to strings and assigned to their respective textboxes
        textFieldKg.text = String (kgValue)
        textFieldGrams.text = String (gramsValue)
        textFieldOunces.text = String(ouncesValue)
        textFieldPounds.text = String(poundsValue)
        textFieldStone.text = String(stoneValue)
        
        
    
    }
    
    
    //Weight calculations are stored in a JSON format and is then stored in an array of objects
    @IBAction func buttonSave(_ sender: Any) {
        
        let kgValue = (textFieldKg.text?.isEmpty)! ? "" : textFieldKg.text!
        let gramsValue = (textFieldGrams.text?.isEmpty)! ? "" : textFieldGrams.text!
        let ouncesValue = (textFieldOunces.text?.isEmpty)! ? "" : textFieldOunces.text!
        let poundsValue = (textFieldPounds.text?.isEmpty)! ? "" : textFieldPounds.text!
        let stoneValue = (textFieldStone.text?.isEmpty)! ? "" : textFieldStone.text!
        let poundValue = (textFieldPound.text?.isEmpty)! ? "" : textFieldPound.text!
        
        // if function to ensure count equal zero
        
        if kgValue.count == 0 && gramsValue.count == 0 && ouncesValue.count == 0 && poundsValue.count == 0 && stoneValue.count == 0 && poundValue.count == 0 {
            return
        } else {
            
            let history = CreateHistory()
            
            history.createWeightHistory(kgValue: kgValue, gramsValue: gramsValue, ouncesValue: ouncesValue, poundsValue: poundsValue, stoneValue: stoneValue, poundValue:poundValue)
            
            // create pop up window to notify users that everything has been saves
            let popUpMessage = UIAlertController(title: "Unit Converter App", message: "Data has been saved", preferredStyle: .alert)
            popUpMessage.addAction(UIAlertAction(title:"OK", style: .default, handler: nil))
            self.present(popUpMessage, animated: true, completion: nil)
            
        }
    }
    
    // view history button
    
    
    @IBAction func buttonHistory(_ sender: Any) {
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "HistoryController") as! HistoryController
        
        if let arrayList = UserDefaults.standard.value(forKey: User_Default.weight) as? [[String:String]] {
            controller.arrayList = arrayList
        }
        
        self.present(controller, animated: true, completion: nil)
        
    }

    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        switch (sender as UIButton).titleLabel?.text {
        case "1":
            print("1 pressed")
            switch selectedTextField{
            case "textFieldKg":
                textFieldKg.text = textFieldKg.text! + "1"
                kgTextField()
                
            case "textFieldGrams":
                textFieldGrams.text = textFieldGrams.text! + "1"
                gramsTextField()
                
            case "textFieldOunces":
                textFieldOunces.text = textFieldOunces.text! + "1"
                ouncesTextField()
            case "textFieldPounds":
                textFieldPounds.text = textFieldPounds.text! + "1"
                poundsTextField()
            case "textFieldStone":
                textFieldStone.text = textFieldStone.text! + "1"
                stoneTextField()
            case "textFieldPound":
                textFieldPound.text = textFieldPound.text! + "1"
                poundTextField()
            default:
                break
            }
        case "2":
            print("2 pressed")
            switch selectedTextField{
            case "textFieldKg":
                textFieldKg.text = textFieldKg.text! + "2"
                kgTextField()
                
            case "textFieldGrams":
                textFieldGrams.text = textFieldGrams.text! + "2"
                gramsTextField()
                
            case "textFieldOunces":
                textFieldOunces.text = textFieldOunces.text! + "2"
                ouncesTextField()
            case "textFieldPounds":
                textFieldPounds.text = textFieldPounds.text! + "2"
                poundsTextField()
            case "textFieldStone":
                textFieldStone.text = textFieldStone.text! + "2"
                stoneTextField()
            case "textFieldPound":
                textFieldPound.text = textFieldPound.text! + "2"
                poundTextField()
            default:
                break
            }
        case "3":
            print("3 pressed")
            switch selectedTextField{
            case "textFieldKg":
                textFieldKg.text = textFieldKg.text! + "3"
                kgTextField()
                
            case "textFieldGrams":
                textFieldGrams.text = textFieldGrams.text! + "3"
                gramsTextField()
                
            case "textFieldOunces":
                textFieldOunces.text = textFieldOunces.text! + "3"
                ouncesTextField()
            case "textFieldPounds":
                textFieldPounds.text = textFieldPounds.text! + "3"
                poundsTextField()
            case "textFieldStone":
                textFieldStone.text = textFieldStone.text! + "3"
                stoneTextField()
            case "textFieldPound":
                textFieldPound.text = textFieldPound.text! + "3"
                poundTextField()
            default:
                break
            }
        case "4":
            print("4 pressed")
            switch selectedTextField{
            case "textFieldKg":
                textFieldKg.text = textFieldKg.text! + "4"
                kgTextField()
                
            case "textFieldGrams":
                textFieldGrams.text = textFieldGrams.text! + "4"
                gramsTextField()
                
            case "textFieldOunces":
                textFieldOunces.text = textFieldOunces.text! + "4"
                ouncesTextField()
            case "textFieldPounds":
                textFieldPounds.text = textFieldPounds.text! + "4"
                poundsTextField()
            case "textFieldStone":
                textFieldStone.text = textFieldStone.text! + "4"
                stoneTextField()
            case "textFieldPound":
                textFieldPound.text = textFieldPound.text! + "4"
                poundTextField()
            default:
                break
            }
        case "5":
            print("5 pressed")
            switch selectedTextField{
            case "textFieldKg":
                textFieldKg.text = textFieldKg.text! + "5"
                kgTextField()
                
            case "textFieldGrams":
                textFieldGrams.text = textFieldGrams.text! + "5"
                gramsTextField()
                
            case "textFieldOunces":
                textFieldOunces.text = textFieldOunces.text! + "5"
                ouncesTextField()
            case "textFieldPounds":
                textFieldPounds.text = textFieldPounds.text! + "5"
                poundsTextField()
            case "textFieldStone":
                textFieldStone.text = textFieldStone.text! + "5"
                stoneTextField()
            case "textFieldPound":
                textFieldPound.text = textFieldPound.text! + "5"
                poundTextField()
            default:
                break
            }
        case "6":
            print("6 pressed")
            switch selectedTextField{
            case "textFieldKg":
                textFieldKg.text = textFieldKg.text! + "6"
                kgTextField()
                
            case "textFieldGrams":
                textFieldGrams.text = textFieldGrams.text! + "6"
                gramsTextField()
                
            case "textFieldOunces":
                textFieldOunces.text = textFieldOunces.text! + "6"
                ouncesTextField()
            case "textFieldPounds":
                textFieldPounds.text = textFieldPounds.text! + "6"
                poundsTextField()
            case "textFieldStone":
                textFieldStone.text = textFieldStone.text! + "6"
                stoneTextField()
            case "textFieldPound":
                textFieldPound.text = textFieldPound.text! + "6"
                poundTextField()
            default:
                break
            }
        case "7":
            print("7 pressed")
            switch selectedTextField{
            case "textFieldKg":
                textFieldKg.text = textFieldKg.text! + "7"
                kgTextField()
                
            case "textFieldGrams":
                textFieldGrams.text = textFieldGrams.text! + "7"
                gramsTextField()
                
            case "textFieldOunces":
                textFieldOunces.text = textFieldOunces.text! + "7"
                ouncesTextField()
            case "textFieldPounds":
                textFieldPounds.text = textFieldPounds.text! + "7"
                poundsTextField()
            case "textFieldStone":
                textFieldStone.text = textFieldStone.text! + "7"
                stoneTextField()
            case "textFieldPound":
                textFieldPound.text = textFieldPound.text! + "7"
                poundTextField()
            default:
                break
            }
        case "8":
            print("8 pressed")
            switch selectedTextField{
            case "textFieldKg":
                textFieldKg.text = textFieldKg.text! + "8"
                kgTextField()
                
            case "textFieldGrams":
                textFieldGrams.text = textFieldGrams.text! + "8"
                gramsTextField()
                
            case "textFieldOunces":
                textFieldOunces.text = textFieldOunces.text! + "8"
                ouncesTextField()
            case "textFieldPounds":
                textFieldPounds.text = textFieldPounds.text! + "8"
                poundsTextField()
            case "textFieldStone":
                textFieldStone.text = textFieldStone.text! + "8"
                stoneTextField()
            case "textFieldPound":
                textFieldPound.text = textFieldPound.text! + "8"
                poundTextField()
            default:
                break
            }
        case "9":
            print("9 pressed")
            switch selectedTextField{
            case "textFieldKg":
                textFieldKg.text = textFieldKg.text! + "9"
                kgTextField()
                
            case "textFieldGrams":
                textFieldGrams.text = textFieldGrams.text! + "9"
                gramsTextField()
                
            case "textFieldOunces":
                textFieldOunces.text = textFieldOunces.text! + "9"
                ouncesTextField()
            case "textFieldPounds":
                textFieldPounds.text = textFieldPounds.text! + "9"
                poundsTextField()
            case "textFieldStone":
                textFieldStone.text = textFieldStone.text! + "9"
                stoneTextField()
            case "textFieldPound":
                textFieldPound.text = textFieldPound.text! + "9"
                poundTextField()
            default:
                break
            }
        case "0":
            print("0 pressed")
            switch selectedTextField{
            case "textFieldKg":
                textFieldKg.text = textFieldKg.text! + "0"
                kgTextField()
                
            case "textFieldGrams":
                textFieldGrams.text = textFieldGrams.text! + "0"
                gramsTextField()
                
            case "textFieldOunces":
                textFieldOunces.text = textFieldOunces.text! + "0"
                ouncesTextField()
            case "textFieldPounds":
                textFieldPounds.text = textFieldPounds.text! + "0"
                poundsTextField()
            case "textFieldStone":
                textFieldStone.text = textFieldStone.text! + "0"
                stoneTextField()
            case "textFieldPound":
                textFieldPound.text = textFieldPound.text! + "0"
                poundTextField()
            default:
                break
            }
        case "DEL":
            print("Delete pressed")
            switch selectedTextField{
            case "textFieldKg":
                if(textFieldKg.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldKg.text = String(textFieldKg.text!.dropLast())
                
                if(textFieldKg.text == "") {
                    textFieldKg.text = "0"
                }
                if(textFieldKg.text == "-") {
                    textFieldKg.text = "0"
                }
                
                kgTextField()
                
            case "textFieldGrams":
                if(textFieldGrams.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldGrams.text = String(textFieldGrams.text!.dropLast())
                
                if(textFieldGrams.text == "") {
                    textFieldGrams.text = "0"
                }
                if(textFieldGrams.text == "-") {
                    textFieldGrams.text = "0"
                }
                gramsTextField()
                
            case "textFieldOunces":
                if(textFieldOunces.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldOunces.text = String(textFieldOunces.text!.dropLast())
                
                if(textFieldOunces.text == "") {
                    textFieldOunces.text = "0"
                }
                if(textFieldOunces.text == "-") {
                    textFieldOunces.text = "0"
                }
                ouncesTextField()
                
            case "textFieldPounds":
                if(textFieldPounds.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldPounds.text = String(textFieldPounds.text!.dropLast())
                
                if(textFieldPounds.text == "") {
                    textFieldPounds.text = "0"
                }
                if(textFieldPounds.text == "-") {
                    textFieldPounds.text = "0"
                }
                poundsTextField()
            case "textFieldStone":
                if(textFieldStone.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldStone.text = String(textFieldStone.text!.dropLast())
                
                if(textFieldStone.text == "") {
                    textFieldStone.text = "0"
                }
                if(textFieldStone.text == "-") {
                    textFieldStone.text = "0"
                }
                stoneTextField()
            case "textFieldPound":
                if(textFieldPound.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldPound.text = String(textFieldPound.text!.dropLast())
                
                if(textFieldPound.text == "") {
                    textFieldPound.text = "0"
                }
                if(textFieldPound.text == "-") {
                    textFieldPound.text = "0"
                }
                poundTextField()
            default:
                break
            }
        case ".":
            print(". pressed")
            
            // disabling the decimal point button
            
            buttonDecimalPoint.isEnabled = false
            
            
        // adjusting the colour post pressing upon
            buttonDecimalPoint.alpha = 0.5;
        
            switch selectedTextField{
            case "textFieldKg":
                textFieldKg.text = textFieldKg.text! + "."
                kgTextField()
                
            case "textFieldGrams":
                textFieldGrams.text = textFieldGrams.text! + "."
                gramsTextField()
                
            case "textFieldOunces":
                textFieldOunces.text = textFieldOunces.text! + "."
                ouncesTextField()
            case "textFieldPounds":
                textFieldPounds.text = textFieldPounds.text! + "."
                poundsTextField()
            case "textFieldStone":
                textFieldStone.text = textFieldStone.text! + "."
                stoneTextField()
            case "textFieldPound":
                textFieldPound.text = textFieldPound.text! + "."
                poundTextField()
            default:
                break
            }
            
        default:
            break
        }
    
}
    
 

}
