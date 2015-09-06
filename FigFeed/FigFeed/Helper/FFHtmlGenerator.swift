//
//  FFHtmlGenerator.swift
//  FigFeed
//
//  Created by Titi on 9/3/15.
//  Copyright (c) 2015 funtek. All rights reserved.
//

import Foundation

class FFHtmlGenerator {
    
    class func generateHtml(title: String, imageUrl:String, videoUrl:String?, subtitle: String,  content:String) -> String
    {
        var html:String
        if videoUrl != nil {
            html = String(format: "<h1>%@</h1><img src='%@' width='360'><h3>%@</h3><video width='320' height='240' controls><source src='%@' type='video/mp4'></video>%@", title, imageUrl, subtitle, videoUrl!, content)

        }else {
            html = String(format: "<h1>%@</h1><img src='%@' width='360'><h3>%@</h3>%@", title, imageUrl, subtitle, content)
        }
        return html
    }
}