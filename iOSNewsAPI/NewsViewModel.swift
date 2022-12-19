//
//  NewsViewModel.swift
//  iOSNewsAPI
//
//  Created by Harvin Shibu on 08/12/22.
//

import Foundation
import UIKit

class NewsViewModel{
    
    let urlString: String
    
    init(){
        urlString = "https://newsapi.org/v2/everything?q=apple&from=2022-12-07&to=2022-12-07&sortBy=popularity&apiKey=ca915e55877b45b4bbe80af16f32ff0d"
    }
    
    func loadData(handler: @escaping ([Article]) -> Void){
        let urlAPI = URL(string: urlString)
        var newsFeed: News?
        let session = URLSession.shared
        DispatchQueue.global(qos: .userInitiated).async {
            let task = session.dataTask(with: urlAPI!){(data, response, error) in
                if data != nil && error == nil{
                    let decoder = JSONDecoder()
                    do{
                        newsFeed = try decoder.decode(News.self, from: data!)
                        handler((newsFeed?.articles)!)
                    }
                    catch{
                        print("Error parsing JSON\n\(error)")
                    }
                }
            }
            task.resume()
        }
        
    }
    

    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

