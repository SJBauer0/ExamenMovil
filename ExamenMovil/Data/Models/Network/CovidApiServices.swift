//
//  CovidApiServices.swift
//  ExamenMovil
//
//  Created by sebastian Jimenez Bauer on 23/11/23.
//

import Foundation

// API Key: tmEwAP5zJ4bllnMGJOYOPw==gCUCy3PG8eL9KJ62

import Foundation
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
        
        let url = "\(Api.base)/canada"

        let headers: HTTPHeaders = [
            // "Authorization" : "Bearer \(token)",
            "Authorization" : "Bearer \(CovidAPIService.token)",
            "Accept": "application/json"
        ]

        let taskRequest = AF.request(url, method: .get, headers: headers).validate()
        let response = await taskRequest.serializingData().response
        
        switch response.result {
             case .success(let data):
                 do {
                     let response = try JSONDecoder().decode(Response.self, from: data)
                     return response.results
                 } catch {
                     return nil
                 }
             case let .failure(error):
                 debugPrint(error.localizedDescription)
                 return nil
             }
    }
}
