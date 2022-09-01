//
//  UcusEkleRouter.swift
//  FlightManagement
//
//  Created by Asilcan Çetinkaya on 31.08.2022.
//

import Foundation

class UcusEkleRouter : PresenterToRouterUcusEkleProtocol {
    
    static func createModule(ref: ucusEkleVC) {
        ref.ucusEklePresenterNesnesi = UcusEklePresenter()
        ref.ucusEklePresenterNesnesi?.ucusEkleInteractor = UcusEkleInteractor()
    }
    
    
}
