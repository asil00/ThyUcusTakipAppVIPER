//
//  UcusModel.swift
//  FlightManagement
//
//  Created by Asilcan Çetinkaya on 31.08.2022.
//

import Foundation

class UcusModel {
    var ucusId: Int?
    var ucusTuru: Int?
    var kabinAmiri: String?
    var gidilecekAlan: String?
   
    var ucusTarihi: String?
    
    init(ucusId: Int, ucusTuru: Int, kabinAmiri: String, gidilecekAlan: String, ucusTarihi: String) {
        self.ucusId = ucusId
        self.ucusTuru = ucusTuru
        self.kabinAmiri = kabinAmiri
        self.gidilecekAlan = gidilecekAlan
        
        self.ucusTarihi = ucusTarihi
    }
}
