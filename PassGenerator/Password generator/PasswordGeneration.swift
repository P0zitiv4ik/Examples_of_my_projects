//
//  Password.swift
//  Password generator
//
//  Created by Дубровский Кирилл on 25.07.2022.
//

import Foundation

class PasswordGeneration{
    
    func RandomNumbers()->String{
        
        return String(Int.random(in: 0...9))
        
    }
    
    func RandomLowerCase()->String{
        
        let LowerCaseArray = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n","o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
        
        return LowerCaseArray.randomElement()!
        
    }
    
    func RandomUppearCase()->String{
        
        let LowerCaseArray = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N","O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        
        return LowerCaseArray.randomElement()!
        
    }
    
    func RandomSpecialSymbols()->String{
        
        let LowerCaseArray = ["!", " ", "#", "$", "%", "&", "‘", "(", ")", "*", "+", ",", "–", ".", "/", ":", ";", "?", "@", "[", "]", "^", "_", "`"]
        
        return LowerCaseArray.randomElement()!
        
    }
    
}
