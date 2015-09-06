//
//  FFArticle_extension.swift
//  FigFeed
//
//  Created by Titi on 9/3/15.
//  Copyright (c) 2015 funtek. All rights reserved.
//

import Foundation

extension FFArticle {
    func thumbnailUrl() -> String? {
        return String(format:self.imageUrl, 100, 50)
    }
    
    func articleImageUrl() -> String? {
        return String(format:self.imageUrl, 805, 453)
    }
        
    func parseDict(articleDict: NSDictionary){
        self.setValue(articleDict["author"], forKey: "author")
        self.setValue(articleDict["_id"], forKey:"identifier")
        self.setValue(articleDict["content"], forKey: "content")
        self.setValue(articleDict["title"], forKey: "title")
        self.setValue(articleDict["subtitle"], forKey: "subtitle")
        self.setValue(articleDict.valueForKeyPath("thumb.link") as? String, forKey: "imageUrl")
//        if articleDict["videos"]
//        self.setValue(articleDict.valueForKeyPath("videos.videoUrl")[0] as? String, forKey: "videoUrl")
//        println(articleDict.valueForKeyPath("videos.videoUrl"))
        
        var dateString = articleDict["date"] as? NSNumber
        let date = NSDate(timeIntervalSince1970: dateString!.doubleValue)
        self.setValue(date, forKey: "date")

    }

}
