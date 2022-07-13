//
//  Basket.swift
//  Basket
//
//  Created by Дубровский Кирилл on 08.07.2022.
//  Copyright © 2022 Kirill Dubrovskiy. All rights reserved.
//

import Foundation

class Basket{
    
    var Basket:[String] = []
    
    var NumberOfProducts:Int = 0
    
    var Summa:Int = 0

    func InitialValuesOfProducts(){

        for i in 0...35{

            if (i <= 17){
                Basket.append("A")
            }else{
                Basket.append("0")
            }
        }
    }
    
    func AddingNewProduct(title:String,price:String){

        NumberOfProducts += 1
        
        Basket[(NumberOfProducts-1)] = title
        Basket[(NumberOfProducts-1)+18] = price
        
    }
    
    func DeleteAllProducts(){

        for j in 0...35{

            if (j <= 17){
                Basket[j] = "A"
            }else{
                Basket[j] = "0"
            }
        }
        
        NumberOfProducts = 0
    }

    func RemoveProduct(Delete:Int){
        
        for j in Delete...(NumberOfProducts-1){
            if j == 17{
                Basket[j] = "A"
                Basket[j+18] = "0"
                break
            }
            Basket[j] = Basket[j+1]
            Basket[j+18] = Basket[j+19]
        }

        NumberOfProducts -= 1

    }
    
    func TotalPriceCalculation(){
        
        Summa = 0
        
        for i in 18...35{
            Summa += Int(Basket[i])!
        }
        
    }
    
}
