//
//  PreviewContainer.swift
//  AlbumsOfTheYear
//
//  Created by Chris Shirai on 12/7/25.
//

import Foundation
import SwiftData

@MainActor
let previewContainer: ModelContainer = {

    do {
        let container = try ModelContainer(
            for: AlbumModel.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )

        SampleData.albums6.forEach { album in
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
    
    static let albums6: [AlbumModel] = {
        return [
            AlbumModel(
                name: "The Art of Loving",
                artist: "Olivia Dean",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 1
            ),
            AlbumModel(
                name: "moisturizer",
                artist: "Wet Leg",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 2
            ),
            AlbumModel(
                name: "Hurry Up Tomorrow",
                artist: "The Weeknd",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 3
            ),
            AlbumModel(
                name: "moisturizer1",
                artist: "Wet Leg1",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 5
            ),
            AlbumModel(
                name: "Hurry Up Tomorrow6",
                artist: "The Weeknd6",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 6
            ),
            AlbumModel(
                name: "BRAT",
                artist: "Charli xcx",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2024),
                rank: 1
            ),
            AlbumModel(
                name: "BRAT2",
                artist: "Charli xcx",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2024),
                rank: 2
            ),
            AlbumModel(
                name: "BRAT3",
                artist: "Charli xcx",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2024),
                rank: 3
            ),
            AlbumModel(
                name: "BRAT4",
                artist: "Charli xcx",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2024),
                rank: 4
            ),
        ]
    }()


    static let albums5: [AlbumModel] = {
        return [
            AlbumModel(
                name: "BRAT",
                artist: "Charli xcx",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2024),
                rank: 1
            ),
            AlbumModel(
                name: "The Art of Loving",
                artist: "Olivia Dean",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 1
            ),
            AlbumModel(
                name: "moisturizer",
                artist: "Wet Leg",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 2
            ),
            AlbumModel(
                name: "Hurry Up Tomorrow",
                artist: "The Weeknd",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 3
            ),
            AlbumModel(
                name: "EUSEXUA",
                artist: "FKA Twigs",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 4
            ),
        ]
    }()
    
    static let albums4: [AlbumModel] = {
        return [
            AlbumModel(
                name: "BRAT",
                artist: "Charli xcx",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2024),
                rank: 1
            ),
            AlbumModel(
                name: "The Art of Loving",
                artist: "Olivia Dean",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 1
            ),
            AlbumModel(
                name: "moisturizer",
                artist: "Wet Leg",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 2
            ),
            AlbumModel(
                name: "Hurry Up Tomorrow",
                artist: "The Weeknd",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 3
            ),
        ]
    }()

    static let albums3: [AlbumModel] = {
        return [
            AlbumModel(
                name: "BRAT",
                artist: "Charli xcx",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2024),
                rank: 1
            ),
            AlbumModel(
                name: "The Art of Loving",
                artist: "Olivia Dean",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 1
            ),
            AlbumModel(
                name: "moisturizer",
                artist: "Wet Leg",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 2
            ),
        ]
    }()

    static let albums2: [AlbumModel] = {
        return [
            AlbumModel(
                name: "BRAT",
                artist: "Charli xcx",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2024),
                rank: 1
            ),
            AlbumModel(
                name: "The Art of Loving",
                artist: "Olivia Dean",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 1
            ),
        ]
    }()

    static let albums1: [AlbumModel] = {
        return [
            AlbumModel(
                name: "BRAT",
                artist: "Charli xcx",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2024),
                rank: 1
            )
        ]
    }()

    static let albums0: [AlbumModel] = {
        return []
    }()

}
