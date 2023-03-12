//
//  MyTableViewCell.swift
//  VIPPatternPractice
//
//  Created by 강민혜 on 3/12/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userProfileImg: UIImageView!
    @IBOutlet weak var userContentLabel: UILabel!
    @IBOutlet weak var userTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userProfileImg.layer.cornerRadius = userProfileImg.frame.width / 2
        userProfileImg.image = UIImage(systemName: "star")
        userContentLabel.numberOfLines = 0
    }
    
    func configureCell(post: PostList.FetchPostList.ViewModel.DisplayedPost) {
        self.userTitleLabel.text = post.title
        self.userContentLabel.text = post.content
    }
    
}
