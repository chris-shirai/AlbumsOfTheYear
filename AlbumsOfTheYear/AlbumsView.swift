//
//  TestPage1.swift
//  AlbumsOfTheYear
//
//  Created by Chris Shirai on 12/6/25.
//

import SwiftData
import SwiftUI

struct AlbumsView: View {

    @Environment(\.modelContext) private var context

    @Query private var albums: [AlbumModel]

    @State private var startingYear: Int = 2023
    @State private var endingYear: Int = 2025


    func GetAlbums(year: Int) -> [AlbumModel] {
        albums.filter { $0.year == year }
    }

    var body: some View {

        VStack {
            ForEach(startingYear...endingYear, id: \.self) { number in

                Text("\(String(number))")

                ForEach(GetAlbums(year: number)) { album in

                    HStack {
                        VStack {
                            Spacer()

                            AsyncImage(url: album.artworkUrl) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 56)
                                    .cornerRadius(6)
                            } placeholder: {
                                ProgressView()
                            }

                            Spacer()
                        }

                        VStack(alignment: .leading) {
                            Text("\(album.name) - \(String(album.year!))")
                                .lineLimit(1)
                                .foregroundColor(.primary)

                            Text(album.artist)
                                .lineLimit(1)
                                .foregroundColor(.secondary)
                                .padding(.top, -4.0)

                        }
                    }

                }
            }
        }

        //        List {
        //
        //            ForEach(albums) { album in
        //                HStack {
        //
        //                    VStack {
        //                        Spacer()
        //
        //                        AsyncImage(url: album.artworkUrl) { image in
        //                            image
        //                                .resizable()
        //                                .scaledToFit()
        //                                .frame(width: 56)
        //                                .cornerRadius(6)
        //                        } placeholder: {
        //                            ProgressView()
        //                        }
        //
        //                        Spacer()
        //                    }
        //
        //                    VStack(alignment: .leading) {
        //                        Text("\(album.name) - \(String(album.year!))")
        //                            .lineLimit(1)
        //                            .foregroundColor(.primary)
        //
        //                        Text(album.artist)
        //                            .lineLimit(1)
        //                            .foregroundColor(.secondary)
        //                            .padding(.top, -4.0)
        //
        //                    }
        //                }
        //            }
        //
        //            .onDelete { indexSet in
        //                for index in indexSet {
        //                    context.delete(albums[index])
        //                    do {
        //                        try context.save()
        //                        print("Changes saved successfully!")
        //                    } catch {
        //                        print("Error saving changes: \(error)")
        //                    }
        //                }
        //            }
        //
        //        }
    }

}

#Preview { @MainActor in
    AlbumsView()
        .modelContainer(previewConainer)
}
