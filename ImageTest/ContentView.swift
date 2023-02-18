//
//  ContentView.swift
//  ImageTest
//
//  Created by 장세희 on 2023/02/04.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
//    @State private var profileImage = AsyncWebImage(image: nil, highlightedImage: UIImage(named: "person.fill"))
    
    @State private var imageUrl = ""
    var body: some View {
        VStack {
            Button {
                needToRefresh()
            } label: {
                Text("이미지 불러오기")
            }
        }
        
        AsyncImage(url: URL(string: imageUrl)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.gray)
        }
//        UIImage(data: profileImage)
        
    }
    
    // refresh delegate
    func needToRefresh() {
        // make 'serverData' by json decode 'data'
        imageUrl = "http://localhost:8080/image?value=compose"
        

    }
}
