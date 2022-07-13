//
//  Game.swift
//  Catch me
//
//  Created by Дубровский Кирилл on 09.07.2022.
//  Copyright © 2022 Kirill Dubrovskiy. All rights reserved.
//

import Foundation

class Game{
    
    var GameTime:Int = 3
    
    var CurrentResultValue:Int = 0
    
    var TextForTheCurrentLevel = ""
    
    func CurrentGame(){
        
        GameTime += 5
        CurrentResultValue += 1
        
    }
    
    func GameOver(){
        
        GameTime = 3
        CurrentResultValue = 0
        
    }
    
    func Record(){
        
        let СurrentLevelForNewRecord = UserDefaults.standard.integer(forKey: "SelectedLevel")
        
        TextForTheCurrentLevel = ""
        switch СurrentLevelForNewRecord{
        case 1:
            TextForTheCurrentLevel = "легком уровне"
        case 2:
            TextForTheCurrentLevel = "среднем уровне"
        case 3:
            TextForTheCurrentLevel = "сложном уровне"
        default:
            print("ERROR")
        }
        
    }
    
}
