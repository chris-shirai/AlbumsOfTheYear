//
//  AlbumsView.swift
//  AlbumsOfTheYear
//
//  Created by Chris Shirai on 12/4/25.
//

import MusicKit
import SwiftData
import SwiftUI

struct SearchView: View {

    @Environment(\.modelContext) private var context
    @State private var searchTerm = ""
    @State private var albums: MusicItemCollection<Album> = []

    
    @Query private var albums1: [AlbumModel]
    
    func GetAlbums(year: Int) -> [AlbumModel] {
        albums1.filter { $0.year == year }
    }
    
    func IsAlbumAdded(id: String) -> Bool {
        
        return  (albums1.filter { $0.id == id }).count > 0
        }
    
    var body: some View {

        rootView
            .onChange(of: searchTerm) { oldValue, newValue in
                requestUpdatedSearchResults(for: newValue)
            }
    }

    @MainActor
    private func apply(
        _ searchResponse: MusicCatalogSearchResponse,
        for searchTerm: String
    ) {
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
                    var searchRequest = MusicCatalogSearchRequest(
                        term: searchTerm,
                        types: [Album.self]
                    )
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
            navigationViewContents
                .navigationTitle("Search")
        }
        .searchable(text: $searchTerm, prompt: "Albums")
    }

    private var navigationViewContents: some View {
        VStack {
            searchResultsList
                .animation(.default, value: albums)

        }
    }
    
    @State private var isShowingAlert = false
    @State private var selectedAlbumYear: Int?
    @State private var selectedAlbumTitle: String = ""

    private var searchResultsList: some View {
        List(albums) { album in
            AlbumCell(album: album, albumExists: IsAlbumAdded(id: album.id.rawValue), addAlbum: {
                 selectedAlbumYear = getYearFromDate(album.releaseDate)
                selectedAlbumTitle = album.title
                
                let maxRank = GetAlbums(year: selectedAlbumYear ?? 0).map { $0.rank }.max()
                
//                print("album ID: \(album.id.rawValue)" )
                
                let selectedAlbum = AlbumModel(
                    musicItemID: album.id.rawValue,
                    name: album.title,
                    artist: album.artistName,
                    artworkUrl: album.artwork?.url(width: 56, height: 56),
                    releaseDate: album.releaseDate,
                    rank: (maxRank ?? 0) + 1
                )
                context.insert(selectedAlbum)
                
                isShowingAlert = true
            })
         
        }
        .alert(isPresented: $isShowingAlert){
            Alert(title: Text("Added album to your collection!"), message: Text(" \(selectedAlbumTitle)  \(String(selectedAlbumYear ?? 0))"), dismissButton: .default(Text("Ok")))
        }
        .sensoryFeedback(.success, trigger: isShowingAlert, condition: { oldValue, newValue in
            // This condition ensures the haptic plays only when 'isShowingAlert' becomes true.
            return newValue == true
        })
    }
    
}



struct AlbumCell: View {


    let album: Album
    var albumExists: Bool = false
    
    let addAlbum: () -> Void

    var body: some View {
        //        NavigationLink(destination: AlbumDetailView(album)) {
        //            MusicItemCell(
        //                artwork: album.artwork,
        //                title: album.title,
        //                subtitle: album.artistName
        //            )
        //        }

        HStack {
            MusicItemCell(
                artwork: album.artwork,
                albumTitle: album.title,
                artistName: album.artistName,
                year: getYearFromDate(album.releaseDate)
            )
            .onAppear {
                print("\(album.title) - \(album.artwork?.url(width: 100, height: 100))")
            }
            
            Spacer()
            
            if albumExists {
                Image(systemName: "checkmark") // Icon when toggled ON
                    .font(.title2)
                    .padding(.trailing, 5)
                    .foregroundColor(.gray)
                
            } else {
                Button(action: {
                    addAlbum()
                  }) {
                    
                          Image(systemName: "plus.circle") // Icon when toggled ON
                              .font(.title)
                      
                  }
                  .onTapGesture { }
                  .buttonStyle(BorderlessButtonStyle())
            }
        }

    }
}

struct MusicItemCell: View {

    let artwork: Artwork?
    let albumTitle: String
    let artistName: String
    let year: Int?


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
                Text(albumTitle)
                    .lineLimit(1)
                    .foregroundColor(.primary)
                if !artistName.isEmpty {
                    Text("\(artistName) -  \(year != nil ? String(year!) : "")")
                        .lineLimit(1)
                        .foregroundColor(.secondary)
                        .padding(.top, -4.0)
                }
            }

        }
    }
}

//#Preview {
//    MusicItemCell(artwork: nil, title: "Test", subtitle: "Artist")
//}
