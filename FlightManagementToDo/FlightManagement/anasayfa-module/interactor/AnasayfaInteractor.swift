//
//  AnasayfaInteractor.swift
//  FlightManagement
//
//  Created by Asilcan Çetinkaya on 31.08.2022.
//

import Foundation

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
   
    
    
    var anaSayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    let db: FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("UcusBilgi.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    
    func dataBaseVeriGetir() {
        
        var ucusListe = [UcusModel]()
        
        db?.open()
        
        do{
            let q = try db!.executeQuery("SELECT * FROM ucuslar", values: nil)
            
            while q.next() {
                
                let ucus = UcusModel(ucusId: Int(q.string(forColumn: "ucusId"))!, ucusTuru: Int(q.string(forColumn: "ucusTuru"))!, kabinAmiri: q.string(forColumn: "kabinAmiri")!, gidilecekAlan: q.string(forColumn: "gidilecekAlan")!, ucusTarihi: q.string(forColumn: "ucusTarihi"))
                

                ucusListe.append(ucus)
            }
            anaSayfaPresenter?.presenteraVeriGonder(UcusBilgisi: ucusListe)
            
        }catch{
            
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func ucusAra(kelime: String) {
        var ucusListe = [UcusModel]()
        
        db?.open()
        
        do{
            let q = try db!.executeQuery("SELECT * FROM ucuslar WHERE kabinAmiri like '%\(kelime)%'", values: nil)
            
            while q.next() {
                
                let ucus = UcusModel(ucusId: Int(q.string(forColumn: "ucusId"))!, ucusTuru: Int(q.string(forColumn: "ucusTuru"))!, kabinAmiri: q.string(forColumn: "kabinAmiri")!, gidilecekAlan: q.string(forColumn: "gidilecekAlan")!, ucusTarihi: q.string(forColumn: "ucusTarihi")!)
                    
                ucusListe.append(ucus)
            }
            anaSayfaPresenter?.presenteraVeriGonder(UcusBilgisi: ucusListe)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func ucusuSil(ucusId: Int) {
        
        db?.open()
        
        do{
            try db!.executeUpdate("DELETE FROM ucuslar WHERE ucusId = ?", values: [ucusId])
            dataBaseVeriGetir()
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func filtrele(ucusTuru: Int) {
        var ucusListe = [UcusModel]()
        
        db?.open()
        
        do{
            let q = try db!.executeQuery("SELECT * FROM ucuslar WHERE  ucusTuru = \(ucusTuru)", values: [ucusTuru])
            
            while q.next() {
                
                let ucus = UcusModel(ucusId: Int(q.string(forColumn: "ucusId"))!, ucusTuru: Int(q.string(forColumn: "ucusTuru"))!, kabinAmiri: q.string(forColumn: "kabinAmiri")!, gidilecekAlan: q.string(forColumn: "gidilecekAlan")!, ucusTarihi: q.string(forColumn: "ucusTarihi")!)
                    
                ucusListe.append(ucus)
            }
            anaSayfaPresenter?.presenteraVeriGonder(UcusBilgisi: ucusListe)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    
}
