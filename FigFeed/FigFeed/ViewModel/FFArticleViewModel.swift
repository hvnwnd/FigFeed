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
    var isFirst:Bool
    
    var delegate:FFArticleViewModelDelegate! = nil
    
    init(article:FFArticle, isFirstArticle:Bool)
    {
        title = article.title
        isFirst = isFirstArticle
        isVideo = (nil != article.valueForKey("videoUrl"))
        hasRead = article.hasRead.boolValue
        
        ImageLoader.sharedLoader.imageForUrl(isFirstArticle ? article.articleImageUrl()! : article.thumbnailUrl()!, completionHandler:{(image: UIImage?, url: String) in
            self.image = image
            self.delegate.imageDidSet(self)
        })
    }
}