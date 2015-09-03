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
        self.webview.loadHTMLString(article.content, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
