//
//  SettingsView.swift
//  AlbumsOfTheYear
//
//  Created by Chris Shirai on 12/4/25.
//

import SwiftUI

struct SettingsView: View {

    @AppStorage("savedUserName") var userName: String = ""

    @AppStorage("savedStartingYear") var selectedStartingYear: Int = 1965
    @AppStorage("savedEndingYear") var selectedEndingYear: Int = 2025

    @State private var tempSelectedStartingYear: Int = 1965

    let startingYear = 1920
    let endingYear = 2025

    var body: some View {
        VStack {
            Form {
                Section {
                    Picker(
                        "Starting year",
                        selection: $tempSelectedStartingYear
                    ) {
                        ForEach(
                            (startingYear...endingYear).reversed(),
                            id: \.self
                        ) {
                            number in
                            Text("\(String(number))")
                        }
                    }
                    .pickerStyle(.menu)
                    .onChange(of: tempSelectedStartingYear) {
                        oldValue,
                        newValue in

                        if tempSelectedStartingYear >= selectedEndingYear {
                            selectedEndingYear = endingYear
                        }

                        selectedStartingYear = tempSelectedStartingYear
                    }

                    Picker("Ending year", selection: $selectedEndingYear) {
                        ForEach(
                            (selectedStartingYear...endingYear).reversed(),
                            id: \.self
                        ) {
                            number in
                            Text("\(String(number))")
                        }
                    }
                    .pickerStyle(.menu)

                    TextField("Enter your name", text: $userName)

                    Text("Your saved name: \(userName)")

                }
            }

        }
        .onAppear {
            // When the view appears, initialize the temporary state variable
            // with the value from UserDefaults, or an empty string if not found.
            tempSelectedStartingYear = selectedStartingYear
        }

    }
}

#Preview {
    SettingsView()
}
