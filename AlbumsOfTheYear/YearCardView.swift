//
//  YearCardView.swift
//  AlbumsOfTheYear
//
//  Created by Chris Shirai on 12/8/25.
//
import SwiftUI

struct YearCardView: View {
    
    var year: Int = 2025
    var albums: [AlbumModel]
    
  var body: some View {
    VStack(alignment: .leading) {
      
      Text("\(String(year))")
        .font(.title)
        .fontWeight(.bold)
        .foregroundColor(.white)
        .frame(height: 35)
      
      Spacer()
      
      VStack {
          if albums.count > 0 {
              AlbumCell1(album: albums[0])
              Divider()
          }
          if albums.count > 1 {
              AlbumCell1(album: albums[1])
              Divider()
          }
          if albums.count > 2 {
              AlbumCell1(album: albums[2])
              Divider()
          }
          if albums.count > 3 {
              AlbumCell1(album: albums[3])
              Divider()
          }
     
      }
    }
    .padding()
    .frame(width: UIScreen.main.bounds.width - 32, height: UIScreen.main.bounds.width * 0.85)
    .background(Color(UIColor.secondarySystemGroupedBackground))
    .clipShape(RoundedRectangle(cornerRadius: 20))
  }
}


#Preview {
    YearCardView(year: 2025, albums: SampleData.albums )
        .preferredColorScheme(.dark) // Previews in dark mode
}
