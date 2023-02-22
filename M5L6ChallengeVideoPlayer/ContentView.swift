//
//  ContentView.swift
//  M5L6ChallengeVideoPlayer
//
//  Created by Craig on 2/15/23.
//

import SwiftUI
import AVKit

struct ContentView: View {
    let url = URL(fileURLWithPath: Bundle.main.path(forResource: "dogsAtPark", ofType: "MOV")!)
    let videoRatio: CGFloat = 1080 / 1920
    
    var body: some View {
        GeometryReader { geo in
            VStack (alignment: .leading) {
                
                VideoPlayer(player: AVPlayer(url: url))
                    .frame(height: geo.size.width * videoRatio)
                
                Text("Description")
                    .font(.largeTitle)
                
                ScrollView {
                    Text(descriptionText)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
