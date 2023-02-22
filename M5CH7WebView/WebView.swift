//
//  WebView.swift
//  M5CH7WebView
//
//  Created by Craig on 2/17/23.
//

import SwiftUI
import WebKit

/*
 from developer.apple.com
 UIViewRepresentable
 A wrapper for a UIKit view that you use to integrate that view into your SwiftUI view hierarchy.
 */
struct WebView: UIViewRepresentable {
    
    var url: URL
    
    // this function is one of two required functions
    func makeUIView(context: Context) -> some UIView {
        
        let webView = WKWebView()
        
        // Create the request variable and populate with the url passed into this function
        let request = URLRequest(url: url)
        
        // load the web page into this view
        webView.load(request)
        
        // return this view to content view
        return webView
    }
    
    // we are not using this function, but it is required in UIViewRepresentable
    func updateUIView(_ uiView: UIViewType, context: Context) {
        return
    }
}
