//
//  FFArticleCell.swift
//  FigFeed
//
//  Created by Titi on 9/3/15.
//  Copyright (c) 2015 funtek. All rights reserved.
//

import UIKit

class FFArticleCell: UITableViewCell {
    @IBOutlet var thumbnail: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    func setImageUrl(urlString:String){
        ImageLoader.sharedLoader.imageForUrl(urlString, completionHandler:{(image: UIImage?, url: String) in
            self.thumbnail.image = image
        })
    }
}
