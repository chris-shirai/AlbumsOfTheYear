//
//  DetailView.swift
//  AlbumsOfTheYear
//
//  Created by Chris Shirai on 12/9/25.
//

import SwiftData
import SwiftUI

struct DetailView: View {
    var year: Int
    var albums: [AlbumModel]
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context

    @State private var editMode = EditMode.inactive

    
    var body: some View {
        NavigationStack {
            VStack {

                Text("\(String(year))")
                    .font(.title)

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
                    .onMove(perform: move)
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
                .toolbar {
                           EditButton()
                       }
                .environment(\.editMode, $editMode)

            }

        }
        
    }
    
    func move(from source: IndexSet, to destination: Int) {
//          items.move(fromOffsets: source, toOffset: destination)
      }
}

#Preview {
    DetailView(year: 2025, albums: SampleData.albums)
        .preferredColorScheme(.dark)
}
