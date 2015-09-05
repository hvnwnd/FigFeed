//
//  FFRequestManager.swift
//  FigFeed
//
//  Created by Titi on 9/2/15.
//  Copyright (c) 2015 funtek. All rights reserved.
//

import Foundation
import UIKit
import CoreData

 let kServiceUrl :String = "http://figaro.service.yagasp.com/articlesv6/w4ljb25vbWllVGVjaCAmIFdlYg==/"

class FFRequestManager {
    var dataManager: FFDataManager
    
    init(dataManager:FFDataManager){
        self.dataManager = dataManager
    }
    
    func requestAllWithCompletionBlock(completionHandler handler: (NSArray!, NSError!) -> Void) {
        let url = NSURL(string:kServiceUrl)
        let urlRequest = NSURLRequest(URL: url!)
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            var error: NSError?
            var dict :NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as! NSDictionary            
            let articleList = dict["articles"] as! NSArray

            self.dataManager.insert(articleList)
            
            let articles = self.dataManager.fetch()
            handler(articles, error)
        }
        
    }
}