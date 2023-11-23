//
//  ViewModel.swift
//  ExamenMovil
//
//  Created by sebastian Jimenez Bauer on 23/11/23.
//

import Foundation

/*
Creo el ViewModel para la interaccion con
las reglas de negocio y para escoger como
mostrar la informacion
*/

class ContentViewModel : ObservableObject {
    @Published var covidList = [Result]()
    
    private var covidListRequirement: CovidListRequirement


    init(covidListRequirement: CovidListRequirement =  CovidListRequirement()){
        self.covidListRequirement = covidListRequirement
    }
    
    @MainActor
    func fetch () async {
        covidList = await covidListRequirement.getCovidList() ?? []
        debugPrint(covidList)
    }
}

