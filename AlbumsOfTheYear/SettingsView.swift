//
//  SettingsView.swift
//  AlbumsOfTheYear
//
//  Created by Chris Shirai on 12/4/25.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("savedUserName") var userName: String = "" // Default value provided

    var body: some View {
        VStack {
                   TextField("Enter your name", text: $userName)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .padding()

                   Text("Your saved name: \(userName)")
               }
        
    }
}

#Preview {
    SettingsView()
}
