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
            
            Text("\(album.rank)")
                .padding(10)

            VStack(alignment: .leading) {
                Text("\(album.name)")
                    .foregroundColor(.primary)
                
                Text("\(album.artist)")
//                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .foregroundColor(.white)

            Spacer()

        }
    }
}



#Preview {
    AlbumCell1(album: SampleData.albums4[0])
        .preferredColorScheme(.dark)  // Previews in dark mode

}
