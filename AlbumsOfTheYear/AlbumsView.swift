//
//  AlbumsView.swift
//  AlbumsOfTheYear
//
//  Created by Chris Shirai on 12/4/25.
//

import SwiftUI

struct AlbumsView: View {
    
    let columns: [GridItem] = [GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            
            
            LazyVGrid(columns: columns){
                FrameworkTitleView(name: "test", imageName: "Test")
                FrameworkTitleView(name: "test", imageName: "Test")
                FrameworkTitleView(name: "test", imageName: "Test")
                FrameworkTitleView(name: "test", imageName: "Test")
                FrameworkTitleView(name: "test", imageName: "Test")
                FrameworkTitleView(name: "test", imageName: "Test")
                FrameworkTitleView(name: "test", imageName: "Test")
                FrameworkTitleView(name: "test", imageName: "Test")
                FrameworkTitleView(name: "test", imageName: "Test")
       
            }
        }
    }
}

struct FrameworkTitleView: View {
    let name: String
    let imageName: String
    
    
    var body: some View {
        VStack {
                    
            AsyncImage(url: URL(string: "https://fujiframe.com/assets/images/_3000x2000_fit_center-center_85_none/1003/XH2S5547-Fujifilm-Fujinon-XF70-300mmF4-5.6-R-LM-OIS-WR.webp")) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 128, height: 128)
            .clipShape(.rect(cornerRadius: 25))
            
            Text(name)
        }
    }
    
}

#Preview {
    AlbumsView()
}
