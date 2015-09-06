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
        var html:String = "<h1>\(title)</h1><img src='\(imageUrl)' width='360'><h3>\(subtitle)</h3>"
        if videoUrl != nil {
            html += "<video width='320' height='240' controls><source src='\(videoUrl!)' type='video/mp4'></video>"
        }
        html += "\(content)"
        return html
    }
}