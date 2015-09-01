//
//  FFRequestManager.swift
//  FigFeed
//
//  Created by Titi on 9/2/15.
//  Copyright (c) 2015 funtek. All rights reserved.
//

import Foundation

class FFRequestManager {
//    let urlString :String = "http://figaro.service.yagasp.com/articlesv6/w4ljb25vbWllVGVjaCAmIFdlYg==/"

    class func requestAllWithCompletionBlock(completionHandler handler: (NSArray!, NSError!) -> Void) {
        let url = NSURL(string:"http://figaro.service.yagasp.com/articlesv6/w4ljb25vbWllVGVjaCAmIFdlYg==/")
        let urlRequest = NSURLRequest(URL: url!)
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            var error: NSError?
            var dict :NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as! NSDictionary
//            handler(
        }
        
    }
}