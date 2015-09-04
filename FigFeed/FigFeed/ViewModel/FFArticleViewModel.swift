//
//  FFArticleViewModel.swift
//  FigFeed
//
//  Created by CHEN Bin on 04/09/15.
//  Copyright (c) 2015 funtek. All rights reserved.
//

import Foundation
import UIKit

class FFArticleViewModel {
    var title:String?
    var image:UIImage?
    
    
    init(article:FFArticle)
    {
        title = article.title
        
        ImageLoader.sharedLoader.imageForUrl(article.thumbnailUrl()!, completionHandler:{(image: UIImage?, url: String) in
            self.image = image
        })
    }
}