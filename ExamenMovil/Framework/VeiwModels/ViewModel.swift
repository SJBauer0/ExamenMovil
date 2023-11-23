//
//  ViewModel.swift
//  ExamenMovil
//
//  Created by sebastian Jimenez Bauer on 23/11/23.
//

import Foundation

/*
Me baso en los laboratorios que hicimos
 */
 
import Foundation

struct CaseData: Codable {
    var total: Int
    var new: Int
}

struct Result: Codable {
    var country: String
    var region: String
    var date: String
    var cases: [String: CaseData]
    
    var total: Int {
        return cases.values.reduce(0) { $0 + $1.total }
    }
    
    var new: Int {
        return cases.values.reduce(0) { $0 + $1.new }
    }
    
    var id: Int {
        return "\(country)\(region)\(date)".hashValue
    }
}

struct Response: Codable {
    let results: [Result]
}

