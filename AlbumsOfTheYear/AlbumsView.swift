//
//  AlbumsView.swift
//  AlbumsOfTheYear
//
//  Created by Chris Shirai on 12/4/25.
//

import SwiftUI
import MusicKit
import SwiftData

struct AlbumsView: View {
    
    @Environment(\.modelContext) private var context
    @State private var searchTerm = ""
    @State private var albums: MusicItemCollection<Album> = []
    
    var body: some View {
        
        rootView
            .onChange(of: searchTerm, perform: requestUpdatedSearchResults)
    }
    
    @MainActor
    private func apply(_ searchResponse: MusicCatalogSearchResponse, for searchTerm: String) {
        if self.searchTerm == searchTerm {
            self.albums = searchResponse.albums
        }
    }
    
    private func requestUpdatedSearchResults(for searchTerm: String) {
        Task {
            if searchTerm.isEmpty {
                self.reset()
            } else {
                do {
                    // Issue a catalog search request for albums matching the search term.
                    var searchRequest = MusicCatalogSearchRequest(term: searchTerm, types: [Album.self])
                    searchRequest.limit = 5
                    let searchResponse = try await searchRequest.response()
                    
                    // Update the user interface with the search response.
                    self.apply(searchResponse, for: searchTerm)
                    print(searchResponse)
                } catch {
                    print("Search request failed with error: \(error).")
                    self.reset()
                }
            }
        }
    }
    
    @MainActor
    private func reset() {
        self.albums = []
    }
    
    private var rootView: some View {
        NavigationView {
//            Text("Hello wurld")
            navigationViewContents
                .navigationTitle("Music Albums")
        }
        .searchable(text: $searchTerm, prompt: "Albums")
    }
    
    private var navigationViewContents: some View {
        VStack {
            searchResultsList
                .animation(.default, value: albums)
          
        }
    }
    
    private var searchResultsList: some View {
//        List(albums.isEmpty ? recentAlbumsStorage.recentlyViewedAlbums : albums) { album in
//            AlbumCell(album)
//        }
        List(albums) { album in
            AlbumCell(album)
                .onTapGesture {
                    print("Tapped on: \(album.title)")
                                 // Perform desired action here, e.g., navigate to a detail view
                    
                    let vegetable = AlbumModel(name: album.title, artist: album.artistName, artworkUrl:  album.artwork?.url(width: 56, height: 56), releaseDate: album.releaseDate)
                    context.insert(vegetable)
                             }
        }
    }
}



struct AlbumCell: View {
    
    // MARK: - Object lifecycle
    
    init(_ album: Album) {
        self.album = album
    }
    
    // MARK: - Properties
    
    let album: Album
    
    // MARK: - View
    
    var body: some View {
//        NavigationLink(destination: AlbumDetailView(album)) {
//            MusicItemCell(
//                artwork: album.artwork,
//                title: album.title,
//                subtitle: album.artistName
//            )
//        }
       
            MusicItemCell(
                artwork: album.artwork,
                title: album.title,
                subtitle: album.artistName
            )
        
    }
}

struct MusicItemCell: View {
    
    // MARK: - Properties
    
    let artwork: Artwork?
    let title: String
    let subtitle: String
    
    // MARK: - View
    
    var body: some View {
        HStack {
            if let existingArtwork = artwork {
                VStack {
                    Spacer()
                    ArtworkImage(existingArtwork, width: 56)
                        .cornerRadius(6)
                    Spacer()
                }
            }
            VStack(alignment: .leading) {
                Text(title)
                    .lineLimit(1)
                    .foregroundColor(.primary)
                if !subtitle.isEmpty {
                    Text(subtitle)
                        .lineLimit(1)
                        .foregroundColor(.secondary)
                        .padding(.top, -4.0)
                }
            }
        }
    }
}



#Preview {
    AlbumsView()
}
