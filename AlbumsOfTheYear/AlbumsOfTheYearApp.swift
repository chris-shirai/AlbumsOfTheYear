//
//  AlbumsOfTheYearApp.swift
//  AlbumsOfTheYear
//
//  Created by Chris Shirai on 11/23/25.
//

import SwiftData
import SwiftUI

@main
struct AlbumsOfTheYearApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
        }
        .modelContainer(for: [AlbumModel.self])
        
    }
}
