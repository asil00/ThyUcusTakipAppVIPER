//
//  UcusEkleInteractor.swift
//  FlightManagement
//
//  Created by Asilcan Çetinkaya on 31.08.2022.
//

import Foundation

class UcusEkleInteractor:PresenterToInteractorUcusEkleProtocol {
    
    let db:FMDatabase?
    
    init(){
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("UcusBilgi.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    
    func yeniEkle(ucusTuru: Int, kabinAmiri: String, gidilecekAlan: String, ucusTarihi: String) {
        db?.open()
        
        do{
            try db!.executeUpdate("INSERT INTO ucuslar (ucusTuru,kabinAmiri,gidilecekAlan,ucusTarihi) VALUES (?,?,?,?)", values: [ucusTuru,kabinAmiri,gidilecekAlan,ucusTarihi])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    

    
}

