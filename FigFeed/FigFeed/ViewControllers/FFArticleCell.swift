//
//  FFArticleCell.swift
//  FigFeed
//
//  Created by Titi on 9/3/15.
//  Copyright (c) 2015 funtek. All rights reserved.
//

import UIKit

class FFArticleCell: UITableViewCell {
    @IBOutlet var thumbnail: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    private var kvoCtx = 0
    override func awakeFromNib() {
        thumbnail.addObserver(viewModel, forKeyPath:"image", options:NSKeyValueObservingOptions.New, context: kvoCtx)
    }
    
    var viewModel:FFArticleViewModel? {
        didSet {
            thumbnail.image = viewModel?.image
            titleLabel.text = viewModel?.title
        }
    }
    
}
