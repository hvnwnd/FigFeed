//
//  FFHtmlGenerator.swift
//  FigFeed
//
//  Created by Titi on 9/3/15.
//  Copyright (c) 2015 funtek. All rights reserved.
//

import Foundation

class FFHtmlGenerator {
    
    class func generateHtml(title: String, imageUrl:String,  subtitle: String,  content:String) -> String
    {
        let s = String(format: "<h1>%@</h1><img src='%@' width='360'><h3>%@</h3>%@", title, imageUrl, subtitle, content)
        return s
    }
}