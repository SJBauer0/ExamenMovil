//
//  CovidApiServices.swift
//  ExamenMovil
//
//  Created by sebastian Jimenez Bauer on 23/11/23.
//

import Foundation

// API Key: tmEwAP5zJ4bllnMGJOYOPw==gCUCy3PG8eL9KJ62

import Alamofire

/**
Se hace la peticion con el token de acceso
Me base en el documento del laboratorio y notas que hice en Obsidian
*/

import Alamofire

class CovidAPIService {
    static let shared = CovidAPIService()

    static let token = "tmEwAP5zJ4bllnMGJOYOPw==gCUCy3PG8eL9KJ62"
    
    func getCovidList() async -> [Result]? {
        
        let url = "\(Api.base)2022-11-01"

        let headers: HTTPHeaders = [
            "X-Api-Key" : "tmEwAP5zJ4bllnMGJOYOPw==gCUCy3PG8eL9KJ62",
        ]

        let taskRequest = AF.request(url, method: .get, headers: headers).validate()
                let response = await taskRequest.serializingData().response
                
                switch response.result{
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
