//
//  TestPage1.swift
//  AlbumsOfTheYear
//
//  Created by Chris Shirai on 12/6/25.
//

import SwiftData
import SwiftUI

struct TestPage1: View {

    @Environment(\.modelContext) private var context

    @Query private var albums: [AlbumModel]

    var body: some View {
        List {
            //            HStack{
            //                AsyncImage(url: album.artworkUrl)
            //                VStack{
            //                    Text(album.name)
            //                    Text(album.artist)
            //                }
            //
            //            }

            ForEach(albums) { album in
                HStack {

                    VStack {
                        Spacer()
                
                        AsyncImage(url: album.artworkUrl) { image in
                            image
                                .resizable()  // Makes the image resizable
                                .scaledToFit()  // Or .scaledToFill() to control aspect ratio behavior
                                .frame(width: 56)  // Sets the desired width
                                .cornerRadius(6)
                        } placeholder: {
                            ProgressView()  // Placeholder view while the image loads
                        }

                        Spacer()
                    }

                    VStack(alignment: .leading) {
                        Text("\(album.name) - \(album.year)")
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

//#Preview {
//    TestPage1()
//}
