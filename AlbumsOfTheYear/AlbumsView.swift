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
        return albums
            .filter { $0.year == year }
            .sorted {  $0.rank < $1.rank }
    }

    @State private var showTabBar = true

    func deleteAllInstancesOfModel(modelContext: ModelContext) {
        do {
            try modelContext.delete(model: AlbumModel.self)
            do {
                try modelContext.save()
            }
        } catch {
            print(
                "Failed to delete all instances of YourModelName: \(error.localizedDescription)"
            )
        }
    }

    var body: some View {

        NavigationStack {
            ScrollView {
                ForEach((startingYear...endingYear).reversed(), id: \.self) {
                    number in

                    NavigationLink {
                        DetailView(
                            year: number,
                            albums: GetAlbums(year: number)
                        )
                        .navigationTransition(
                            .zoom(sourceID: number, in: namespace)
                        )
                        //                            .toolbar(showTabBar ? .visible : .hidden, for: .tabBar)
                        //                            .onAppear {
                        //                                      // Example: Hide tab bar after a delay
                        //                                      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        //                                          withAnimation {
                        //                                              showTabBar = false
                        //                                          }
                        //                                      }
                        //                                  }
                        //                            .toolbarVisibility(.hidden, for: .navigationBar)

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
            .onAppear {
                //                deleteAllInstancesOfModel(modelContext: context)
            }
        }
    }

}

#Preview { @MainActor in
    AlbumsView()
        .modelContainer(previewConainer)
        .preferredColorScheme(.dark)  // Previews in dark mode
}
