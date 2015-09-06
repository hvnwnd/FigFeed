//
//  FFArticleViewModel.swift
//  FigFeed
//
//  Created by CHEN Bin on 04/09/15.
//  Copyright (c) 2015 funtek. All rights reserved.
//

import Foundation
import UIKit


protocol FFArticleViewModelDelegate {
    func imageDidSet(viewModel:FFArticleViewModel)
}

class FFArticleViewModel {
    var title:String?
    var image:UIImage?
    var isVideo:Bool = false
    var hasRead:Bool = false
    
    var delegate:FFArticleViewModelDelegate! = nil
    
    init(article:FFArticle)
    {
        title = article.title

        if let url = article.valueForKey("videoUrl") {
            isVideo = !url.isEmpty;

        }
        println(article.valueForKey("videoUrl"))
        hasRead = article.hasRead.boolValue
        
        ImageLoader.sharedLoader.imageForUrl(article.thumbnailUrl()!, completionHandler:{(image: UIImage?, url: String) in
            self.image = image
            self.delegate.imageDidSet(self)
        })
    }
}