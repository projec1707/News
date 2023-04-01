//
//  ContentView.swift
//  News
//  c7a2191be81c4eb4b41d7e9fb1ced092
//  Created by Roman Riepa on 28.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ArticleListView(articles: Article.previewData)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
