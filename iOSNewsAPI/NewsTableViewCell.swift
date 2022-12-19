//
//  NewsTableViewCell.swift
//  iOSNewsAPI
//
//  Created by Harvin Shibu on 08/12/22.
//

import UIKit
import SwiftGifOrigin

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var img1: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        img1.layer.masksToBounds = true
        img1.layer.cornerRadius = 10
        img1.layer.borderWidth = 0.3
        let borderColor: UIColor = .black
        img1.layer.borderColor = borderColor.cgColor
        img1.image = UIImage.gif(asset: "loadGif")
        
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
