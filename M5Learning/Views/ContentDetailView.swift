//
//  ContentDetailView.swift
//  M5Learning
//
//  Created by Craig on 2/14/23.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostURL + (lesson?.video ?? ""))
        
        VStack {
            
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            // Description
            CodeTextView()
            
            // Button for next lesson, if there is a next lesson
            if model.hasNextLesson() {

                    Button(action: {
                        model.nextLesson()
                    }, label: {
                        
                        ZStack {
                            
                            Rectangle()
                                .frame(height: 48)
                                .foregroundColor(Color.green)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        
                        Text("Next lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                                .foregroundColor(Color.white)
                                .bold()
                            
                        }
                })
            }
        }
        .padding()
        .navigationBarTitle(Text(lesson?.title ?? ""), displayMode: .inline)
    }
}

