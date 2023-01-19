//
//  UserDetailsView.swift
//  GithubUser
//
//  Created by Azizur Rahman on 19/1/23.
//

import SwiftUI
import WebKit

struct UserDetailsView: View {
    //@State private var showLoginForm: Bool = true
    @State var url = "https://www.google.com"

    var body: some View {
        
        WebView(url: url)
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView()
    }
}
extension WKWebView {
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}

struct WebView : UIViewRepresentable {
    var url: String

    func makeUIView(context: Context) -> WKWebView  {
        let webview = WKWebView()
        
        return webview
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(url)
    }
}
