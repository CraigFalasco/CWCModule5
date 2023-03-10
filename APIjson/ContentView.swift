//
//  ContentView.swift
//  APIjson
//
//  Created by Craig on 2/22/23.
//
// from: https://medium.com/swlh/fetch-data-from-apis-in-swiftui-74b4b50f20e9
//

import SwiftUI

struct ContentView: View {
    
    @State var results = [TaskEntry]()
  
    var body: some View {
        List(results, id: \.id) { item in
            VStack(alignment: .leading) {
                Text(item.title)
            }
        }.onAppear(perform: loadData)
    }
    
  
    func loadData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode([TaskEntry].self, from: data) {
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
