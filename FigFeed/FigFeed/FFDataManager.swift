//
//  FFDataManager.swift
//  FigFeed
//
//  Created by Titi on 9/4/15.
//  Copyright (c) 2015 funtek. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class FFDataManager {
    var fetchedArticleId = [String]()
    
    var appDelegate : AppDelegate {
        get {
            return UIApplication.sharedApplication().delegate as! AppDelegate
        }
    }
    var context : NSManagedObjectContext {
        get {
            return appDelegate.managedObjectContext!
        }
    }
        
    func insert(articleList:NSArray){
        var articles = [FFArticle]()
        for articleDict in articleList {
            let id = parseIdentifier(articleDict as! NSDictionary)
            if !contains(fetchedArticleId, id) {
                let article = NSEntityDescription.insertNewObjectForEntityForName("FFArticle", inManagedObjectContext: context) as! FFArticle;
                article.parseDict(articleDict as! [String : AnyObject])
                articles.append(article)
            }
        }
        
        appDelegate.saveContext()

    }
    
    func fetch() -> [AnyObject]? {
        let error = NSErrorPointer()
        var fetchRequest = NSFetchRequest(entityName: "FFArticle")
        var result = context.executeFetchRequest(fetchRequest, error: error) as? [FFArticle]
        saveFetechArticleId(result)
        return result
    }
    
    func setHasReadForId(article:FFArticle){
        article.hasRead = true;
        appDelegate.saveContext()
    }
    
    private func saveFetechArticleId(result:[FFArticle]?){
        var id = [String]()
        
        if let tmp = result {
            for article in tmp {
                id.append(article.identifier)
            }
        }
        
        fetchedArticleId = id

    }
    
    private func parseIdentifier(articleDict: NSDictionary) -> String{
        if let id = articleDict["_id"] as? String
        {
            return id
        }else{
            return ""
        }
    }

}