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
    var context : NSManagedObjectContext {
        get {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            return appDelegate.managedObjectContext!
        }
    }
        
    func insert(){
        
    }
    
    func fetch() -> [AnyObject]? {
        let error = NSErrorPointer()
        var fetchRequest = NSFetchRequest(entityName: "FFArticle")
        var result = context.executeFetchRequest(fetchRequest, error: error)
        
        return result
    }
}