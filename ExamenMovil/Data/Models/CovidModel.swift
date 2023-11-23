//
//  CovidModel.swift
//  ExamenMovil
//
//  Created by sebastian Jimenez Bauer on 23/11/23.
//

import Foundation

struct Cases: Codable {
    var total: Int
    var new: Int
}

struct Result: Codable {
    var country: String
    var region: String
    var cases: Cases
}

struct Response: Codable {
    let results: [Result]
}

