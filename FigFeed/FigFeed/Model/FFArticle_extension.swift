//
//  FFArticle_extension.swift
//  FigFeed
//
//  Created by Titi on 9/3/15.
//  Copyright (c) 2015 funtek. All rights reserved.
//

import Foundation

extension FFArticle {
    func thumbnailUrl() -> String {
        return String(format:self.imageUrl, 200, 50)
    }
    
    func articleImageUrl() -> String {
        return String(format:self.imageUrl, 805, 453)
    }

}
