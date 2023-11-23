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
    func getCovidList(for date: String) async -> [Result]?
}

/**
 Crear el singleton, agregar el metodo y llamar al repositorio
 **/

class CovidListRequirement: CovidListRequirementProtocol {
    func getCovidList(for date: String) async -> [Result]? {
        return await covidRepository.getCovidList(for: date)
    }

    
    static let shared = CovidListRequirement()
    
    private let covidRepository: CovidAPIProtocol

    init(covidRepository: CovidAPIProtocol = CovidRepository.shared) {
        self.covidRepository = covidRepository
    }
}

