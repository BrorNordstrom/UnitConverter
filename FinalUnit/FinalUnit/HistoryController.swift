//
//  HistoryController.swift
//  FinalUnit
//
//  Created by Bror Andreas Nordstrom on 14/03/2019.
//  Copyright © 2019 Bror Andreas Nordstrom. All rights reserved.
//

import UIKit

class HistoryController: UIViewController {
    
    
    @IBOutlet weak var textView: UITextView!
    
    var arrayList: [[String:String]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createHistoryView()
    }
    
    func createHistoryView() {
        
    print(arrayList)
        var jsonString = ""
        for data in arrayList {
            
            let keys = Array(data.keys)
             print(keys)
            
            let values = Array(data.values)
            print(values)
            
            for i in 0..<keys.count {
                jsonString = jsonString + keys[i] + " : "
                jsonString = jsonString + values[i] + "\n "
                
            }
            
            jsonString = jsonString + "************************************" + "\n"
            
       
            
        }
             self.textView.text = jsonString
    }
    
     //back button
    
    @IBAction func buttonBack(_ sender: UIButton) {
    
    
    self.navigationController?.popViewController(animated: true)
        
    }
    
    
}
