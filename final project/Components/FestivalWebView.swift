//
//  FestivalWebView.swift
//  final project
//
//  Created by 114-2Student04 on 2026/6/9.
//

import SwiftUI
import WebKit

struct FestivalWebView: UIViewRepresentable {
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        if urlString == "無" {
            return
        }
        
        let fixedURLString: String
        
        if urlString.hasPrefix("http://") || urlString.hasPrefix("https://") {
            fixedURLString = urlString
        } else {
            fixedURLString = "https://\(urlString)"
        }
        
        guard let url = URL(string: fixedURLString) else { return }
        webView.load(URLRequest(url: url))
    }
}
