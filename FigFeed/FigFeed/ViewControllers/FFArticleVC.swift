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
//        let url = NSBundle.mainBundle().URLForResource("Test", withExtension:"html")
//        let myRequest = NSURLRequest(URL: url!);
//        webview.loadRequest(myRequest);
        self.webview.loadHTMLString(article.content, baseURL: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
