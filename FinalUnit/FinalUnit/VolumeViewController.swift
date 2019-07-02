//
//  VolumeViewController.swift
//  FinalUnit
//
//  Created by Bror Andreas Nordstrom on 15/03/2019.
//  Copyright © 2019 Bror Andreas Nordstrom. All rights reserved.
//

import UIKit

class VolumeViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var textFieldGallon: UITextField!
    @IBOutlet weak var textFieldLitre: UITextField!
    @IBOutlet weak var textFieldUKPint: UITextField!
    @IBOutlet weak var textFieldFluidOunce: UITextField!
    @IBOutlet weak var textFieldMillilitre: UITextField!
    @IBOutlet weak var buttonDecimalPoint: UIButton!
    
    
    
    var selectedTextField = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // remove build in keyboard
        textFieldGallon.delegate = self
        textFieldLitre.delegate = self
        textFieldUKPint.delegate = self
        textFieldFluidOunce.delegate = self
        textFieldMillilitre.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

    
    @IBAction func textFieldOneSelected(_ sender: UITextField) {
        
        selectedTextField = "textFieldGallon"
        textFieldGallon.text = ""
        textFieldLitre.text = ""
        textFieldUKPint.text = ""
        textFieldFluidOunce.text = ""
        textFieldMillilitre.text = ""
    }
    
    func gallonTextField() {
        
    //Once the string has been converted to a double, the gallon,litre, pint, ounce & millillitre values are calculated and rounded to four decimal places
        
        if(textFieldGallon.text == ""){
            textFieldGallon.text = "0"}
        
        let gallonValue = Double(textFieldGallon.text!)
        
        let litreValue = String(format: "%.4f",(gallonValue! * 4.546))
        
        let ukPintValue = String(format: "%.4f", (gallonValue! * 8))
        
        let fluidOunceValue = String(format: "%.4f", (gallonValue! * 160))
        
        let mLitreValue = String(format: "%.4f",(gallonValue! * 4546.09))
        
        
        textFieldLitre.text = String(litreValue)
        textFieldUKPint.text = String(ukPintValue)
        textFieldFluidOunce.text = String(fluidOunceValue)
        textFieldMillilitre.text = String(mLitreValue)
    }
    
    @IBAction func textFieldTwoSelected(_ sender: UITextField) {
        
        selectedTextField = "textFieldLitre"
        textFieldGallon.text = ""
        textFieldLitre.text = ""
        textFieldUKPint.text = ""
        textFieldFluidOunce.text = ""
        textFieldMillilitre.text = ""
        
    }
    
    func litreTextField() {
        
//Once the string has been converted to a double, the gallon, pint, ounce & millillitre values are calculated and rounded to four decimal places
        
        if(textFieldLitre.text == ""){
            textFieldLitre.text = "0"}
        
        let litreValue = Double(textFieldLitre.text!)
        
        let gallonValue = String(format: "%.4f",(litreValue! / 4.546))
        let ukPintValue = String(format: "%.4f",(litreValue! * 1.76))
        let fluidOunceValue = String(format: "%.4f",(litreValue! * 35.195))
        let mLitreValue = String(format: "%.4f", (litreValue! * 1000))
        
        textFieldGallon.text = String(gallonValue)
        textFieldUKPint.text = String(ukPintValue)
        textFieldFluidOunce.text = String(fluidOunceValue)
        textFieldMillilitre.text = String(mLitreValue)
        
    }
    
    @IBAction func textFieldThreeSelected(_ sender: UITextField) {
        
        selectedTextField = "textFieldUKPint"
        textFieldGallon.text = ""
        textFieldLitre.text = ""
        textFieldUKPint.text = ""
        textFieldFluidOunce.text = ""
        textFieldMillilitre.text = ""
        
    }
    
    func ukPintTextField() {
        
            //Once the string has been converted to a double, the gallon,litre, ounce & millillitre values are calculated and rounded to four decimal places
        if(textFieldUKPint.text == ""){
            textFieldUKPint.text = "0"}
    
    let ukPintValue = Double(textFieldUKPint.text!)
    
    let gallonValue = String(format: "%.4f",(ukPintValue! / 8))
    let litreValue = String(format: "%.4f",(ukPintValue! / 1.76))
    let fluidOunceValue = String(format: "%.4f",(ukPintValue! * 20))
    let mLitreValue = String(format: "%.4f",(ukPintValue! * 568.261))
    
    
    
    textFieldGallon.text = String(gallonValue)
    textFieldLitre.text = String(litreValue)
    textFieldFluidOunce.text = String(fluidOunceValue)
    textFieldMillilitre.text = String(mLitreValue)
        
    }
    
    @IBAction func textFieldFourSelected(_ sender: UITextField) {
        
        selectedTextField = "textFieldFluidOunce"
        textFieldGallon.text = ""
        textFieldLitre.text = ""
        textFieldUKPint.text = ""
        textFieldFluidOunce.text = ""
        textFieldMillilitre.text = ""
        
    }
    
    func fluidOunceTextField() {
        //Once the string has been converted to a double, the gallon,litre, pint & millillitre values are calculated and rounded to four decimal places
        
        if(textFieldFluidOunce.text == ""){
            textFieldFluidOunce.text = "0"}
        
        let fluidOunceValue = Double(textFieldFluidOunce.text!)
        
        let gallonValue = String(format: "%.4f", fluidOunceValue! / 160)
        let litreValue = String(format:"%.4f",(fluidOunceValue! / 35.195))
        let ukPintValue = String(format:"%.4f",(fluidOunceValue! / 20))
        let mLitreValue = String(format:"%.4f",(fluidOunceValue! * 28.413))
        
        
        textFieldGallon.text = String(gallonValue)
        textFieldLitre.text = String(litreValue)
        textFieldUKPint.text = String(ukPintValue)
        textFieldMillilitre.text = String(mLitreValue)

        
    }
    
    @IBAction func textFieldFiveSelected(_ sender: UITextField) {
        
        selectedTextField = "textFieldMillilitre"
        textFieldGallon.text = ""
        textFieldLitre.text = ""
        textFieldUKPint.text = ""
        textFieldFluidOunce.text = ""
        textFieldMillilitre.text = ""
        
    }
    
    func millilitreTextField() {
        
            //Once the string has been converted to a double, the gallon,litre, pint & ounce values are calculated and rounded to four decimal places
        
        if(textFieldMillilitre.text == ""){
            textFieldMillilitre.text = "0"}
        
        let mLitreValue = Double(textFieldMillilitre.text!)
        
        let gallonValue = String(format:"%.4f",(mLitreValue! / 4546.09))
        let litreValue = String(format:"%.4f",(mLitreValue! / 1000))
        let ukPintValue = String(format:"%.4f",(mLitreValue! / 568.261))
        let fluidOunceValue = String(format:"%.4f",(mLitreValue! / 28.413))
        
        textFieldGallon.text = String(gallonValue)
        textFieldLitre.text = String(litreValue)
        textFieldUKPint.text = String(ukPintValue)
        textFieldFluidOunce.text = String(fluidOunceValue)
        
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        
        let gallonValue = (textFieldGallon.text?.isEmpty)! ? "" : textFieldGallon.text!
        let litreValue = (textFieldLitre.text?.isEmpty)! ? "" : textFieldLitre.text!
        let ukPintValue = (textFieldUKPint.text?.isEmpty)! ? "" : textFieldUKPint.text!
        let fluidOunceValue = (textFieldFluidOunce.text?.isEmpty)! ? "" : textFieldFluidOunce.text!
        let mLitreValue = (textFieldMillilitre.text?.isEmpty)! ? "" : textFieldMillilitre.text!
        
        // if function to force count to equal zero
        
        if gallonValue.count == 0 && litreValue.count == 0 && ukPintValue.count == 0 && fluidOunceValue.count == 0 && mLitreValue.count == 0 {
            return
        } else {
            
            let history = CreateHistory()
            
            history.createVolumeHistory(gallonValue: gallonValue, litreValue: litreValue, ukPintValue: ukPintValue, fluidOunceValue: fluidOunceValue, mLitreValue: mLitreValue)
            
            // generate pop up window to notify users that data has been saved
            
            let popUpMessage = UIAlertController(title: "Unit Converter App", message: "Data has been saved", preferredStyle: .alert)
            popUpMessage.addAction(UIAlertAction(title:"OK", style: .default, handler: nil))
            self.present(popUpMessage, animated: true, completion: nil)
            
        }
    }
    
    // view history button
    
    
    @IBAction func buttonHistory(_ sender: Any) {
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "HistoryController") as! HistoryController
        
        if let arrayList = UserDefaults.standard.value(forKey: User_Default.volume) as? [[String:String]] {
            controller.arrayList = arrayList
        }
        
        self.present(controller, animated: true, completion: nil)
        
    }
    
    

    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        switch (sender as UIButton).titleLabel?.text {
        case "1":
            print("1 pressed")
            switch selectedTextField{
            case "textFieldGallon":
                textFieldGallon.text = textFieldGallon.text! + "1"
                gallonTextField()
                
            case "textFieldLitre":
                textFieldLitre.text = textFieldLitre.text! + "1"
                litreTextField()
                
            case "textFieldUKPint":
                textFieldUKPint.text = textFieldUKPint.text! + "1"
                ukPintTextField()
            case "textFieldFluidOunce":
                textFieldFluidOunce.text = textFieldFluidOunce.text! + "1"
                fluidOunceTextField()
            case "textFieldMillilitre":
                textFieldMillilitre.text = textFieldMillilitre.text! + "1"
                millilitreTextField()
            default:
                break
            }
        case "2":
            print("2 pressed")
            switch selectedTextField{
            case "textFieldGallon":
                textFieldGallon.text = textFieldGallon.text! + "2"
                gallonTextField()
                
            case "textFieldLitre":
                textFieldLitre.text = textFieldLitre.text! + "2"
                litreTextField()
                
            case "textFieldUKPint":
                textFieldUKPint.text = textFieldUKPint.text! + "2"
                ukPintTextField()
            case "textFieldFluidOunce":
                textFieldFluidOunce.text = textFieldFluidOunce.text! + "2"
                fluidOunceTextField()
            case "textFieldMillilitre":
                textFieldMillilitre.text = textFieldMillilitre.text! + "2"
                millilitreTextField()
            default:
                break
            }
        case "3":
            print("3 pressed")
            switch selectedTextField{
            case "textFieldGallon":
                textFieldGallon.text = textFieldGallon.text! + "3"
                gallonTextField()
                
            case "textFieldLitre":
                textFieldLitre.text = textFieldLitre.text! + "3"
                litreTextField()
                
            case "textFieldUKPint":
                textFieldUKPint.text = textFieldUKPint.text! + "3"
                ukPintTextField()
            case "textFieldFluidOunce":
                textFieldFluidOunce.text = textFieldFluidOunce.text! + "3"
                fluidOunceTextField()
            case "textFieldMillilitre":
                textFieldMillilitre.text = textFieldMillilitre.text! + "3"
                millilitreTextField()
            default:
                break
            }
        case "4":
            print("4 pressed")
            switch selectedTextField{
            case "textFieldGallon":
                textFieldGallon.text = textFieldGallon.text! + "4"
                gallonTextField()
                
            case "textFieldLitre":
                textFieldLitre.text = textFieldLitre.text! + "4"
                litreTextField()
                
            case "textFieldUKPint":
                textFieldUKPint.text = textFieldUKPint.text! + "4"
                ukPintTextField()
            case "textFieldFluidOunce":
                textFieldFluidOunce.text = textFieldFluidOunce.text! + "4"
                fluidOunceTextField()
            case "textFieldMillilitre":
                textFieldMillilitre.text = textFieldMillilitre.text! + "4"
                millilitreTextField()
            default:
                break
            }
        case "5":
            print("5 pressed")
            switch selectedTextField{
            case "textFieldGallon":
                textFieldGallon.text = textFieldGallon.text! + "5"
                gallonTextField()
                
            case "textFieldLitre":
                textFieldLitre.text = textFieldLitre.text! + "5"
                litreTextField()
                
            case "textFieldUKPint":
                textFieldUKPint.text = textFieldUKPint.text! + "5"
                ukPintTextField()
            case "textFieldFluidOunce":
                textFieldFluidOunce.text = textFieldFluidOunce.text! + "5"
                fluidOunceTextField()
            case "textFieldMillilitre":
                textFieldMillilitre.text = textFieldMillilitre.text! + "5"
                millilitreTextField()
            default:
                break
            }
        case "6":
            print("6 pressed")
            switch selectedTextField{
            case "textFieldGallon":
                textFieldGallon.text = textFieldGallon.text! + "6"
                gallonTextField()
                
            case "textFieldLitre":
                textFieldLitre.text = textFieldLitre.text! + "6"
                litreTextField()
                
            case "textFieldUKPint":
                textFieldUKPint.text = textFieldUKPint.text! + "6"
                ukPintTextField()
            case "textFieldFluidOunce":
                textFieldFluidOunce.text = textFieldFluidOunce.text! + "6"
                fluidOunceTextField()
            case "textFieldMillilitre":
                textFieldMillilitre.text = textFieldMillilitre.text! + "6"
                millilitreTextField()
            default:
                break
            }
        case "7":
            print("7 pressed")
            switch selectedTextField{
            case "textFieldGallon":
                textFieldGallon.text = textFieldGallon.text! + "7"
                gallonTextField()
                
            case "textFieldLitre":
                textFieldLitre.text = textFieldLitre.text! + "7"
                litreTextField()
                
            case "textFieldUKPint":
                textFieldUKPint.text = textFieldUKPint.text! + "7"
                ukPintTextField()
            case "textFieldFluidOunce":
                textFieldFluidOunce.text = textFieldFluidOunce.text! + "7"
                fluidOunceTextField()
            case "textFieldMillilitre":
                textFieldMillilitre.text = textFieldMillilitre.text! + "7"
                millilitreTextField()
            default:
                break
            }
        case "8":
            print("8 pressed")
            switch selectedTextField{
            case "textFieldGallon":
                textFieldGallon.text = textFieldGallon.text! + "8"
                gallonTextField()
                
            case "textFieldLitre":
                textFieldLitre.text = textFieldLitre.text! + "8"
                litreTextField()
                
            case "textFieldUKPint":
                textFieldUKPint.text = textFieldUKPint.text! + "8"
                ukPintTextField()
            case "textFieldFluidOunce":
                textFieldFluidOunce.text = textFieldFluidOunce.text! + "8"
                fluidOunceTextField()
            case "textFieldMillilitre":
                textFieldMillilitre.text = textFieldMillilitre.text! + "8"
                millilitreTextField()
            default:
                break
            }
        case "9":
            print("9 pressed")
            switch selectedTextField{
            case "textFieldGallon":
                textFieldGallon.text = textFieldGallon.text! + "9"
                gallonTextField()
                
            case "textFieldLitre":
                textFieldLitre.text = textFieldLitre.text! + "9"
                litreTextField()
                
            case "textFieldUKPint":
                textFieldUKPint.text = textFieldUKPint.text! + "9"
                ukPintTextField()
            case "textFieldFluidOunce":
                textFieldFluidOunce.text = textFieldFluidOunce.text! + "9"
                fluidOunceTextField()
            case "textFieldMillilitre":
                textFieldMillilitre.text = textFieldMillilitre.text! + "9"
                millilitreTextField()
            default:
                break
            }
        case "0":
            print("0 pressed")
            switch selectedTextField{
            case "textFieldGallon":
                textFieldGallon.text = textFieldGallon.text! + "0"
                gallonTextField()
                
            case "textFieldLitre":
                textFieldLitre.text = textFieldLitre.text! + "0"
                litreTextField()
                
            case "textFieldUKPint":
                textFieldUKPint.text = textFieldUKPint.text! + "0"
                ukPintTextField()
            case "textFieldFluidOunce":
                textFieldFluidOunce.text = textFieldFluidOunce.text! + "0"
                fluidOunceTextField()
            case "textFieldMillilitre":
                textFieldMillilitre.text = textFieldMillilitre.text! + "0"
                millilitreTextField()
            default:
                break
            }
        case "DEL":
            print("0 pressed")
            switch selectedTextField{
            case "textFieldGallon":
                
                if(textFieldGallon.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldGallon.text = String(textFieldGallon.text!.dropLast())
                
                if(textFieldGallon.text == "") {
                    textFieldGallon.text = "0"
                }
                if(textFieldGallon.text == "-") {
                    textFieldGallon.text = "0"
                }
                
                gallonTextField()
                
            case "textFieldLitre":
                
                if(textFieldLitre.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldLitre.text = String(textFieldLitre.text!.dropLast())
                
                if(textFieldLitre.text == "") {
                    textFieldLitre.text = "0"
                }
                if(textFieldLitre.text == "-") {
                    textFieldLitre.text = "0"
                }
                litreTextField()
                
            case "textFieldUKPint":
                if(textFieldUKPint.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldUKPint.text = String(textFieldUKPint.text!.dropLast())
                
                if(textFieldUKPint.text == "") {
                    textFieldUKPint.text = "0"
                }
                if(textFieldUKPint.text == "-") {
                    textFieldUKPint.text = "0"
                }

                ukPintTextField()
                
            case "textFieldFluidOunce":
                if(textFieldFluidOunce.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldFluidOunce.text = String(textFieldFluidOunce.text!.dropLast())
                
                if(textFieldFluidOunce.text == "") {
                    textFieldFluidOunce.text = "0"
                }
                if(textFieldFluidOunce.text == "-") {
                    textFieldFluidOunce.text = "0"
                }
                

                fluidOunceTextField()
            case "textFieldMillilitre":
                if(textFieldMillilitre.text!.last == "."){
                    buttonDecimalPoint.isEnabled = true
                }
                
                textFieldMillilitre.text = String(textFieldMillilitre.text!.dropLast())
                
                if(textFieldMillilitre.text == "") {
                    textFieldMillilitre.text = "0"
                }
                if(textFieldMillilitre.text == "-") {
                    textFieldMillilitre.text = "0"
                }
                millilitreTextField()
                
            default:
                break
            }
        case ".":
            print("0 pressed")
            
            buttonDecimalPoint.isEnabled = false
            
            buttonDecimalPoint.alpha = 0.5
            
            switch selectedTextField{
            case "textFieldGallon":
                textFieldGallon.text = textFieldGallon.text! + "."
                gallonTextField()
                
            case "textFieldLitre":
                textFieldLitre.text = textFieldLitre.text! + "."
                litreTextField()
                
            case "textFieldUKPint":
                textFieldUKPint.text = textFieldUKPint.text! + "."
                ukPintTextField()
            case "textFieldFluidOunce":
                textFieldFluidOunce.text = textFieldFluidOunce.text! + "."
                fluidOunceTextField()
            case "textFieldMillilitre":
                textFieldMillilitre.text = textFieldMillilitre.text! + "."
                millilitreTextField()
            default:
                break
            }
            
        default:
            break
        }
        
        
    }
    
    }
