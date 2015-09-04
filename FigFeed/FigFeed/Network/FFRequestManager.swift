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

class FFRequestManager {
    static let urlString :String = "http://figaro.service.yagasp.com/articlesv6/w4ljb25vbWllVGVjaCAmIFdlYg==/"
    var dataManager: FFDataManager
    
    init(dataManager:FFDataManager){
        self.dataManager = dataManager
    }
    
    class func requestAllWithCompletionBlock(completionHandler handler: (NSArray!, NSError!) -> Void) {
        let url = NSURL(string:urlString)
        let urlRequest = NSURLRequest(URL: url!)
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            var error: NSError?
            var dict :NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as! NSDictionary            
            
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext!

            let articleList = dict["articles"] as! NSArray
            var articles = [] as NSMutableArray
            for articleDict in articleList {
                let entity =  NSEntityDescription.entityForName("FFArticle", inManagedObjectContext: managedContext)

                let article = NSManagedObject(entity: entity!,
                    insertIntoManagedObjectContext:managedContext)

                article.setValue(articleDict["author"], forKey: "author")
                article.setValue(articleDict["identifier"], forKey:"identifier")
                article.setValue(articleDict["content"], forKey: "content")
                article.setValue(articleDict["title"], forKey: "title")
                article.setValue(articleDict["subtitle"], forKey: "subtitle")
                article.setValue(articleDict.valueForKeyPath("thumb.link") as? String, forKey: "imageUrl")

                var dateString = articleDict["date"] as? NSNumber

                let date = NSDate(timeIntervalSince1970: dateString!.doubleValue)
                article.setValue(date, forKey: "date")
                
                articles.addObject(article)
                appDelegate.managedObjectContext?.insertObject(article)
            }
            

            appDelegate.saveContext()
            handler(articles, error)
        }
        
    }
}