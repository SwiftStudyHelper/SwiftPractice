//
//  NewsCommTableViewCell.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/13.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit
import SDWebImage
class NewsCommTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImgView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsAuthorLabel: UILabel!
    @IBOutlet weak var newsTimeLabel: UILabel!
    
    func refreshCellWithModel(model:HLModel){
        
        self.newsTitleLabel.text = model.title
        
        self.newsTimeLabel.text = CalculateTimeHelper.calculateTimeWithInterval(model.time)
        
        self.newsAuthorLabel.text = model.author
        
        self.newsImgView.sd_setImageWithURL(NSURL(string: model.img!))
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }


    
}
