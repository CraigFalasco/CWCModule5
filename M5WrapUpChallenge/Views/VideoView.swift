//
//  VideoView.swift
//  M5WrapUpChallenge
//
//  Created by Craig on 2/22/23.
//

import SwiftUI
import AVKit

struct VideoView: View {
    
    var inTitle: String = ""
    var inURL: String = ""

    var body: some View {
        VStack {
            Text(inTitle)
                .font(.largeTitle)
            
            let url = URL(string: inURL)
            VideoPlayer(player: AVPlayer(url: url!))
                .aspectRatio(16/9, contentMode: .fit)
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(inTitle: "Preview Title", inURL: "https://codewithchris.github.io/Module5Challenge/Lesson%201.mp4")
    }
}
