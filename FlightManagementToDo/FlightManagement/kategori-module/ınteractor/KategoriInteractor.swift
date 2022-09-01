//
//  KategoriInteractor.swift
//  FlightManagement
//
//  Created by Asilcan Çetinkaya on 31.08.2022.
//

import Foundation

class KategoriInteractor : PresenterToInteractorKategoriProtocol {
    
    func butunVeriTabanınıGetir() {
        
        var ucusListe = [UcusModel]()
        
        db?.open()
        
        do{
            let q = try db!.executeQuery("SELECT * FROM ucuslar", values: nil)
            
            while q.next() {
                
                let ucus = UcusModel(ucusId: Int(q.string(forColumn: "ucusId"))!, ucusTuru: Int(q.string(forColumn: "ucusTuru"))!, kabinAmiri: q.string(forColumn: "kabinAmiri")!, gidilecekAlan: q.string(forColumn: "gidilecekAlan")!, ucusTarihi: q.string(forColumn: "ucusTarihi"))
                

                ucusListe.append(ucus)
            }
            kategoriPresenter?.presenteraVeriGonder(ucusBilgisi: ucusListe)
            
        }catch{
            
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    
    var kategoriPresenter: InteractorToPresenterKategoriProtocol?
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("UcusBilgi.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    
    func kategoriyeGoreFiltrele(ucusTuru: Int) {
        
        var ucusListe = [UcusModel]()
        
        db?.open()
        
        do{
            let q = try db!.executeQuery("SELECT * FROM ucuslar WHERE ucusTuru = \(ucusTuru)", values: [ucusTuru])
            print(q)
            
            while q.next() {
                
                let ucus = UcusModel(ucusId: Int(q.string(forColumn: "ucusId"))!, ucusTuru: Int(q.string(forColumn: "ucusTuru"))!, kabinAmiri: q.string(forColumn: "kabinAmiri")!, gidilecekAlan: q.string(forColumn: "gidilecekAlan")!, ucusTarihi: q.string(forColumn: "ucusTarihi")!)
                    
                ucusListe.append(ucus)
            }
            
            kategoriPresenter?.presenteraVeriGonder(ucusBilgisi: ucusListe)
            
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
        
    }
    
}
    

