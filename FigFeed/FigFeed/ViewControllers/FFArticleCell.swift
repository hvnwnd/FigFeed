//
//  FFArticleCell.swift
//  FigFeed
//
//  Created by Titi on 9/3/15.
//  Copyright (c) 2015 funtek. All rights reserved.
//

import UIKit

class FFArticleCell: UITableViewCell, FFArticleViewModelDelegate {
    @IBOutlet var thumbnail: UIImageView!
    @IBOutlet var playImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
        
    var viewModel:FFArticleViewModel? {
        didSet {
            titleLabel.text = viewModel?.title
            println(viewModel?.isVideo)
            if let isVideo = viewModel?.isVideo {
                playImage.hidden = !isVideo
            }
            if let hasRead = viewModel?.hasRead {
                titleLabel.textColor = hasRead ? UIColor.lightGrayColor(): UIColor.blackColor()
            }

            viewModel?.delegate = self
        }
    }
    
    func imageDidSet(viewModel:FFArticleViewModel){
        thumbnail.image = viewModel.image
    }
    
}
