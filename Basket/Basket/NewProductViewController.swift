//
//  NewProductViewController.swift
//  Basket
//
//  Created by Kirill on 01/06/2022.
//  Copyright © 2022 Kirill Dubrovskiy. All rights reserved.
//

import UIKit

class NewProductViewController: UIViewController {
    
    @IBOutlet weak var Cancel: UITextView!
    @IBOutlet weak var CancelAnimate: UILabel!
    @IBOutlet weak var Save: UIBarButtonItem!
    @IBOutlet weak var TitleField: UITextField!
    @IBOutlet weak var TitleHelp: UILabel!
    @IBOutlet weak var PriceField: UITextField!
    @IBOutlet weak var PriceHelp: UITextView!
    
    var СheckingForHelp = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Cancel.alpha = 0.0
        Save.isEnabled = false
        
        TitleField.layer.cornerRadius = 8
        TitleField.layer.borderWidth = 0.5
        TitleHelp.alpha = 0.0
        PriceField.layer.cornerRadius = 8
        PriceField.layer.borderWidth = 0.5
        
        TitleField.addTarget(self, action: #selector(ChangesInTextFields), for: .editingChanged)
        PriceField.addTarget(self, action: #selector(ChangesInTextFields), for: .editingChanged)
        
    }
    
    @objc
    func ChangesInTextFields(){
        
        if СheckingForHelp == 1{
            Help()
        }
        
        let Title = TitleField.text
        let Price = Int(PriceField.text ?? "0")
        
        if (Title != "") && (Price != nil) && (Price! > 0){
            Save.isEnabled = true
        }else{
            Save.isEnabled = false
        }
        
    }
    
    
    @IBAction func CancelClick(_ sender: Any) {
        
        Cancel.alpha = 1.0
        
        UIView.animate(withDuration: 5.0) {
            
            self.CancelAnimate.frame.origin.x += 1
            
        } completion: { (_) in
            
            UIView.animate(withDuration: 5.0) {
                
                self.Cancel.alpha = 0.0
                
            }
            
        }
        
    }
    
    
    @IBAction func HelpButton(_ sender: Any) {
    
        СheckingForHelp = 1
        Help()
        
    }
    
    func Help(){
        
        let CurrentTitle = TitleField.text
        let CurrentPrice = Int(PriceField.text ?? "0")
        let СurrentTextPrice = PriceField.text
        
        if CurrentTitle == ""{
            
            TitleField.layer.borderColor = UIColor.red.cgColor
            TitleHelp.alpha = 1.0
        }else{
            
            TitleField.layer.borderColor = UIColor.black.cgColor
            TitleHelp.alpha = 0.0
            
        }
        
        if (СurrentTextPrice == ""){
            
            PriceField.layer.borderColor = UIColor.red.cgColor
            PriceHelp.text = "Заполните это поле"
            PriceHelp.alpha = 1.0
            
        }else if ((CurrentPrice == nil) && (СurrentTextPrice != "")) || ((CurrentPrice != nil) && (CurrentPrice! <= 0)){
            
            PriceField.layer.borderColor = UIColor.red.cgColor
            PriceHelp.text = "Для цены используйте только положительные числа"
            PriceHelp.alpha = 1.0
            
        }else{
            
            PriceField.layer.borderColor = UIColor.black.cgColor
            PriceHelp.alpha = 0.0
            
        }
        
    }
    
}

