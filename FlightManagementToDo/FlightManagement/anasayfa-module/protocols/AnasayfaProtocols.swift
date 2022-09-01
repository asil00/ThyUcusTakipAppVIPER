//
//  AnasayfaProtocols.swift
//  FlightManagement
//
//  Created by Asilcan Çetinkaya on 31.08.2022.
//

import Foundation

protocol  ViewToPresenterAnasayfaProtocol {
    
    var anasayfaInteractor : PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView : PresenterToViewAnasayfaProtocol? {get set}
    
    func verileriGetir()
    func ara(kelime : String)
    func sil(ucusId : Int)
    func filtre(ucusTuru : Int)
    
}

protocol PresenterToInteractorAnasayfaProtocol {
    
    var anaSayfaPresenter : InteractorToPresenterAnasayfaProtocol? {get set}
    func dataBaseVeriGetir()
    func ucusAra(kelime : String)
    func ucusuSil(ucusId : Int)
    func filtrele(ucusTuru : Int)
    
}

protocol InteractorToPresenterAnasayfaProtocol {
    
    func presenteraVeriGonder(UcusBilgisi : Array<UcusModel>)
    
}

protocol PresenterToViewAnasayfaProtocol {
    
    func vieweVeriGonder(UcusBilgisi : Array<UcusModel>)
}

protocol PresenterToRouterAnasayfaProtocol {
    
    static func createModule(ref:AnasayfaVC)
}

