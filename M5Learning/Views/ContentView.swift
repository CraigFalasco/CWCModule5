//
//  ContentView.swift
//  M5Learning
//
//  Created by Craig on 2/14/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView {
            
            LazyVStack (alignment: .leading) {
                
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count, id: \.self) { index in
                        let lesson = model.currentModule!.content.lessons[index]
                        
                        ZStack (alignment: .leading) {
                            
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .frame(height: 66)
                            
                            HStack (spacing: 30) {
                                Text(String(index + 1))
                                    .font(.largeTitle)
                                
                                VStack (alignment: .leading) {
                                    Text(lesson.title)
                                        .bold()
                                    Text(lesson.duration)
                                }
                            }
                            .padding()
                        }
                        .padding(.bottom, 5)
                    }
                }
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}
