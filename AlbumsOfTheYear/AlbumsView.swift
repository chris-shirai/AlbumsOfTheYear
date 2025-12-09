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
    @Namespace var namespace

    func GetAlbums(year: Int) -> [AlbumModel] {
        albums.filter { $0.year == year }
    }

    var body: some View {

        NavigationStack {
            ScrollView {
                ForEach((startingYear...endingYear).reversed(), id: \.self) { number in

                    NavigationLink {
                        DetailView(albums: GetAlbums(year: number))
                            .navigationTransition(
                                .zoom(sourceID: number, in: namespace)
                            )
                            .toolbarVisibility(.hidden, for: .navigationBar)

                    } label: {
                        YearCardView(
                            year: number,
                            albums: GetAlbums(year: number)
                        )
                        .matchedTransitionSource(id: number, in: namespace)
                    }
                    .padding()

                }
            }
        }
    }

}

struct DetailView: View {
    var albums: [AlbumModel]
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context

    var body: some View {
        List {
            ForEach(albums) { album in
                HStack {

                    VStack {
                        Spacer()

                        AsyncImage(url: album.artworkUrl) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 56)
                                .cornerRadius(12)
                        } placeholder: {
                            ProgressView()
                        }

                        Spacer()
                    }

                    VStack(alignment: .leading) {
                        Text("\(album.name)")
                            .lineLimit(1)
                            .foregroundColor(.primary)

                        Text(album.artist)
                            .lineLimit(1)
                            .foregroundColor(.secondary)
                            .padding(.top, -4.0)

                    }
                }
            }
            .onDelete { indexSet in
                for index in indexSet {
                    context.delete(albums[index])
                    do {
                        try context.save()
                        print("Changes saved successfully!")
                    } catch {
                        print("Error saving changes: \(error)")
                    }
                }
            }
        }
    }
}

#Preview { @MainActor in
    AlbumsView()
        .modelContainer(previewConainer)
}
