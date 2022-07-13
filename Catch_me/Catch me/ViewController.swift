//
//  ViewController.swift
//  Catch me
//
//  Created by Kirill on 23/05/2022.
//  Copyright © 2022 Kirill Dubrovskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Menu: UIButton!
    @IBOutlet weak var CurrentResult: UILabel!
    @IBOutlet weak var AnimatorAnimate: UILabel!
    @IBOutlet weak var StartTheGame: UIButton!
    @IBOutlet weak var TheGameHasBegun: UILabel!
    @IBOutlet weak var ChoseLevel: UIButton!
    @IBOutlet weak var DifficultyLevel: UILabel!
    @IBOutlet weak var RedSquare: UIView!
    
    let game = Game()
    
    var AnimatorForEasyLevel: UIViewPropertyAnimator!
    
    var IntermediateLevelAnimator: UIViewPropertyAnimator!
    
    var HardLevelAnimator: UIViewPropertyAnimator!

    var СurrentRecord:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CurrentResult.alpha = 0.0
        AnimatorAnimate.alpha = 0.0
        TheGameHasBegun.alpha = 0.0
        RedSquare.alpha = 0.0
        
        let SelectedLevel = UserDefaults.standard.integer(forKey:"SelectedLevel")
        switch SelectedLevel {
        case 0:
            UserDefaults.standard.setValue(1, forKey: "SelectedLevel")
            DifficultyLevel.text = "Уровень легкий"
        case 1:
            DifficultyLevel.text = "Уровень легкий"
        case 2:
            DifficultyLevel.text = "Уровень средний"
        case 3:
            DifficultyLevel.text = "Уровень сложный"
        default:
            print("Error")
        }
        
        AnimatorForEasyLevel = UIViewPropertyAnimator(duration: 1.5, curve: .easeInOut)
        IntermediateLevelAnimator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut)
        HardLevelAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ClickOnce))
        RedSquare.addGestureRecognizer(tapGesture)
        
    }
    
    @objc
    func ClickOnce(){

        game.CurrentGame()
        
        RedSquare.layer.backgroundColor = UIColor.green.cgColor
        UIView.animateKeyframes(withDuration: 0.1, delay: 0.1, options: .calculationModeLinear , animations: {
            self.RedSquare.alpha = 0.0
        }, completion: nil)
        
        CurrentResult.text = String(game.CurrentResultValue)
    
    }
    
    private var timer:Timer?
    
    private var timerForGame:Int = 0{
        didSet{
            if game.GameTime == timerForGame{
                Switch()
            }
            if timerForGame>(game.GameTime + 5){
                timer?.invalidate()
                
                TheGameHasBegun.alpha = 0.0
                CurrentResult.alpha = 0.0
                StartTheGame.alpha = 1.0
                ChoseLevel.alpha = 1.0
                DifficultyLevel.alpha = 1.0
                Menu.alpha = 1.0
                
                let CurrentLevel = UserDefaults.standard.integer(forKey: "SelectedLevel")
                СurrentRecord = UserDefaults.standard.integer(forKey: "Level\(CurrentLevel)Record")
                
                if game.CurrentResultValue > СurrentRecord {
                    showAlert()
                    UserDefaults.standard.setValue(game.CurrentResultValue, forKeyPath: "Level\(CurrentLevel)Record")
                }
                
                timerForGame = 0
                CurrentResult.text = String(game.CurrentResultValue)
                
                game.GameOver()
                
            }
        }
    }
    
    @IBAction func startGame(_ sender: Any) {
        
        Menu.alpha = 0.0
        DifficultyLevel.alpha = 0.0
        ChoseLevel.alpha = 0.0
        StartTheGame.alpha = 0.0
        TheGameHasBegun.alpha = 1.0
        CurrentResult.alpha = 1.0
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self](_) in
            self?.timerForGame += 1
            
        })
    }

    @IBAction func SelectLevel(_ sender: Any) {
        
        showAlertActionSheet()
        
    }
    
    func Switch(){
        
        let LevelGame = UserDefaults.standard.integer(forKey: "SelectedLevel")
        
        switch LevelGame{
        case 1:
            AnimationForAnEasyLevel()
        case 2:
            AnimationForTheMiddleLevel()
        case 3:
            AnimationForDifficultLevel()
        default:
            print("Error")
        }
        
    }
    
    func AnimationForAnEasyLevel(){
        
        RedSquare.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        RedSquare.layer.backgroundColor = UIColor.red.cgColor
        
        RedSquare.frame.origin.x = CGFloat(Int.random(in: 0 ..< (Int(view.frame.width) - Int(RedSquare.frame.width))))
        RedSquare.frame.origin.y = CGFloat(Int.random(in: (0 + 103)  ..< ((Int(view.frame.height) - 78) - Int(RedSquare.frame.height))))
        
        RedSquare.alpha = 1.0
        AnimatorForEasyLevel.startAnimation()
        
        AnimatorForEasyLevel.addAnimations {
            
            UIView.animateKeyframes(withDuration: 1.5, delay: 0.0, options: .calculationModeLinear, animations: {
                
                self.AnimatorAnimate.frame.origin.x += 1
                
            }, completion: { (_) in
                
                self.RedSquare.alpha = 0.0
                
            })
        }
    }
    
    func AnimationForTheMiddleLevel(){
        
        RedSquare.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        RedSquare.layer.backgroundColor = UIColor.red.cgColor
        RedSquare.frame.origin.x = CGFloat(Int.random(in: 0 ..< (Int(view.frame.width) - Int(RedSquare.frame.width))))
        RedSquare.frame.origin.y = CGFloat(Int.random(in: (0 + 103)  ..< ((Int(view.frame.height) - 78) - Int(RedSquare.frame.height))))
        
        RedSquare.alpha = 1.0
        IntermediateLevelAnimator.startAnimation()
        
        IntermediateLevelAnimator.addAnimations {
            
            UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, options: .calculationModeLinear, animations: {
                
                self.AnimatorAnimate.frame.origin.x += 1
                
            }, completion: { (_) in
                
                self.RedSquare.alpha = 0.0
                
            })
        }
    }
    
    func AnimationForDifficultLevel(){
        
        RedSquare.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        RedSquare.layer.backgroundColor = UIColor.red.cgColor
        RedSquare.frame.origin.x = CGFloat(Int.random(in: 0 ..< (Int(view.frame.width) - Int(RedSquare.frame.width))))
        RedSquare.frame.origin.y = CGFloat(Int.random(in: (0 + 103)  ..< ((Int(view.frame.height) - 78) - Int(RedSquare.frame.height))))

        RedSquare.alpha = 1.0
        HardLevelAnimator.startAnimation()
        
        HardLevelAnimator.addAnimations {
            
            UIView.animateKeyframes(withDuration: 0.5, delay: 0.0, options: .calculationModeLinear, animations: {
                
                self.AnimatorAnimate.frame.origin.x += 1
                
            }, completion: { (_) in
                
                self.RedSquare.alpha = 0.0
                
            })
        }
    }
    
    private func showAlert(){
        
        game.Record()
        
        let alert = UIAlertController(title: "Поздравляем!!!", message: "Вы установили новый рекорд на \(game.TextForTheCurrentLevel)!", preferredStyle: .alert)
        
        let OkAction = UIAlertAction(title: "Ок", style: .default, handler: nil)
        
        alert.addAction(OkAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    private func showAlertActionSheet(){
        
        let alert = UIAlertController(title: "Выберите уровень сложности:", message: nil, preferredStyle: .actionSheet)
        
        let DifficultyLevel1 = UIAlertAction(title: "Легкий", style: .default) { [weak self] (_) in
            
            self?.DifficultyLevel.text = "Уровень легкий"
            let level1 = 1
            UserDefaults.standard.setValue(level1, forKey: "SelectedLevel")
            
        }
        let DifficultyLevel2 = UIAlertAction(title: "Средний", style: .default) { [weak self] (_) in
            
            self?.DifficultyLevel.text = "Уровень средний"
            let level2 = 2
            UserDefaults.standard.setValue(level2, forKey: "SelectedLevel")
            
        }
        let DifficultyLevel3 = UIAlertAction(title: "Сложный", style: .default) { [weak self] (_) in
            
            self?.DifficultyLevel.text = "Уровень сложный"
            let level3 = 3
            UserDefaults.standard.setValue(level3, forKey: "SelectedLevel")
            
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alert.addAction(DifficultyLevel1)
        alert.addAction(DifficultyLevel2)
        alert.addAction(DifficultyLevel3)
        alert.addAction(cancelAction)
        
        if let popover = alert.popoverPresentationController{
            popover.sourceView = self.view
            popover.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popover.permittedArrowDirections = UIPopoverArrowDirection.init(rawValue: 0)
        }
        
        present(alert, animated: true, completion: nil)
        
    }
    
}
