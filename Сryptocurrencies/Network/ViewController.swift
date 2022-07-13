//
//  ViewController.swift
//  Network
//
//  Created by Дубровский Кирилл on 16.06.2022.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var ImageBUSD: UIImageView!
    @IBOutlet weak var CoinBUSD: UILabel!
    @IBOutlet weak var PriceBUSD: UILabel!
    @IBOutlet weak var MoreBUSD: UIButton!
    @IBOutlet weak var TitleBUSD: UILabel!
    @IBOutlet weak var PriceChangeBUSD: UILabel!
    @IBOutlet weak var HourBUSD: UILabel!
    @IBOutlet weak var DayBUSD: UILabel!
    @IBOutlet weak var MonthBUSD: UILabel!
    @IBOutlet weak var NameBUSD: UILabel!
    @IBOutlet weak var HourValueBUSD: UILabel!
    @IBOutlet weak var DayValueBUSD: UILabel!
    @IBOutlet weak var MonthValueBUSD: UILabel!

    @IBOutlet weak var ImageSOL: UIImageView!
    @IBOutlet weak var CoinSOL: UILabel!
    @IBOutlet weak var PriceSOL: UILabel!
    @IBOutlet weak var MoreSOL: UIButton!
    @IBOutlet weak var TitleSOL: UILabel!
    @IBOutlet weak var PriceChangeSOL: UILabel!
    @IBOutlet weak var HourSOL: UILabel!
    @IBOutlet weak var DaySOL: UILabel!
    @IBOutlet weak var MonthSOL: UILabel!
    @IBOutlet weak var NameSOL: UILabel!
    @IBOutlet weak var HourValueSOL: UILabel!
    @IBOutlet weak var DayValueSOL: UILabel!
    @IBOutlet weak var MonthValueSOL: UILabel!

    @IBOutlet weak var ImageSHIB: UIImageView!
    @IBOutlet weak var CoinSHIB: UILabel!
    @IBOutlet weak var PriceSHIB: UILabel!
    @IBOutlet weak var MoreSHIB: UIButton!
    @IBOutlet weak var TitleSHIB: UILabel!
    @IBOutlet weak var PriceChangeSHIB: UILabel!
    @IBOutlet weak var HourSHIB: UILabel!
    @IBOutlet weak var DaySHIB: UILabel!
    @IBOutlet weak var MonthSHIB: UILabel!
    @IBOutlet weak var NameSHIB: UILabel!
    @IBOutlet weak var HourValueSHIB: UILabel!
    @IBOutlet weak var DayValueSHIB: UILabel!
    @IBOutlet weak var MonthValueSHIB: UILabel!

    @IBOutlet weak var ImageHEX: UIImageView!
    @IBOutlet weak var CoinHEX: UILabel!
    @IBOutlet weak var PriceHEX: UILabel!
    @IBOutlet weak var MoreHEX: UIButton!
    @IBOutlet weak var TitleHEX: UILabel!
    @IBOutlet weak var PriceChangeHEX: UILabel!
    @IBOutlet weak var HourHEX: UILabel!
    @IBOutlet weak var DayHEX: UILabel!
    @IBOutlet weak var MonthHEX: UILabel!
    @IBOutlet weak var NameHEX: UILabel!
    @IBOutlet weak var HourValueHEX: UILabel!
    @IBOutlet weak var DayValueHEX: UILabel!
    @IBOutlet weak var MonthValueHEX: UILabel!

    @IBOutlet weak var ImageLEO: UIImageView!
    @IBOutlet weak var CoinLEO: UILabel!
    @IBOutlet weak var PriceLEO: UILabel!
    @IBOutlet weak var MoreLEO: UIButton!
    @IBOutlet weak var TitleLEO: UILabel!
    @IBOutlet weak var PriceChangeLEO: UILabel!
    @IBOutlet weak var HourLEO: UILabel!
    @IBOutlet weak var DayLEO: UILabel!
    @IBOutlet weak var MonthLEO: UILabel!
    @IBOutlet weak var NameLEO: UILabel!
    @IBOutlet weak var HourValueLEO: UILabel!
    @IBOutlet weak var DayValueLEO: UILabel!
    @IBOutlet weak var MonthValueLEO: UILabel!
    
    @IBOutlet weak var ImageBackground: UIImageView!
    @IBOutlet weak var MoreAnimateLEO: UILabel!
    
    let network = Network()
    
    let NewCoinBUSD = "BUSD"
    let NewCoinSOL = "SOL"
    let NewCoinSHIB = "SHIB"
    let NewCoinHEX = "LEO"
    let NewCoinLEO = "HEX"
    let Convert = "USDT"
    
    var FactorBUSD = 1
    var FactorSOL = 1
    var FactorSHIB = 1
    var FactorHEX = 1
    var FactorLEO = 1
    
    private var timer:Timer?
    private var RequestTimeout:Int = 0{
        didSet{
            
            if RequestTimeout == 30{
            RequestResponse()
                RequestTimeout = 0
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageBackground.image = UIImage(data: try! Data(contentsOf: URL(string: "https://www.coinside.ru/wp-content/uploads/2021/02/binance-logo-og.png")!))
        ImageBackground.alpha = 0.2

        TitleBUSD.alpha = 0.0
        PriceChangeBUSD.alpha = 0.0
        HourBUSD.alpha = 0.0
        DayBUSD.alpha = 0.0
        MonthBUSD.alpha = 0.0
        NameBUSD.alpha = 0.0
        HourValueBUSD.alpha = 0.0
        DayValueBUSD.alpha = 0.0
        MonthValueBUSD.alpha = 0.0
        
        TitleSOL.alpha = 0.0
        PriceChangeSOL.alpha = 0.0
        HourSOL.alpha = 0.0
        DaySOL.alpha = 0.0
        MonthSOL.alpha = 0.0
        NameSOL.alpha = 0.0
        HourValueSOL.alpha = 0.0
        DayValueSOL.alpha = 0.0
        MonthValueSOL.alpha = 0.0

        TitleSHIB.alpha = 0.0
        PriceChangeSHIB.alpha = 0.0
        HourSHIB.alpha = 0.0
        DaySHIB.alpha = 0.0
        MonthSHIB.alpha = 0.0
        NameSHIB.alpha = 0.0
        HourValueSHIB.alpha = 0.0
        DayValueSHIB.alpha = 0.0
        MonthValueSHIB.alpha = 0.0
        
        TitleHEX.alpha = 0.0
        PriceChangeHEX.alpha = 0.0
        HourHEX.alpha = 0.0
        DayHEX.alpha = 0.0
        MonthHEX.alpha = 0.0
        NameHEX.alpha = 0.0
        HourValueHEX.alpha = 0.0
        DayValueHEX.alpha = 0.0
        MonthValueHEX.alpha = 0.0

        TitleLEO.alpha = 0.0
        PriceChangeLEO.alpha = 0.0
        HourLEO.alpha = 0.0
        DayLEO.alpha = 0.0
        MonthLEO.alpha = 0.0
        NameLEO.alpha = 0.0
        HourValueLEO.alpha = 0.0
        DayValueLEO.alpha = 0.0
        MonthValueLEO.alpha = 0.0
        
        CoinBUSD.text = NewCoinBUSD + "/" + Convert
        CoinSOL.text = NewCoinSOL + "/" + Convert
        CoinSHIB.text = NewCoinSHIB + "/" + Convert
        CoinHEX.text = NewCoinHEX + "/" + Convert
        CoinLEO.text = NewCoinLEO + "/" + Convert
        PriceBUSD.textColor = .green
        PriceSOL.textColor = .green
        PriceSHIB.textColor = .green
        PriceHEX.textColor = .green
        PriceLEO.textColor = .green
        
        RequestResponse()
        Timer()
    
    }

    @IBAction func ButtonDetailsBUSD(_ sender: Any) {
    
        if FactorBUSD == 1{
                        
            UIView.animate(withDuration: 0.5,animations: {
            
            self.ImageSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.CoinSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.PriceSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.MoreSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.TitleSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.PriceChangeSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.HourSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.DaySOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.MonthSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.NameSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.HourValueSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.DayValueSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.MonthValueSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)

            self.ImageSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.CoinSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.PriceSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.MoreSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.TitleSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.PriceChangeSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.HourSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.DaySHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.MonthSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.NameSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.HourValueSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.DayValueSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.MonthValueSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            
            self.ImageHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.CoinHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.PriceHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.MoreHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.TitleHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.PriceChangeHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.HourHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.DayHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.MonthHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.NameHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.HourValueHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.DayValueHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.MonthValueHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                
            self.ImageLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.CoinLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.PriceLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.MoreLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.TitleLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.PriceChangeLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.HourLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.DayLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.MonthLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.NameLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.HourValueLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.DayValueLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
            self.MonthValueLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                
        }) {_ in

            self.TitleBUSD.alpha = 1.0
            self.PriceChangeBUSD.alpha = 1.0
            self.HourBUSD.alpha = 1.0
            self.DayBUSD.alpha = 1.0
            self.MonthBUSD.alpha = 1.0
            self.NameBUSD.alpha = 1.0
            self.HourValueBUSD.alpha = 1.0
            self.DayValueBUSD.alpha = 1.0
            self.MonthValueBUSD.alpha = 1.0
            
            self.MoreBUSD.titleLabel?.text = "Свернуть"
        }
            
            FactorBUSD = FactorBUSD * (-1)

        }else {
            
            self.NameBUSD.alpha = 0.0
            self.HourValueBUSD.alpha = 0.0
            self.DayValueBUSD.alpha = 0.0
            self.MonthValueBUSD.alpha = 0.0
            self.TitleBUSD.alpha = 0.0
            self.PriceChangeBUSD.alpha = 0.0
            self.HourBUSD.alpha = 0.0
            self.DayBUSD.alpha = 0.0
            self.MonthBUSD.alpha = 0.0
                
            UIView.animate(withDuration: 0.5){
                
                self.ImageSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.CoinSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.PriceSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.MoreSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.TitleSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.PriceChangeSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.HourSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.DaySOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.MonthSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.NameSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.HourValueSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.DayValueSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.MonthValueSOL.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)

                self.ImageSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.CoinSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.PriceSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.MoreSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.TitleSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.PriceChangeSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.HourSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.DaySHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.MonthSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.NameSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.HourValueSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.DayValueSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.MonthValueSHIB.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                
                self.ImageHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.CoinHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.PriceHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.MoreHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.TitleHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.PriceChangeHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.HourHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.DayHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.MonthHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.NameHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.HourValueHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.DayValueHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.MonthValueHEX.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                    
                self.ImageLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.CoinLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.PriceLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.MoreLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.TitleLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.PriceChangeLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.HourLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.DayLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.MonthLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.NameLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.HourValueLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.DayValueLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                self.MonthValueLEO.frame.origin.y += (CGFloat(self.FactorBUSD) * 75)
                
            }
            
            FactorBUSD = FactorBUSD * (-1)
    }
}
    
    @IBAction func ButtonDetailsSOL(_ sender: Any) {
        
        if FactorSOL == 1{
            
        UIView.animate(withDuration: 0.5,animations: {

            self.ImageSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.CoinSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.PriceSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.MoreSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.TitleSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.PriceChangeSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.HourSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.DaySHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.MonthSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.NameSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.HourValueSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.DayValueSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.MonthValueSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            
            self.ImageHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.CoinHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.PriceHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.MoreHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.TitleHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.PriceChangeHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.HourHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.DayHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.MonthHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.NameHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.HourValueHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.DayValueHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.MonthValueHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                
            self.ImageLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.CoinLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.PriceLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.MoreLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.TitleLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.PriceChangeLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.HourLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.DayLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.MonthLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.NameLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.HourValueLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.DayValueLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            self.MonthValueLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
            
        }) {_ in
            
            self.TitleSOL.alpha = 1.0
            self.PriceChangeSOL.alpha = 1.0
            self.HourSOL.alpha = 1.0
            self.DaySOL.alpha = 1.0
            self.MonthSOL.alpha = 1.0
            self.NameSOL.alpha = 1.0
            self.HourValueSOL.alpha = 1.0
            self.DayValueSOL.alpha = 1.0
            self.MonthValueSOL.alpha = 1.0
            
            self.MoreSOL.titleLabel?.text = "Свернуть"
            
        }
        
        FactorSOL = FactorSOL * (-1)

        }else {
            
                self.NameSOL.alpha = 0.0
                self.HourValueSOL.alpha = 0.0
                self.DayValueSOL.alpha = 0.0
                self.MonthValueSOL.alpha = 0.0
                self.TitleSOL.alpha = 0.0
                self.PriceChangeSOL.alpha = 0.0
                self.HourSOL.alpha = 0.0
                self.DaySOL.alpha = 0.0
                self.MonthSOL.alpha = 0.0
                
            UIView.animate(withDuration: 0.5) {
                
                self.ImageSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.CoinSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.PriceSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.MoreSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.TitleSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.PriceChangeSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.HourSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.DaySHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.MonthSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.NameSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.HourValueSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.DayValueSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.MonthValueSHIB.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                
                self.ImageHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.CoinHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.PriceHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.MoreHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.TitleHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.PriceChangeHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.HourHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.DayHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.MonthHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.NameHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.HourValueHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.DayValueHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.MonthValueHEX.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                    
                self.ImageLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.CoinLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.PriceLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.MoreLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.TitleLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.PriceChangeLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.HourLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.DayLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.MonthLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.NameLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.HourValueLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.DayValueLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                self.MonthValueLEO.frame.origin.y += (CGFloat(self.FactorSOL) * 75)
                
            }
            
            FactorSOL = FactorSOL * (-1)
    }
}

    
    @IBAction func ButtonDetailsSHIB(_ sender: Any) {
        
        if FactorSHIB == 1{
            
        UIView.animate(withDuration: 0.5,animations: {

            self.ImageHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.CoinHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.PriceHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.MoreHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.TitleHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.PriceChangeHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.HourHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.DayHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.MonthHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.NameHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.HourValueHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.DayValueHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.MonthValueHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                
            self.ImageLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.CoinLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.PriceLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.MoreLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.TitleLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.PriceChangeLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.HourLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.DayLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.MonthLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.NameLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.HourValueLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.DayValueLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            self.MonthValueLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
            
        }) {_ in
            
            self.TitleSHIB.alpha = 1.0
            self.PriceChangeSHIB.alpha = 1.0
            self.HourSHIB.alpha = 1.0
            self.DaySHIB.alpha = 1.0
            self.MonthSHIB.alpha = 1.0
            self.NameSHIB.alpha = 1.0
            self.HourValueSHIB.alpha = 1.0
            self.DayValueSHIB.alpha = 1.0
            self.MonthValueSHIB.alpha = 1.0
            
            self.MoreSHIB.titleLabel?.text = "Свернуть"
            
        }
        
        FactorSHIB = FactorSHIB * (-1)

        }else {
                
                self.NameSHIB.alpha = 0.0
                self.HourValueSHIB.alpha = 0.0
                self.DayValueSHIB.alpha = 0.0
                self.MonthValueSHIB.alpha = 0.0
                self.TitleSHIB.alpha = 0.0
                self.PriceChangeSHIB.alpha = 0.0
                self.HourSHIB.alpha = 0.0
                self.DaySHIB.alpha = 0.0
                self.MonthSHIB.alpha = 0.0
                
            UIView.animate(withDuration: 0.5) {
                
                self.ImageHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.CoinHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.PriceHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.MoreHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.TitleHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.PriceChangeHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.HourHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.DayHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.MonthHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.NameHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.HourValueHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.DayValueHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.MonthValueHEX.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                    
                self.ImageLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.CoinLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.PriceLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.MoreLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.TitleLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.PriceChangeLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.HourLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.DayLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.MonthLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.NameLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.HourValueLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.DayValueLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                self.MonthValueLEO.frame.origin.y += (CGFloat(self.FactorSHIB) * 75)
                
            }
            
            FactorSHIB = FactorSHIB * (-1)
    }
}
    
    @IBAction func ButtonDetailsHEX(_ sender: Any) {
        
        if FactorHEX == 1{
            
        UIView.animate(withDuration: 0.5,animations: {

            self.ImageLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
            self.CoinLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
            self.PriceLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
            self.MoreLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
            self.TitleLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
            self.PriceChangeLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
            self.HourLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
            self.DayLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
            self.MonthLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
            self.NameLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
            self.HourValueLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
            self.DayValueLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
            self.MonthValueLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
            
        }) {_ in
            
            self.TitleHEX.alpha = 1.0
            self.PriceChangeHEX.alpha = 1.0
            self.HourHEX.alpha = 1.0
            self.DayHEX.alpha = 1.0
            self.MonthHEX.alpha = 1.0
            self.NameHEX.alpha = 1.0
            self.HourValueHEX.alpha = 1.0
            self.DayValueHEX.alpha = 1.0
            self.MonthValueHEX.alpha = 1.0
            
            self.MoreHEX.titleLabel?.text = "Свернуть"
            
        }
        
        FactorHEX = FactorHEX * (-1)

        }else {
                
                self.NameHEX.alpha = 0.0
                self.HourValueHEX.alpha = 0.0
                self.DayValueHEX.alpha = 0.0
                self.MonthValueHEX.alpha = 0.0
                self.TitleHEX.alpha = 0.0
                self.PriceChangeHEX.alpha = 0.0
                self.HourHEX.alpha = 0.0
                self.DayHEX.alpha = 0.0
                self.MonthHEX.alpha = 0.0
                
            UIView.animate(withDuration: 0.5) {
                
                self.ImageLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
                self.CoinLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
                self.PriceLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
                self.MoreLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
                self.TitleLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
                self.PriceChangeLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
                self.HourLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
                self.DayLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
                self.MonthLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
                self.NameLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
                self.HourValueLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
                self.DayValueLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
                self.MonthValueLEO.frame.origin.y += (CGFloat(self.FactorHEX) * 75)
                
            }
            
            FactorHEX = FactorHEX * (-1)
    }
}
    
    @IBAction func ButtonDetailsLEO(_ sender: Any) {
        
        if FactorLEO == 1{
            
            self.TitleLEO.alpha = 1.0
            self.PriceChangeLEO.alpha = 1.0
            self.HourLEO.alpha = 1.0
            self.DayLEO.alpha = 1.0
            self.MonthLEO.alpha = 1.0
            self.NameLEO.alpha = 1.0
            self.HourValueLEO.alpha = 1.0
            self.DayValueLEO.alpha = 1.0
            self.MonthValueLEO.alpha = 1.0
            
            UIView.animate(withDuration: 0.001,animations: {
                
                self.MoreAnimateLEO.frame.origin.x += (CGFloat(self.FactorLEO) * 75)
                
            }) {_ in
                
                self.MoreLEO.titleLabel?.text = "Свернуть"
                
            }
            
            FactorLEO = FactorLEO * (-1)

        }else {
            
                self.NameLEO.alpha = 0.0
                self.HourValueLEO.alpha = 0.0
                self.DayValueLEO.alpha = 0.0
                self.MonthValueLEO.alpha = 0.0
                self.TitleLEO.alpha = 0.0
                self.PriceChangeLEO.alpha = 0.0
                self.HourLEO.alpha = 0.0
                self.DayLEO.alpha = 0.0
                self.MonthLEO.alpha = 0.0
            
                FactorLEO = FactorLEO * (-1)
    }
}
    
    func Timer(){

        timer = Foundation.Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] (_) in
            self?.RequestTimeout += 1
        })
    }
    
    func RequestResponse(){
        
        network.Request()
        
        DispatchQueue.main.async { [self] in
            
            if (network.NewPriceBUSD > network.CurrentPriceBUSD){
                self.PriceBUSD.textColor = .green
            }
            if (network.NewPriceBUSD < network.CurrentPriceBUSD){
                self.PriceBUSD.textColor = .red
            }
            
            if (network.NewPriceSOL > network.CurrentPriceSOL){
                self.PriceSOL.textColor = .green
            }
            if (network.NewPriceSOL < network.CurrentPriceSOL){
                self.PriceSOL.textColor = .red
            }
            
            if (network.NewPriceSHIB > network.CurrentPriceSHIB){
                self.PriceSHIB.textColor = .green
            }
            if (network.NewPriceSHIB < network.CurrentPriceSHIB){
                self.PriceSHIB.textColor = .red
            }
            
            if (network.NewPriceHEX > network.CurrentPriceHEX){
                self.PriceHEX.textColor = .green
            }
            if (network.NewPriceHEX < network.CurrentPriceHEX){
                self.PriceHEX.textColor = .red
            }
            
            if (network.NewPriceLEO > network.CurrentPriceLEO){
                self.PriceLEO.textColor = .green
            }
            if (network.NewPriceLEO < network.CurrentPriceLEO){
                self.PriceLEO.textColor = .red
            }
            
            
            if  network.PriceChangeHourBUSD >= 0{
                self.HourValueBUSD.textColor = .green
            }else {
                self.HourValueBUSD.textColor = .red
            }
            
            if  network.PriceChangeDayBUSD >= 0{
                self.DayValueBUSD.textColor = .green
            }else {
                self.DayValueBUSD.textColor = .red
            }
            
            if  network.PriceChangeMonthBUSD >= 0{
                self.MonthValueBUSD.textColor = .green
            }else {
                self.MonthValueBUSD.textColor = .red
            }
            
            if  network.PriceChangeHourSOL >= 0{
                self.HourValueSOL.textColor = .green
            }else {
                self.HourValueSOL.textColor = .red
            }
            
            if  network.PriceChangeDaySOL >= 0{
                self.DayValueSOL.textColor = .green
            }else {
                self.DayValueSOL.textColor = .red
            }
            
            if  network.PriceChangeMonthSOL >= 0{
                self.MonthValueSOL.textColor = .green
            }else {
                self.MonthValueSOL.textColor = .red
            }
            
            if  network.PriceChangeHourSHIB >= 0{
                self.HourValueSHIB.textColor = .green
            }else {
                self.HourValueSHIB.textColor = .red
            }
            
            if  network.PriceChangeDaySHIB >= 0{
                self.DayValueSHIB.textColor = .green
            }else {
                self.DayValueSHIB.textColor = .red
            }
            
            if  network.PriceChangeMonthSHIB >= 0{
                self.MonthValueSHIB.textColor = .green
            }else {
                self.MonthValueSHIB.textColor = .red
            }
            
            if  network.PriceChangeHourHEX >= 0{
                self.HourValueHEX.textColor = .green
            }else {
                self.HourValueHEX.textColor = .red
            }
            
            if  network.PriceChangeDayHEX >= 0{
                self.DayValueHEX.textColor = .green
            }else {
                self.DayValueHEX.textColor = .red
            }
            
            if  network.PriceChangeMonthHEX >= 0{
                self.MonthValueHEX.textColor = .green
            }else {
                self.MonthValueHEX.textColor = .red
            }
            
            if  network.PriceChangeHourLEO >= 0{
                self.HourValueLEO.textColor = .green
            }else {
                self.HourValueLEO.textColor = .red
            }
            
            if  network.PriceChangeDayLEO >= 0{
                self.DayValueLEO.textColor = .green
            }else {
                self.DayValueLEO.textColor = .red
            }
            
            if  network.PriceChangeMonthLEO >= 0{
                self.MonthValueLEO.textColor = .green
            }else {
                self.MonthValueLEO.textColor = .red
            }
            
        }
        
        DispatchQueue.main.async { [self] in
            
            self.PriceBUSD.text = network.PriceBUSD
            self.NameBUSD.text = network.NameBUSD
            self.HourValueBUSD.text = network.HourValueBUSD
            self.DayValueBUSD.text = network.DayValueBUSD
            self.MonthValueBUSD.text = network.MonthValueBUSD
            
            self.PriceSOL.text = network.PriceSOL
            self.NameSOL.text = network.NameSOL
            self.HourValueSOL.text = network.HourValueSOL
            self.DayValueSOL.text = network.DayValueSOL
            self.MonthValueSOL.text = network.MonthValueSOL
            
            self.PriceSHIB.text = network.PriceSHIB
            self.NameSHIB.text = network.NameSHIB
            self.HourValueSHIB.text = network.HourValueSHIB
            self.DayValueSHIB.text = network.DayValueSHIB
            self.MonthValueSHIB.text = network.MonthValueSHIB
            
            self.PriceHEX.text = network.PriceHEX
            self.NameHEX.text = network.NameHEX
            self.HourValueHEX.text = network.HourValueHEX
            self.DayValueHEX.text = network.DayValueHEX
            self.MonthValueHEX.text = network.MonthValueHEX
            
            self.PriceLEO.text = network.PriceLEO
            self.NameLEO.text = network.NameLEO
            self.HourValueLEO.text = network.HourValueLEO
            self.DayValueLEO.text = network.DayValueLEO
            self.MonthValueLEO.text = network.MonthValueLEO
            
        }
        
    }

}
    

