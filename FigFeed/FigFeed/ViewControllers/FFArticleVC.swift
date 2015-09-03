//
//  FFArticleVC.swift
//  FigFeed
//
//  Created by CHEN Bin on 01/09/15.
//  Copyright (c) 2015 funtek. All rights reserved.
//

import UIKit

class FFArticleVC: UIViewController {

    @IBOutlet weak var webview : UIWebView!
    var article : FFArticle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let htmlString = FFHtmlGenerator.generateHtml(article.title, imageUrl:article.articleImageUrl()!, subtitle: article.subtitle, content: article.content)
        self.webview.loadHTMLString(htmlString, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
