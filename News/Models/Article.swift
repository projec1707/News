//
// https://app.quicktype.io/
//
//  Article.swift
//  News
//
//  Created by Roman Riepa on 28.03.2023.
//

import Foundation

fileprivate let relativeDateTimeFormatter = RelativeDateTimeFormatter()

struct Article {
    let source: Source
    
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String
    
    var authorText: String {
        author ?? ""
    }
    
    var descriptionText: String {
        description ?? ""
    }
    
    var captionText: String {
        "\(source.name) · \(relativeDateTimeFormatter.localizedString(for: publishedAt, relativeTo: Date()))"
    }
    
    var artiocleURL: URL {
        URL(string: url)!
    }
    
    var imageURL: URL? {
        guard let urlToImage = urlToImage else {
            return nil
        }
        return URL(string: urlToImage)
    }
}

extension Article: Codable{}
extension Article: Equatable {}
extension Article: Identifiable {
    var id: String { url }
}

extension Article {
    
    static var previewData: [Article] {
        let previewDataURL = Bundle.main.url(forResource: "news", withExtension: "json")!
        let data = try! Data(contentsOf: previewDataURL)
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        let apiResponse = try! jsonDecoder.decode(NewsAPIResponse.self, from: data)
        return apiResponse.articles ?? []
        
    }
    
}


struct Source {
    let name: String
}

extension Source: Codable {}
extension Source: Equatable {}
