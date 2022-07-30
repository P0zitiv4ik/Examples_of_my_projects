//
//  ViewController.swift
//  Password generator
//
//  Created by Дубровский Кирилл on 25.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var LowerCase: UISwitch!
    @IBOutlet weak var UppearCase: UISwitch!
    @IBOutlet weak var Numbers: UISwitch!
    @IBOutlet weak var SpecialSymbols: UISwitch!
    @IBOutlet weak var Length: UILabel!
    @IBOutlet weak var Password: UILabel!
    @IBOutlet weak var ViewPassword: UIView!
    @IBOutlet weak var Share: UIButton!
    
    var StringOfNewElements:String = ""
    
    var password = PasswordGeneration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewPassword.layer.cornerRadius = 15
        LowerCase.layer.cornerRadius = 16
        LowerCase.layer.borderWidth = 1
        LowerCase.layer.borderColor = UIColor.orange.cgColor
        UppearCase.layer.cornerRadius = 16
        UppearCase.layer.borderWidth = 1
        UppearCase.layer.borderColor = UIColor.orange.cgColor
        Numbers.layer.cornerRadius = 16
        Numbers.layer.borderWidth = 1
        Numbers.layer.borderColor = UIColor.orange.cgColor
        SpecialSymbols.layer.cornerRadius = 16
        SpecialSymbols.layer.borderWidth = 1
        SpecialSymbols.layer.borderColor = UIColor.orange.cgColor
        
    }
    
    @IBAction func ChangingLength(_ sender: UISlider) {
        
        Length.text = String(Int(sender.value))
        
    }
    
    @IBAction func GenerateButton(_ sender: Any) {
        StringOfNewElements = ""
        
        NumberOfCharacters()
        
        Password.text = StringOfNewElements
        
    }
    
    
    @IBAction func CopyButton(_ sender: Any) {
        
        UIPasteboard.general.string = Password.text

        let c = Password.text
        
        Password.text = "copied"
        
        UIView.animate(withDuration: 2.0, animations: {
            
            self.Label.frame.origin.x += 1
        
        }) { (_) in
            
            self.Password.text = c
            
        }
        
    }
    
    @IBAction func ShareButton(_ sender: Any) {
        
        let SharePassword:[String] = [StringOfNewElements]
        
        let avc = UIActivityViewController(activityItems: SharePassword, applicationActivities: nil)
        
        if let popover = avc.popoverPresentationController{
            
            popover.sourceView = Share
            
        }
        
        present(avc, animated: true, completion: nil)
        
    }
    
    func NumberOfCharacters (){

        let Length = Int(Length.text!)

        for _ in 1...Length!{

            AddingRandomCharacter()

        }

    }

    func AddingRandomCharacter(){

        var arrayRandom = [String]()

        if LowerCase.isOn {
            arrayRandom.append("Lowercase")
        }

        if UppearCase.isOn {

            arrayRandom.append("Uppearcase")
        }

        if Numbers.isOn {
            arrayRandom.append("Numbers")
        }

        if SpecialSymbols.isOn {
            arrayRandom.append("SpecialSymbols")
        }

        let Symbol = arrayRandom.randomElement()

        var newElement:String = ""

        switch Symbol{
        case "Lowercase":
            newElement = password.RandomLowerCase()
        case "Uppearcase":
            newElement = password.RandomUppearCase()
        case "Numbers":
            newElement = password.RandomNumbers()
        case "SpecialSymbols":
            newElement = password.RandomSpecialSymbols()
        default:
            print("error")
        }

        arrayRandom = []

        StringOfNewElements += newElement

    }

}



