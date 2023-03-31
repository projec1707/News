//
//  NewsAPIModel.swift
//  News
//
//  Created by Roman Riepa on 28.03.2023.
//

import Foundation


// MARK: - QuoteModel
struct NewsAPIModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [ArticleAPI2]
    
    static let newsAPIModel = NewsAPIModel(status: "ok", totalResults: 3, articles: [
        ArticleAPI2(source: SourceAPI2(id: nil, name: "CNN"), author: "John Smith", title: "Breaking News", description: "This is a breaking news article", url: "https://www.cnn.com", urlToImage: "https://www.cnn.com/image.jpg", publishedAt: Date(), content: "Lorem ipsum dolor sit amet."),
        ArticleAPI2(source: SourceAPI2(id: nil, name: "BBC"), author: "Jane Doe", title: "World News", description: "This is a world news article", url: "https://www.bbc.com", urlToImage: "https://www.bbc.com/image.jpg", publishedAt: Date(), content: "Lorem ipsum dolor sit amet."),
        ArticleAPI2(source: SourceAPI2(id: nil, name: "ABC"), author: "Bob Smith", title: "Local News", description: "This is a local news article", url: "https://www.abc.com", urlToImage: "https://www.abc.com/image.jpg", publishedAt: Date(), content: "Lorem ipsum dolor sit amet.")
        ])
    
}

// MARK: - Article
struct ArticleAPI2: Codable {
    let source: SourceAPI2
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String
    
    static func <(lhs: ArticleAPI2, rhs: ArticleAPI2) -> Bool {
        lhs.publishedAt > rhs.publishedAt
    }
    
    static let example = ArticleAPI2(source: SourceAPI2(id: "abc-news", name: "ABC News"),
                                     author: "MATT O'BRIEN AP Technology Writer",
                                     title: "Twitter celebs balk at paying Elon Musk for blue check mark",
                                     description: "William Shatner, Monica Lewinsky and other prolific Twitter commentators — some household names, others little-known journalists — could soon be losing the blue check marks that helped verify their identity on the social media platform",
                                     url: "https://abcnews.go.com/Business/wireStory/twitter-celebs-balk-paying-elon-musk-blue-check-98155243",
                                     urlToImage: "https://s.abcnews.com/images/US/wirestory_2a9fbe4ea805763f50d4de2c417ce4ff_16x9_992.jpg",
                                     publishedAt: .now,
                                     content: "William Shatner, Monica Lewinsky and other prolific Twitter commentators some household names, others little-known journalists could soon be losing the blue check marks that helped verify their ident… [+2646 chars]")
    
}

// MARK: - Source
struct SourceAPI2: Codable, Identifiable {
    let id: String?
    let name: String
    
    static let exampleSource = SourceAPI2(id: "abc-news", name: "ABC News")
}


