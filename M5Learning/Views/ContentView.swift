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
        
        NavigationView {
            ScrollView {
                
                LazyVStack (alignment: .leading) {
                    
                    if model.currentModule != nil {
                        
                        ForEach(0..<model.currentModule!.content.lessons.count, id: \.self) { index in
                            
                            NavigationLink(
                                destination: ContentDetailView()
                                    .onAppear(perform: {
                                        model.beginLesson(index)
                                    }),
                                label: {
                                    ContentCardView(index: index)
                                })
                        }
                    }
                }
                .accentColor(.black)
                .padding()
                .navigationTitle("Learn \(model.currentModule?.category ?? "")")
            }
        }
        .navigationViewStyle(.stack)
    }
}
