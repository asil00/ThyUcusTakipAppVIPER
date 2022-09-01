//
//  UcusEklePresenter.swift
//  FlightManagement
//
//  Created by Asilcan Çetinkaya on 31.08.2022.
//

import Foundation

class UcusEklePresenter : ViewToPresenterUcusEkleProtocol{
    
    var ucusEkleInteractor: PresenterToInteractorUcusEkleProtocol?
    
    
    func ekle(ucusTuru: Int, kabinAmiri: String, gidilecekAlan: String, ucusTarihi: String) {
        ucusEkleInteractor?.yeniEkle(ucusTuru: ucusTuru, kabinAmiri: kabinAmiri, gidilecekAlan: gidilecekAlan, ucusTarihi: ucusTarihi)
    }
    

    
    
}

