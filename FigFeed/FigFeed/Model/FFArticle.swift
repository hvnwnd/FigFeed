//
//  FFArticle.swift
//  FigFeed
//
//  Created by Titi on 9/2/15.
//  Copyright (c) 2015 funtek. All rights reserved.
//

import Foundation
import CoreData

class FFArticle: NSManagedObject {

    @NSManaged var author: String
    @NSManaged var content: String
    @NSManaged var identifier: String

}
