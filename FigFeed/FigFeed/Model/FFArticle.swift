//
//  FFArticle.swift
//  FigFeed
//
//  Created by Titi on 9/6/15.
//  Copyright (c) 2015 funtek. All rights reserved.
//

import Foundation
import CoreData

@objc(FFArticle)
class FFArticle: NSManagedObject {

    @NSManaged var author: String
    @NSManaged var content: String
    @NSManaged var date: NSDate
    @NSManaged var identifier: String
    @NSManaged var imageUrl: String
    @NSManaged var subtitle: String
    @NSManaged var title: String
    @NSManaged var hasRead: NSNumber
    @NSManaged var videoUrl: String

}
