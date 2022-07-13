//
//  Network.swift
//  Network
//
//  Created by Дубровский Кирилл on 09.07.2022.
//

import Foundation


class Network{
    
    var decoder = JSONDecoder()

    var CurrentPriceBUSD:Float = 0
    var CurrentPriceSOL:Float = 0
    var CurrentPriceSHIB:Float = 0
    var CurrentPriceHEX :Float = 0
    var CurrentPriceLEO:Float = 0

    var NewPriceBUSD:Float = 0
    var NewPriceSOL:Float = 0
    var NewPriceSHIB:Float = 0
    var NewPriceHEX:Float = 0
    var NewPriceLEO:Float = 0

    var PriceChangeHourBUSD:Float = 0
    var PriceChangeDayBUSD:Float = 0
    var PriceChangeMonthBUSD:Float = 0

    var PriceChangeHourSOL:Float = 0
    var PriceChangeDaySOL:Float = 0
    var PriceChangeMonthSOL:Float = 0

    var PriceChangeHourSHIB:Float = 0
    var PriceChangeDaySHIB:Float = 0
    var PriceChangeMonthSHIB:Float = 0

    var PriceChangeHourHEX:Float = 0
    var PriceChangeDayHEX:Float = 0
    var PriceChangeMonthHEX:Float = 0

    var PriceChangeHourLEO:Float = 0
    var PriceChangeDayLEO:Float = 0
    var PriceChangeMonthLEO:Float = 0

    var ImageBUSD:String = ""
    var PriceBUSD:String = ""
    var NameBUSD:String = ""
    var HourValueBUSD:String = ""
    var DayValueBUSD:String = ""
    var MonthValueBUSD:String = ""

    var ImageSOL:String = ""
    var PriceSOL:String = ""
    var NameSOL:String = ""
    var HourValueSOL:String = ""
    var DayValueSOL:String = ""
    var MonthValueSOL:String = ""

    var ImageSHIB:String = ""
    var PriceSHIB:String = ""
    var NameSHIB:String = ""
    var HourValueSHIB:String = ""
    var DayValueSHIB:String = ""
    var MonthValueSHIB:String = ""

    var ImageHEX:String = ""
    var PriceHEX:String = ""
    var NameHEX:String = ""
    var HourValueHEX:String = ""
    var DayValueHEX:String = ""
    var MonthValueHEX:String = ""

    var ImageLEO:String = ""
    var PriceLEO:String = ""
    var NameLEO:String = ""
    var HourValueLEO:String = ""
    var DayValueLEO:String = ""
    var MonthValueLEO:String = ""

    func Request(){
        
        guard let url = URL(string:"https://api.nomics.com/v1/currencies/ticker?key=e8ffbe014c7100861046d09dcf8908477d518e59&ids=BUSD,SOL,HEX,SHIB,LEO&interval=1h,1d,30d&convert=USD&platform-currency=&per-page=100&page=1") else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            
            guard let strongSelf = self else { return }
            
            if error == nil,let parsData = data{
                
                guard let Coins = try? strongSelf.decoder.decode([Coin].self, from: parsData) else { return }
                
                self?.CurrentPriceBUSD = UserDefaults.standard.float(forKey: "CurrentPriceBUSD")
                self?.CurrentPriceSOL = UserDefaults.standard.float(forKey: "CurrentPriceSOL")
                self?.CurrentPriceSHIB = UserDefaults.standard.float(forKey: "CurrentPriceSHIB")
                self?.CurrentPriceHEX = UserDefaults.standard.float(forKey: "CurrentPriceHEX")
                self?.CurrentPriceLEO = UserDefaults.standard.float(forKey: "CurrentPriceLEO")

                self?.NewPriceBUSD = Float(Coins.first!.price)!
                self?.NewPriceSOL = Float(Coins[1].price)!
                self?.NewPriceSHIB = Float(Coins[2].price)!
                self?.NewPriceHEX = Float(Coins[3].price)!
                self?.NewPriceLEO = Float(Coins.last!.price)!

                self?.PriceChangeHourBUSD = Float(Coins.first!.OneHour.price_change)!
                self?.PriceChangeDayBUSD = Float(Coins.first!.OneDay.price_change)!
                self?.PriceChangeMonthBUSD = Float(Coins.first!.OneMonth.price_change)!

                self?.PriceChangeHourSOL = Float(Coins[1].OneHour.price_change)!
                self?.PriceChangeDaySOL = Float(Coins[1].OneDay.price_change)!
                self?.PriceChangeMonthSOL = Float(Coins[1].OneMonth.price_change)!

                self?.PriceChangeHourSHIB = Float(Coins[2].OneHour.price_change)!
                self?.PriceChangeDaySHIB = Float(Coins[2].OneDay.price_change)!
                self?.PriceChangeMonthSHIB = Float(Coins[2].OneMonth.price_change)!

                self?.PriceChangeHourHEX = Float(Coins[3].OneHour.price_change)!
                self?.PriceChangeDayHEX = Float(Coins[3].OneDay.price_change)!
                self?.PriceChangeMonthHEX = Float(Coins[3].OneMonth.price_change)!

                self?.PriceChangeHourLEO = Float(Coins.last!.OneHour.price_change)!
                self?.PriceChangeDayLEO = Float(Coins.last!.OneDay.price_change)!
                self?.PriceChangeMonthLEO = Float(Coins.last!.OneMonth.price_change)!

                let currentPriceBUSD = Coins.first?.price
                UserDefaults.standard.setValue(currentPriceBUSD, forKey: "CurrentPriceBUSD")
                let currentPriceSOL = Coins[1].price
                UserDefaults.standard.setValue(currentPriceSOL, forKey: "CurrentPriceSOL")
                let currentPriceSHIB = Coins[2].price
                UserDefaults.standard.setValue(currentPriceSHIB, forKey: "CurrentPriceSHIB")
                let currentPriceHEX = Coins[3].price
                UserDefaults.standard.setValue(currentPriceHEX, forKey: "CurrentPriceHEX")
                let currentPriceLEO = Coins.last?.price
                UserDefaults.standard.setValue(currentPriceLEO, forKey: "CurrentPriceLEO")
                
                DispatchQueue.main.async { [self] in

                    self?.PriceBUSD = Coins.first!.price
                    self?.NameBUSD = Coins.first!.name
                    self?.HourValueBUSD = (Coins.first?.OneHour.price_change)!
                    self?.DayValueBUSD = (Coins.first?.OneDay.price_change)!
                    self?.MonthValueBUSD = (Coins.first?.OneMonth.price_change)!

                    self?.PriceSOL = Coins[1].price
                    self?.NameSOL = Coins[1].name
                    self?.HourValueSOL = Coins[1].OneHour.price_change
                    self?.DayValueSOL = Coins[1].OneDay.price_change
                    self?.MonthValueSOL = Coins[1].OneMonth.price_change

                    self?.PriceSHIB = Coins[2].price
                    self?.NameSHIB = Coins[2].name
                    self?.HourValueSHIB = Coins[2].OneHour.price_change
                    self?.DayValueSHIB = Coins[2].OneDay.price_change
                    self?.MonthValueSHIB = Coins[2].OneMonth.price_change

                    self?.PriceHEX = Coins[3].price
                    self?.NameHEX = Coins[3].name
                    self?.HourValueHEX = Coins[3].OneHour.price_change
                    self?.DayValueHEX = Coins[3].OneDay.price_change
                    self?.MonthValueHEX = Coins[3].OneMonth.price_change

                    self?.PriceLEO = Coins.last!.price
                    self?.NameLEO = Coins.last!.name
                    self?.HourValueLEO = (Coins.last?.OneHour.price_change)!
                    self?.DayValueLEO = (Coins.last?.OneDay.price_change)!
                    self?.MonthValueLEO = (Coins.last?.OneMonth.price_change)!
                    
                }
            }
            
        }.resume()
        
    }
}

