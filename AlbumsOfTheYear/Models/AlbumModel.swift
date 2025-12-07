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
class AlbumModel {

    var name: String = ""
    var artist: String = ""
    var artworkUrl: URL?
    var releaseDate: Date?

    init(name: String, artist: String, artworkUrl: URL?, releaseDate: Date?) {
        self.name = name
        self.artist = artist
        self.artworkUrl = artworkUrl
        self.releaseDate = releaseDate
    }
    
    var year: String {
        
        if (releaseDate != nil) {
          return  releaseDate!.formatted(.dateTime.year())
        }

        
        
        return ""
    }
}
