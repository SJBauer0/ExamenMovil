//
//  ContentView.swift
//  ExamenMovil
//
//  Created by sebastian Jimenez Bauer on 23/11/23.
//
import SwiftUI

/// Content View To see the calendar
struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel()
    @State private var selectedDate = Date()

    var body: some View {
        NavigationView {
            VStack {
                Text("COVID-19 Statistics")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                Text("Use Dates from Feburary 2020 to March 2022")
                    .font(.body)
                    .padding()

                /// Calendar View
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(CompactDatePickerStyle())
                    .padding()
                    .onChange(of: selectedDate) { newDate in
                        Task {
                            await contentViewModel.fetch(for: newDate)
                        }
                    }

                /// List view
                List(contentViewModel.covidList, id: \.country) { covid in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(covid.country)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)

                        Text("Total Cases: \(covid.cases.total)")
                            .font(.headline)
                            .foregroundColor(.secondary)

                        Text("Region: \(covid.region)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 8)
                }
                .listStyle(PlainListStyle())
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
            }
            .onAppear {
                Task {
                    await contentViewModel.fetch(for: selectedDate)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
