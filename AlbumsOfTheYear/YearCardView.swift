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
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(3)

            Spacer()

            VStack {
                if albums.count > 0 {
                    AlbumCell1(album: albums[0])

                } else {
                    Label("Add an album", systemImage: "plus")
                        .foregroundColor(Color(.blue))
                        .padding(.bottom, 10)
                }

                if albums.count > 1 {
                    Divider()
                    AlbumCell1(album: albums[1])

                }
                if albums.count > 2 {
                    Divider()
                    AlbumCell1(album: albums[2])

                }
                if albums.count > 3 {
                    Divider()
                    AlbumCell1(album: albums[3])

                }
                if albums.count > 4 {
                    Divider()
                    AlbumCell1(album: albums[4])
                        .overlay(
                            LinearGradient(
                                colors: [
                                    .clear,
                                    Color(
                                        UIColor.secondarySystemGroupedBackground
                                    ),
                                ],  // Starts clear at the top, fades to black at the bottom
                                startPoint: .top,
                                endPoint: .bottom
                                    //                                  endPoint: UnitPoint(x: 0.5, y: 1)
                            )
                        )

                }

            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width - 32, height: GetHeight())
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    

    private func GetHeight() -> CGFloat {

        let baseHeight = CGFloat(100)

        let itemHeight = 50
        let dividerHeight = 20

        switch albums.count {
        case 0:
            return baseHeight + 20
        case 1...4:
            return baseHeight + CGFloat(albums.count * itemHeight)
                + CGFloat((albums.count - 1) * dividerHeight)
        case _ where albums.count > 4:
            return baseHeight + CGFloat(5 * itemHeight)
            + CGFloat((5 - 1) * dividerHeight)
        default:
            return baseHeight
        }
    }
}


#Preview {
    YearCardView(year: 2020, albums: SampleData.albums5)
        .preferredColorScheme(.dark)  // Previews in dark mode
}
