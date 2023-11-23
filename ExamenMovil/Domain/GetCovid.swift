//
//  GetCovid.swift
//  ExamenMovil
//
//  Created by sebastian Jimenez Bauer on 23/11/23.
//

import Foundation


/**
Utilizar protocolo que facilita las pruebas unitarias
**/

protocol CovidListRequirementProtocol {
    func getCovidList() async -> [Result]?
}

/**
Crear el singleton, agregar el metodo y llamar al repositorio
**/

struct CovidListRequirement: CovidListRequirementProtocol {
        
    let covidRepository: CovidAPIProtocol

    static let shared = CovidListRequirement()
    
    init(covidRepository: CovidAPIProtocol = CovidRepository()) {
        self.covidRepository = covidRepository
    }
    
    func getCovidList() async -> [Result]? {
        return await covidRepository.getCovidList()
    }
}
