//
//  Lessons.swift
//  Network
//
//  Created by Дубровский Кирилл on 18.06.2022.
//

import Foundation

struct Coin: Decodable {
    
    let name:String
    let logo_url:String
    let price:String
    let OneHour:Hour
    let OneDay:Day
    let OneMonth:Month
    
    enum CodingKeys:String,CodingKey {
        case logo_url,price,name
        case OneHour = "1h"
        case OneDay = "1d"
        case OneMonth = "30d"
    
    }
}

struct Hour: Decodable {
    let price_change:String
}

struct Day:Decodable {
    let price_change:String
}

struct Month:Decodable{
    let price_change:String
}




