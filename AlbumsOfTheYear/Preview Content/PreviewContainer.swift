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
                musicItemID: "1",
                name: "The Art of Loving",
                artist: "Olivia Dean",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 1
            ),
            AlbumModel(
                musicItemID: "2",
                name: "moisturizer",
                artist: "Wet Leg",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 2
            ),
            AlbumModel(
                musicItemID: "3",
                name: "Hurry Up Tomorrow",
                artist: "The Weeknd",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 3
            ),
            AlbumModel(
                musicItemID: "4",
                name: "moisturizer1",
                artist: "Wet Leg1",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 5
            ),
            AlbumModel(
                musicItemID: "5",
                name: "Hurry Up Tomorrow6",
                artist: "The Weeknd6",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 6
            ),
            AlbumModel(
                musicItemID: "6",
                name: "BRAT",
                artist: "Charli xcx",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2024),
                rank: 1
            ),
            AlbumModel(
                musicItemID: "7",
                name: "BRAT2",
                artist: "Charli xcx",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2024),
                rank: 2
            ),
            AlbumModel(
                musicItemID: "8",
                name: "BRAT3",
                artist: "Charli xcx",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2024),
                rank: 3
            ),
            AlbumModel(
                musicItemID: "9",
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
                musicItemID: "1",
                name: "BRAT",
                artist: "Charli xcx",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2024),
                rank: 1
            ),
            AlbumModel(
                musicItemID: "2",
                name: "The Art of Loving",
                artist: "Olivia Dean",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 1
            ),
            AlbumModel(
                musicItemID: "3",
                name: "moisturizer",
                artist: "Wet Leg",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 2
            ),
            AlbumModel(
                musicItemID: "4",
                name: "Hurry Up Tomorrow",
                artist: "The Weeknd",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 3
            ),
            AlbumModel(
                musicItemID: "5",
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
                musicItemID: "1",
                name: "BRAT",
                artist: "Charli xcx",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2024),
                rank: 1
            ),
            AlbumModel(
                musicItemID: "2",
                name: "The Art of Loving",
                artist: "Olivia Dean",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 1
            ),
            AlbumModel(
                musicItemID: "3",
                name: "moisturizer",
                artist: "Wet Leg",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 2
            ),
            AlbumModel(
                musicItemID: "4",
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
                musicItemID: "1",
                name: "BRAT",
                artist: "Charli xcx",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2024),
                rank: 1
            ),
            AlbumModel(
                musicItemID: "2",
                name: "The Art of Loving",
                artist: "Olivia Dean",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2025),
                rank: 1
            ),
            AlbumModel(
                musicItemID: "3",
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
                musicItemID: "1",
                name: "BRAT",
                artist: "Charli xcx",
                artworkUrl: URL(string: "https://img.freepik.com/premium-photo/red-color-background-square-illustration-with-space-text_7954-36267.jpg"),
                releaseDate: getDate(year: 2024),
                rank: 1
            ),
            AlbumModel(
                musicItemID: "2",
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
                musicItemID: "1",
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
