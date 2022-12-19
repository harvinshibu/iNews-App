//
//  Article.swift
//  iOSNewsAPI
//
//  Created by Harvin Shibu on 08/12/22.
//

import Foundation

struct Article: Codable {
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}
