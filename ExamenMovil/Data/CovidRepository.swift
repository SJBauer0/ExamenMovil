//
//  CovidRepository.swift
//  ExamenMovil
//
//  Created by sebastian Jimenez Bauer on 23/11/23.
//

import Foundation

/**
Creo la estrucutra del api
**/

struct Api {
    static let base = "https://api.api-ninjas.com/v1/covid19?date="
}

/**
Defino el protocolo
**/

protocol CovidAPIProtocol {
    func getCovidList() async -> [Result]?
}

/**
Implemtnacion del repositorio de NAME que
utiliza el protocolo en el folder Domain
**/

class CovidRepository: CovidAPIProtocol {
    
    let nservice: CovidAPIService
    
    static let shared = CovidRepository()

    init(nservice: CovidAPIService = CovidAPIService.shared) {
        self.nservice = nservice
    }

    //Creo la funcion para obtener los resultados

    func getCovidList() async -> [Result]? {
        return await nservice.getCovidList()
    }
}
