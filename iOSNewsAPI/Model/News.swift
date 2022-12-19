//
//  News.swift
//  iOSNewsAPI
//
//  Created by Harvin Shibu on 08/12/22.
//

import Foundation

struct News: Codable {
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Article]?
}
