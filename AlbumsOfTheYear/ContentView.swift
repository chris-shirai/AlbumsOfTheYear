//
//  ContentView.swift
//  AlbumsOfTheYear
//
//  Created by Chris Shirai on 11/23/25.
//

import MusicKit
import SwiftUI
import SwiftData

struct ContentView: View {

    @Environment(\.modelContext) private var context
    @State private var selection = 0
    @State private var isShowingAlert = false
    @State private var message = ""

    var body: some View {

        TabView(selection: $selection) {
            AlbumsView()
                .tag(0)
                .tabItem {
                    Label("Albums", systemImage: "book")
                }
            SettingsView()
                .tag(1)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            TestPage1()
                .tag(2)
                .tabItem {
                    Label("Test", systemImage: "gear")
                }
        }
        .task {
            let status = await MusicAuthorization.request()
            
//            switch status {
//            case.authorized:
//                isShowingAlert = true
//                message = "authorized"
//                break
//            // Handle authorized success
//            case.restricted:
//                isShowingAlert = true
//                message = "restricted"
//                break
//            // Handle restricted error
//            case.notDetermined:
//                isShowingAlert = true
//                message = "notDetermined"
//                break
//            // Handle notDetermined error
//            case.denied:
//                isShowingAlert = true
//                message = "denied"
//                break
//            // Handle denied error
//            @unknown default:
//                isShowingAlert = true
//                message = "default"
//                break
//            // Handle notDetermined error
//            }
            
            
            
            
            
        }
        .alert(isPresented: $isShowingAlert, content: {
            Alert(title: Text("test"), message: Text(self.message), dismissButton: .default(Text("OK")))
        })

    }
}


#Preview {
    ContentView()
}
