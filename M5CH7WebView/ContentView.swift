//
//  ContentView.swift
//  M5CH7WebView
//
//  Created by Craig on 2/17/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WebView(url: URL(string: "https://www.npr.org")!)
    /*
     We use a separate view "WebView" because it has to use the WebKit framework and UIViewRepresentable protocol, which allows us to use WebKit within SwiftUI
     */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
