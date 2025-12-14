//
//  DetailView.swift
//  AlbumsOfTheYear
//
//  Created by Chris Shirai on 12/9/25.
//

import SwiftData
import SwiftUI
import CachedAsyncImage

struct DetailView: View {
    var year: Int
    //    var albums: [AlbumModel]
    @Query private var albums1: [AlbumModel]

    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context

    @State private var editMode = EditMode.inactive
    var isEditing: Bool { editMode.isEditing == true }

    var albums: [AlbumModel] {
        albums1
            .filter { $0.year == year }
            .sorted { $0.rank < $1.rank }
    }

    var body: some View {
        NavigationStack {
            VStack {

                Text("\(String(year))")
                    .font(.title)

                List {
                    ForEach(albums.sorted(by: { $0.rank < $1.rank })) { album in
                        HStack {

                            VStack {
                                Spacer()

                                CachedAsyncImage(url: album.artworkUrl) { image in
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

                            Text("\(album.rank)")
                                .padding(10)

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

                                ReSort()

                                print("Changes saved successfully!")
                            } catch {
                                print("Error saving changes: \(error)")
                            }
                        }
                    }
                    .moveDisabled(!isEditing)
                    .deleteDisabled(!isEditing)

                }
                .scrollContentBackground(.hidden)

                .toolbar {
                    EditButton()
                }
                .environment(\.editMode, $editMode)
            }
            .background(Color(UIColor.secondarySystemGroupedBackground))

        }
    }

    func ReSort() {

        let mutableItems = albums.sorted(by: { $0.rank < $1.rank })

        for (index, item) in mutableItems.enumerated() {
            item.rank = index + 1
        }
    }

    func move(from source: IndexSet, to destination: Int) {

        // Create a mutable copy of the items array to manipulate the order
        var mutableItems = albums.sorted(by: { $0.rank < $1.rank })

        // Move the items in the mutable array
        mutableItems.move(fromOffsets: source, toOffset: destination)

        // Update the sortIndex of all items based on their new positions
        for (index, item) in mutableItems.enumerated() {
            item.rank = index + 1
        }
    }
}

//#Preview {
//    DetailView(year: 2025)
//        .preferredColorScheme(.dark)
//}

#Preview { @MainActor in
    DetailView(year: 2025)
        .modelContainer(previewContainer)
        .preferredColorScheme(.dark)  // Previews in dark mode
}
