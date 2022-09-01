//
//  AnasayfaRouter.swift
//  FlightManagement
//
//  Created by Asilcan Çetinkaya on 31.08.2022.
//

import Foundation

class AnasayfaRouter : PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: AnasayfaVC) {
        let presenter = AnasayfaPresenter()
        ref.anaSayfaPresenterNesnesi = presenter
        ref.anaSayfaPresenterNesnesi?.anasayfaInteractor = AnasayfaInteractor()
        ref.anaSayfaPresenterNesnesi?.anasayfaView = ref
        ref.anaSayfaPresenterNesnesi?.anasayfaInteractor?.anaSayfaPresenter = presenter
        
    }
    
    
}

