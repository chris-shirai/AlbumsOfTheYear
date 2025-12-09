//
//  PreviewContainer.swift
//  AlbumsOfTheYear
//
//  Created by Chris Shirai on 12/7/25.
//

import Foundation
import SwiftData

@MainActor
let previewConainer: ModelContainer = {

    do {
        let container = try ModelContainer(
            for: AlbumModel.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )

        SampleData.albums.forEach { album in
            container.mainContext.insert(album)
        }

        return container
    } catch {
        fatalError("Failed to create container.")
    }

}()

func getDate(year: Int) -> Date {
    
    var dateComponents = DateComponents()
    dateComponents.year = year

    let userCalendar = Calendar.current
    let customDate = userCalendar.date(from: dateComponents)

    return customDate!
}

struct SampleData {

    static let albums: [AlbumModel] = {
        return [
            AlbumModel(
                name: "BRAT",
                artist: "Charli xcx",
                artworkUrl: nil,
                releaseDate: getDate(year: 2024)
            ),
            AlbumModel(
                name: "The Art of Loving",
                artist: "Olivia Dean",
                artworkUrl: nil,
                releaseDate: getDate(year: 2025)
            ),
            AlbumModel(
                name: "moisturizer",
                artist: "Wet Leg",
                artworkUrl: nil,
                releaseDate: getDate(year: 2025)
            ),
            AlbumModel(
                name: "Hurry Up Tomorrow",
                artist: "The Weeknd",
                artworkUrl: nil,
                releaseDate: getDate(year: 2025)
            ),
            AlbumModel(
                name: "UTOPIA",
                artist: "Travis Scott",
                artworkUrl: nil,
                releaseDate: getDate(year: 2023)
            ),
        ]
    }()
}
