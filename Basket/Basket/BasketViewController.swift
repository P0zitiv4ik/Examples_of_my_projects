//
//  BasketViewController.swift
//  Basket
//
//  Created by Дубровский Кирилл on 26.06.2022.
//  Copyright © 2022 Kirill Dubrovskiy. All rights reserved.
//

import UIKit

class BasketViewController: UIViewController {

    @IBOutlet var DeleteButtons: [UIButton]!
    
    @IBOutlet weak var Total: UIBarButtonItem!
    @IBOutlet weak var Add: UIBarButtonItem!
    @IBOutlet weak var Help: UIButton!
    @IBOutlet weak var DeleteEverything: UIButton!
    
    @IBOutlet weak var Title1: UILabel!
    @IBOutlet weak var Price1: UILabel!
    @IBOutlet weak var DeleteButton1: UIButton!
    @IBOutlet weak var DeleteImage1: UIImageView!
    @IBOutlet weak var Title2: UILabel!
    @IBOutlet weak var Price2: UILabel!
    @IBOutlet weak var DeleteButton2: UIButton!
    @IBOutlet weak var DeleteImage2: UIImageView!
    @IBOutlet weak var Title3: UILabel!
    @IBOutlet weak var Price3: UILabel!
    @IBOutlet weak var DeleteButton3: UIButton!
    @IBOutlet weak var DeleteImage3: UIImageView!
    @IBOutlet weak var Title4: UILabel!
    @IBOutlet weak var Price4: UILabel!
    @IBOutlet weak var DeleteButton4: UIButton!
    @IBOutlet weak var DeleteImage4: UIImageView!
    @IBOutlet weak var Title5: UILabel!
    @IBOutlet weak var Price5: UILabel!
    @IBOutlet weak var DeleteButton5: UIButton!
    @IBOutlet weak var DeleteImage5: UIImageView!
    @IBOutlet weak var Title6: UILabel!
    @IBOutlet weak var Price6: UILabel!
    @IBOutlet weak var DeleteButton6: UIButton!
    @IBOutlet weak var DeleteImage6: UIImageView!
    @IBOutlet weak var Title7: UILabel!
    @IBOutlet weak var Price7: UILabel!
    @IBOutlet weak var DeleteButton7: UIButton!
    @IBOutlet weak var DeleteImage7: UIImageView!
    @IBOutlet weak var Title8: UILabel!
    @IBOutlet weak var Price8: UILabel!
    @IBOutlet weak var DeleteButton8: UIButton!
    @IBOutlet weak var DeleteImage8: UIImageView!
    @IBOutlet weak var Title9: UILabel!
    @IBOutlet weak var Price9: UILabel!
    @IBOutlet weak var DeleteButton9: UIButton!
    @IBOutlet weak var DeleteImage9: UIImageView!
    @IBOutlet weak var Title10: UILabel!
    @IBOutlet weak var Price10: UILabel!
    @IBOutlet weak var DeleteButton10: UIButton!
    @IBOutlet weak var DeleteImage10: UIImageView!
    @IBOutlet weak var Title11: UILabel!
    @IBOutlet weak var Price11: UILabel!
    @IBOutlet weak var DeleteButton11: UIButton!
    @IBOutlet weak var DeleteImage11: UIImageView!
    @IBOutlet weak var Title12: UILabel!
    @IBOutlet weak var Price12: UILabel!
    @IBOutlet weak var DeleteButton12: UIButton!
    @IBOutlet weak var DeleteImage12: UIImageView!
    @IBOutlet weak var Title13: UILabel!
    @IBOutlet weak var Price13: UILabel!
    @IBOutlet weak var DeleteButton13: UIButton!
    @IBOutlet weak var DeleteImage13: UIImageView!
    @IBOutlet weak var Title14: UILabel!
    @IBOutlet weak var Price14: UILabel!
    @IBOutlet weak var DeleteButton14: UIButton!
    @IBOutlet weak var DeleteImage14: UIImageView!
    @IBOutlet weak var Title15: UILabel!
    @IBOutlet weak var Price15: UILabel!
    @IBOutlet weak var DeleteButton15: UIButton!
    @IBOutlet weak var DeleteImage15: UIImageView!
    @IBOutlet weak var Title16: UILabel!
    @IBOutlet weak var Price16: UILabel!
    @IBOutlet weak var DeleteButton16: UIButton!
    @IBOutlet weak var DeleteImage16: UIImageView!
    @IBOutlet weak var Title17: UILabel!
    @IBOutlet weak var Price17: UILabel!
    @IBOutlet weak var DeleteButton17: UIButton!
    @IBOutlet weak var DeleteImage17: UIImageView!
    @IBOutlet weak var Title18: UILabel!
    @IBOutlet weak var Price18: UILabel!
    @IBOutlet weak var DeleteButton18: UIButton!
    @IBOutlet weak var DeleteImage18: UIImageView!

    struct Product{
        var title:String
        var price:String
    }
    
    let basket = Basket()
    
    var Delete:Int = 0
    
    var Products:[Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        basket.InitialValuesOfProducts()
        
        UpdatingProductValues()
        
        TotalPrice()
        
    }
    
    @IBAction func unwindToProducts(_ unwindSegue: UIStoryboardSegue) {
        if let sourceViewController = unwindSegue.source as? NewProductViewController{
            let product = Product(title: sourceViewController.TitleField.text!, price: sourceViewController.PriceField.text!)
            self.Products.append(product)
            self.AddingNewProduct()
        }
        
    }

    func AddingNewProduct(){
        
        let NewProduct = Products[(Products.count-1)]
        let title = NewProduct.title
        let price = NewProduct.price
        
        basket.AddingNewProduct(title: title, price: price)
        
        UpdatingProductValues()
        
        TotalPrice()
        
    }
    
    func UpdatingProductValues(){

        if basket.Basket[0] != "A" {  Title1.text = basket.Basket[0] ; Title1.alpha = 1.0 ; Price1.text = basket.Basket[18] ; Price1.alpha = 1.0 ; DeleteButton1.alpha = 0.011 ; DeleteImage1.alpha = 1.0}  else { Title1.alpha = 0.0; Price1.alpha = 0.0 ; DeleteButton1.alpha = 0.0 ; DeleteImage1.alpha = 0.0}
        if basket.Basket[1] != "A" {  Title2.text = basket.Basket[1] ; Title2.alpha = 1.0 ; Price2.text = basket.Basket[19] ; Price2.alpha = 1.0 ; DeleteButton2.alpha = 0.011 ; DeleteImage2.alpha = 1.0} else { Title2.alpha = 0.0 ; Price2.alpha = 0.0 ; DeleteButton2.alpha = 0.0 ; DeleteImage2.alpha = 0.0}
        if basket.Basket[2] != "A" {  Title3.text = basket.Basket[2] ; Title3.alpha = 1.0 ; Price3.text = basket.Basket[20] ; Price3.alpha = 1.0 ; DeleteButton3.alpha = 0.011 ; DeleteImage3.alpha = 1.0} else { Title3.alpha = 0.0 ; DeleteButton3.alpha = 0.0 ; Price3.alpha = 0.0 ; DeleteImage3.alpha = 0.0}
        if basket.Basket[3] != "A" {  Title4.text = basket.Basket[3] ; Title4.alpha = 1.0 ; Price4.text = basket.Basket[21] ; Price4.alpha = 1.0 ; DeleteButton4.alpha = 0.011 ; DeleteImage4.alpha = 1.0}  else { Title4.alpha = 0.0; Price4.alpha = 0.0 ; DeleteButton4.alpha = 0.0 ; DeleteImage4.alpha = 0.0}
        if basket.Basket[4] != "A" {  Title5.text = basket.Basket[4] ; Title5.alpha = 1.0 ; Price5.text = basket.Basket[22] ; Price5.alpha = 1.0 ; DeleteButton5.alpha = 0.011 ; DeleteImage5.alpha = 1.0} else { Title5.alpha = 0.0 ; Price5.alpha = 0.0 ; DeleteButton5.alpha = 0.0 ; DeleteImage5.alpha = 0.0}
        if basket.Basket[5] != "A" {  Title6.text = basket.Basket[5] ; Title6.alpha = 1.0 ; Price6.text = basket.Basket[23] ; Price6.alpha = 1.0 ; DeleteButton6.alpha = 0.011 ; DeleteImage6.alpha = 1.0} else { Title6.alpha = 0.0 ; DeleteButton6.alpha = 0.0 ; Price6.alpha = 0.0 ; DeleteImage6.alpha = 0.0}
        if basket.Basket[6] != "A" {  Title7.text = basket.Basket[6] ; Title7.alpha = 1.0 ; Price7.text = basket.Basket[24] ; Price7.alpha = 1.0 ; DeleteButton7.alpha = 0.011 ; DeleteImage7.alpha = 1.0}  else { Title7.alpha = 0.0; Price7.alpha = 0.0 ; DeleteButton7.alpha = 0.0 ; DeleteImage7.alpha = 0.0}
        if basket.Basket[7] != "A" {  Title8.text = basket.Basket[7] ; Title8.alpha = 1.0 ; Price8.text = basket.Basket[25] ; Price8.alpha = 1.0 ; DeleteButton8.alpha = 0.011 ; DeleteImage8.alpha = 1.0} else { Title8.alpha = 0.0 ; Price8.alpha = 0.0 ; DeleteButton8.alpha = 0.0 ; DeleteImage8.alpha = 0.0}
        if basket.Basket[8] != "A" {  Title9.text = basket.Basket[8] ; Title9.alpha = 1.0 ; Price9.text = basket.Basket[26] ; Price9.alpha = 1.0 ; DeleteButton9.alpha = 0.011 ; DeleteImage9.alpha = 1.0} else { Title9.alpha = 0.0 ; DeleteButton9.alpha = 0.0 ; Price9.alpha = 0.0 ; DeleteImage9.alpha = 0.0}
        if basket.Basket[9] != "A" {  Title10.text = basket.Basket[9] ; Title10.alpha = 1.0 ; Price10.text = basket.Basket[27] ; Price10.alpha = 1.0 ; DeleteButton10.alpha = 0.011 ; DeleteImage10.alpha = 1.0}  else { Title10.alpha = 0.0; Price10.alpha = 0.0 ; DeleteButton10.alpha = 0.0 ; DeleteImage10.alpha = 0.0}
        if basket.Basket[10] != "A" {  Title11.text = basket.Basket[10] ; Title11.alpha = 1.0 ; Price11.text = basket.Basket[28] ; Price11.alpha = 1.0 ; DeleteButton11.alpha = 0.011 ; DeleteImage11.alpha = 1.0} else { Title11.alpha = 0.0 ; Price11.alpha = 0.0 ; DeleteButton11.alpha = 0.0 ; DeleteImage11.alpha = 0.0}
        if basket.Basket[11] != "A" {  Title12.text = basket.Basket[11] ; Title12.alpha = 1.0 ; Price12.text = basket.Basket[29] ; Price12.alpha = 1.0 ; DeleteButton12.alpha = 0.011 ; DeleteImage12.alpha = 1.0} else { Title12.alpha = 0.0 ; DeleteButton12.alpha = 0.0 ; Price12.alpha = 0.0 ; DeleteImage12.alpha = 0.0}
        if basket.Basket[12] != "A" {  Title13.text = basket.Basket[12] ; Title13.alpha = 1.0 ; Price13.text = basket.Basket[30] ; Price13.alpha = 1.0 ; DeleteButton13.alpha = 0.011 ; DeleteImage13.alpha = 1.0}  else { Title13.alpha = 0.0; Price13.alpha = 0.0 ; DeleteButton13.alpha = 0.0 ; DeleteImage13.alpha = 0.0}
        if basket.Basket[13] != "A" {  Title14.text = basket.Basket[13] ; Title14.alpha = 1.0 ; Price14.text = basket.Basket[31] ; Price14.alpha = 1.0 ; DeleteButton14.alpha = 0.011 ; DeleteImage14.alpha = 1.0} else { Title14.alpha = 0.0 ; Price14.alpha = 0.0 ; DeleteButton14.alpha = 0.0 ; DeleteImage14.alpha = 0.0}
        if basket.Basket[14] != "A" {  Title15.text = basket.Basket[14] ; Title15.alpha = 1.0 ; Price15.text = basket.Basket[32] ; Price15.alpha = 1.0 ; DeleteButton15.alpha = 0.011 ; DeleteImage15.alpha = 1.0} else { Title15.alpha = 0.0 ; DeleteButton15.alpha = 0.0 ; Price15.alpha = 0.0 ; DeleteImage15.alpha = 0.0}
        if basket.Basket[15] != "A" {  Title16.text = basket.Basket[15] ; Title16.alpha = 1.0 ; Price16.text = basket.Basket[33] ; Price16.alpha = 1.0 ; DeleteButton16.alpha = 0.011 ; DeleteImage16.alpha = 1.0}  else { Title16.alpha = 0.0; Price16.alpha = 0.0 ; DeleteButton16.alpha = 0.0 ; DeleteImage16.alpha = 0.0}
        if basket.Basket[16] != "A" {  Title17.text = basket.Basket[16] ; Title17.alpha = 1.0 ; Price17.text = basket.Basket[34] ; Price17.alpha = 1.0 ; DeleteButton17.alpha = 0.011 ; DeleteImage17.alpha = 1.0} else { Title17.alpha = 0.0 ; Price17.alpha = 0.0 ; DeleteButton17.alpha = 0.0 ; DeleteImage17.alpha = 0.0}
        if basket.Basket[17] != "A" {  Title18.text = basket.Basket[17] ; Title18.alpha = 1.0 ; Price18.text = basket.Basket[35] ; Price18.alpha = 1.0 ; DeleteButton18.alpha = 0.011 ; DeleteImage18.alpha = 1.0} else { Title18.alpha = 0.0 ; DeleteButton18.alpha = 0.0 ; Price18.alpha = 0.0 ; DeleteImage18.alpha = 0.0}
        
        if (basket.NumberOfProducts>=2){
            DeleteEverything.alpha = 1.0
        }else{
            DeleteEverything.alpha = 0.0
        }
        
        if (basket.NumberOfProducts == 18){
            Add.isEnabled = false
            Help.alpha = 1.0
        }else{
            Add.isEnabled = true
            Help.alpha = 0.0
        }
    }

    @IBAction func DeleteButtonsPressing(_ sender: UIButton) {
        
        Delete = sender.tag
        
        basket.RemoveProduct(Delete: Delete)
        
        UpdatingProductValues()
        
        TotalPrice()
    }
    
    func TotalPrice(){
        
        basket.TotalPriceCalculation()
        
        if (((basket.Summa % 10) >= 2) && ((basket.Summa % 10) <= 4)) && (((basket.Summa % 100) < 12) || ((basket.Summa % 100) > 14)){
            
            Total.title = String(basket.Summa) + " рубля"
            
        }else if (((basket.Summa % 10) == 1) && ((basket.Summa % 100) != 11)){
            
            Total.title = String(basket.Summa) + " рубль"
            
        }else {
            
            Total.title = String(basket.Summa) + " рублей"
            
        }
        
    }
    
    @IBAction func RemoveAllClick(_ sender: Any) {
        
        basket.DeleteAllProducts()
        
        UpdatingProductValues()
        
        TotalPrice()
        
    }
    
    @IBAction func Help(_ sender: Any) {
        
        AlertMaximumNumberOfProducts()
        
    }
    
    private func AlertMaximumNumberOfProducts(){
        
        let alert = UIAlertController(title: "Внимание!!!", message: "Вы добавили в корзину максимально возможное  кол-во товаров. Если вы хотите добавить новые товары,то,пожалуйста,удалите один или несколько товаров из вашей корзины.", preferredStyle: .alert)
        
        let OkAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(OkAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

