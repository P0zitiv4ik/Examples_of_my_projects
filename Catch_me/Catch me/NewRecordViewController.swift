//
//  NewRecordViewController.swift
//  Catch me
//
//  Created by Kirill on 30/05/2022.
//  Copyright © 2022 Kirill Dubrovskiy. All rights reserved.
//

import UIKit

class NewRecordViewController: UIViewController {
    
    @IBOutlet weak var EasyRecord: UILabel!
    @IBOutlet weak var AverageRecord: UILabel!
    @IBOutlet weak var HardLevelRecord: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let NewEasyRecord = UserDefaults.standard.integer(forKey: "Level1Record")
        if NewEasyRecord != 0{
            EasyRecord.text = "На легком уровне: \(NewEasyRecord)"
        }else{
            EasyRecord.text = "Рекорд не установлен"
        }
        
        let NewRecordAtTheMiddleLevel = UserDefaults.standard.integer(forKey: "Level2Record")
        if NewRecordAtTheMiddleLevel != 0{
            AverageRecord.text = "На среднем уровне: \(NewRecordAtTheMiddleLevel)"
        }else{
            AverageRecord.text = "Рекорд не установлен"
        }
        
        let NewRecordOnHardLevel = UserDefaults.standard.integer(forKey: "Level3Record")
        if NewRecordOnHardLevel != 0{
            HardLevelRecord.text = "На сложном уровне: \(NewRecordOnHardLevel)"
        }else{
            HardLevelRecord.text = "Рекорд не установлен"
        }
    }
}

