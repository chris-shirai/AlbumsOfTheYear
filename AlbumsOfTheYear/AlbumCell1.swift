//
//  AppSmall2Block.swift
//  AlbumsOfTheYear
//
//  Created by Chris Shirai on 12/8/25.
//

import SwiftUI

struct AlbumCell1: View {

    var album: AlbumModel

    var body: some View {
        HStack {
            AsyncImage(url: album.artworkUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 56)
                    .cornerRadius(12)
            } placeholder: {
                ProgressView()
            }

            VStack(alignment: .leading) {
                Text("\(album.name)")
                    .bold()

                Text("\(album.artist)")
                    .font(.subheadline)
            }
            .foregroundColor(.white)

            Spacer()

        }
    }
}

#Preview {
    AlbumCell1(album: SampleData.albums[0])
}
