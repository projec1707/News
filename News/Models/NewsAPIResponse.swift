//
//  NewsAPIResponse.swift
//  News
//
//  Created by Roman Riepa on 28.03.2023.
//

import Foundation

struct NewsAPIResponse: Decodable {
    
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String?
    let message: String?
    
}
