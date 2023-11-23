//
//  CovidApiServices.swift
//  ExamenMovil
//
//  Created by sebastian Jimenez Bauer on 23/11/23.
//

// API Key: tmEwAP5zJ4bllnMGJOYOPw==gCUCy3PG8eL9KJ62


/**
Se hace la peticion con el token de acceso
Me base en el documento del laboratorio y notas que hice en Obsidian
*/

import Foundation
import Alamofire

class CovidAPIService {
    static let shared = CovidAPIService()
    static let token = "tmEwAP5zJ4bllnMGJOYOPw==gCUCy3PG8eL9KJ62"
    
    func getCovidList(for date: String) async -> [Result]? {
        let url = "\(Api.base)\(date)"

        let headers: HTTPHeaders = [
            "X-Api-Key" : "tmEwAP5zJ4bllnMGJOYOPw==gCUCy3PG8eL9KJ62",
        ]

        do {
            let taskRequest = AF.request(url, method: .get, headers: headers).validate()
            let response = await taskRequest.serializingData().response
            
            switch response.result {
            case .success(let data):
                do {
                    let countries = try JSONDecoder().decode([Result].self, from: data)
                    debugPrint(countries)
                    return countries
                } catch {
                    debugPrint(error.localizedDescription)
                    return nil
                }
            case let .failure(error):
                debugPrint(error.localizedDescription)
                return nil
            }
        }
    }
}

