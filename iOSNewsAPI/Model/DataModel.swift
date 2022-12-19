//
//  DataModel.swift
//  iOSNewsAPI
//
//  Created by Harvin Shibu on 11/12/22.
//

import Foundation

struct DataModel {
    var author: String?
    var title: String?
    var url: String?
    var urlToImage: String?
    var urlData: Data?
    
    init(author: String? = nil, title: String? = nil, url: String? = nil, urlToImage: String? = nil) {
        self.author = author
        self.title = title
        self.url = url
        self.urlToImage = urlToImage
    }
}
