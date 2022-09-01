//
//  KategoriRouter.swift
//  FlightManagement
//
//  Created by Asilcan Çetinkaya on 31.08.2022.
//

import Foundation

class KategoriRouter : PresenterToRouterKategoriProtocol {
    
    static func createModule(ref: KategoriVC) {
        
        let presenter = KategoriPresenter()
        ref.kategoriPresenterNesnesi = presenter
        ref.kategoriPresenterNesnesi?.ucusKategoriInteractor = KategoriInteractor()
        ref.kategoriPresenterNesnesi?.ucusKategoriView = ref
        ref.kategoriPresenterNesnesi?.ucusKategoriInteractor?.kategoriPresenter = presenter
        
    }
    
}
