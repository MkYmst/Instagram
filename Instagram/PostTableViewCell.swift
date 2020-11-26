//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by MikaYamashita on 2020/11/23.
//  Copyright © 2020 mika.yamashita. All rights reserved.
//

import UIKit
import FirebaseUI
import Firebase

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentNumberLabel: UILabel!
    @IBOutlet weak var LatestCommentLabel: UILabel!
    @IBOutlet weak var commentInputField: UITextField!
    @IBOutlet weak var commentButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // PostDataの内容をセルに表示
    func setPostData(_ postData:PostData){
        // 画像の表示
        postImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        let imageRef = Storage.storage().reference().child(Const.ImagePath).child(postData.id + ".jpg")
        postImageView.sd_setImage(with:imageRef)
        
        // キャプションの表示
        self.captionLabel.text = "\(postData.name!):\(postData.caption!)"
        
        // 日時の表示
        self.dateLabel.text = ""
        if let date = postData.date{
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateString = formatter.string(from: date)
            self.dateLabel.text = dateString
        }
        
        // いいね数の表示
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        // いいねボタンの表示
        if postData.isLiked{
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        }else{
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
        
        //コメント数の表示
        let commentNumber = postData.comment.count
        let nums = commentNumber - 1
        if commentNumber == 0{
            self.commentNumberLabel.text = ""
            self.LatestCommentLabel.text = ""
        }else{
            self.commentNumberLabel.text = "コメント\(commentNumber)件を全て見る"
            self.LatestCommentLabel.text = "\(postData.comment[nums])"
            self.commentInputField.text = ""
        }
        print(commentNumber)
    }
}
