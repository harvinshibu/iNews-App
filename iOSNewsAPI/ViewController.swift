//
//  ViewController.swift
//  iOSNewsAPI
//
//  Created by Harvin Shibu on 08/12/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var newsTable: UITableView!
    var newsVModel = NewsViewModel()
    var apiData = [Article]()
    var dataModel = [DataModel]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTable.delegate = self
        newsTable.dataSource = self
        
        newsVModel.loadData { data in
            self.apiData = data
            self.dataModel = self.apiData.map({ result in
                DataModel(author: result.author,title: result.title,url: result.url,urlToImage: result.urlToImage)
                
            })
            DispatchQueue.main.async {
                self.newsTable.reloadData()
            }
        }
    
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTable.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        cell.title.text = dataModel[indexPath.row].title
        cell.author.text = dataModel[indexPath.row].author
        
        if let data = dataModel[indexPath.row].urlData{
            cell.img1.image = UIImage(data: data)
        }
        else if let dataURL = dataModel[indexPath.row].urlToImage{
            
            URLSession.shared.dataTask(with: URL(string: dataURL)!){ data, response,error in
                guard let data = data, error == nil else {return}
                
                self.dataModel[indexPath.row].urlData = data

                DispatchQueue.main.async {
                    cell.img1.image = UIImage(data: data)
                }
            }.resume()
            
        }
        else{
            cell.img1.image = UIImage(named: "noImg")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailPage") as? DetailViewController
        if apiData[indexPath.row].url != nil{
            vc?.urlString = dataModel[indexPath.row].url
        }
        else{
            vc?.urlString = ""
        }
        navigationController?.pushViewController(vc!, animated: true)
    }
    
}

