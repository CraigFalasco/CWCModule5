//
//  ContentView.swift
//  M5WrapUpChallenge
//
//  Created by Craig on 2/22/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var results = [Video]()
    @State var searchText = ""
    
    var body: some View {
        
        NavigationStack {
            
            VStack(alignment: .leading) {
                
                Text("CWC Videos")
                    .font(.largeTitle)
                    .padding(.leading)
                
                List(searchResults, id: \.id) { item in
                    
                    NavigationLink(destination: VideoView(inTitle: item.title, inURL: item.url)) {
                        
                        Text(item.title)
                    }
                }
                
            }.onAppear(perform: loadData)
        }
        .searchable(text: $searchText)
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
    
    var searchResults: [Video] {
        if searchText.isEmpty {
            return results
        }
        else {
            return results.filter { $0.title.contains(searchText)}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
