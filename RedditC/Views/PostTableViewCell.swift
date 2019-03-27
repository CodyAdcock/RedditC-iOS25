//
//  PostTableViewCell.swift
//  RedditC
//
//  Created by Cody on 3/27/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var upvotesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    var post: CRAPost?{
        didSet{
            guard let post = post else {return}
            titleLabel.text = post.title
            upvotesLabel.text = "⬆️ \(post.ups)"
            commentsLabel.text = "💬 \(post.commentCount)"
        }
    }

}
