//
//  ContentView.swift
//  M5Learning
//
//  Created by Craig on 2/11/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        NavigationView {
            VStack (alignment: .leading)  {
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                ScrollView {
                    
                    LazyVStack {
                        
                        ForEach (model.modules) { module in
                            
                            VStack (spacing: 20) {
                                
                                NavigationLink(
                                    destination:
                                        ContentView()
                                        .onAppear(perform: {
                                            model.beginModule(module.id)
                                        }), label: {
                                            HomeCardView(image: module.content.image,
                                                         title: "Learn \(module.category.description)",
                                                         description: module.content.description,
                                                         count: "\(module.content.lessons.count)Lessons",
                                                         time: module.content.time)
                                        })
                                
                                
                                NavigationLink(
                                    destination:
                                        TestView()
                                            .onAppear(perform: {
                                                model.beginTest(module.id)
                                        }),
                                    label: {
                                        HomeCardView(image: module.test.image,
                                                     title: " \(module.category) Test",
                                                     description: module.test.description,
                                                     count: "\(module.test.questions.count) Questions",
                                                     time: module.test.time)
                                    })
                            }
                        }
                        .padding()
                        .accentColor(.black)
                    }
                }
                .navigationBarTitle(Text("Get Started"), displayMode: .inline)
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
