//
//  ContentView.swift
//  M5WrapUpChallenge
//
//  Created by Craig on 2/22/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var results = [Video]()
    
    var body: some View {
        NavigationView {
            List(results, id: \.id) { item in
                
                VStack(alignment: .leading) {
                    
                    NavigationLink(destination: VideoView(inTitle: item.title, inURL: item.url)) {
                        
                        Text(item.title)
                    }
                }
                
            }.onAppear(perform: loadData)
        }
    }
        
        func loadData() {
            guard let url = URL(string: "https://codewithchris.github.io/Module5Challenge/Data.json") else {
                print("Your API end point is Invalid")
                return
            }
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    if let response = try? JSONDecoder().decode([Video].self, from: data) {
                        DispatchQueue.main.async {
                            self.results = response
                        }
                        return
                    }
                }
            }.resume()
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}