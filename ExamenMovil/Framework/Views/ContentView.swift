//
//  ContentView.swift
//  ExamenMovil
//
//  Created by sebastian Jimenez Bauer on 23/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel()
    
    var body: some View {
        List(contentViewModel.covidList, id: \.country) { covid in
            HStack {
                Text(covid.country)
                Text("\(covid.cases.total)")
            }
        }.onAppear {
            Task {
                await contentViewModel.fetch()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
