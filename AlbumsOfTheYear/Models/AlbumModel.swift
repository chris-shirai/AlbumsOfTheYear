//
//  AlbumModel.swift
//  AlbumsOfTheYear
//
//  Created by Chris Shirai on 12/6/25.
//

import Foundation
import MusicKit
import SwiftData

@Model
class AlbumModel  {

    var id: String = ""
    var name: String = ""
    var artist: String = ""
    var artworkUrl: URL?
    var releaseDate: Date?
    var rank: Int = 0

    init(musicItemID: String, name: String, artist: String, artworkUrl: URL?, releaseDate: Date?, rank: Int) {
        self.id = musicItemID
        self.name = name
        self.artist = artist
        self.artworkUrl = artworkUrl
        self.releaseDate = releaseDate
        self.rank = rank
    }

    var year: Int? {

        if releaseDate != nil {

            let yearString = releaseDate!.formatted(.dateTime.year())

            if let intValue = Int(yearString) {
                return intValue
            }
        }
        return nil
    }
}
