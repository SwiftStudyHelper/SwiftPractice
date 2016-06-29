//
//  AppNewsTableViewCell.swift
//  SwiftStudy
//
//  Created by feaonline on 16/6/20.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit
import SDWebImage


class AppNewsTableViewCell: UITableViewCell {

    //图片
    @IBOutlet weak var iconImage: UIImageView!
    //描述
    @IBOutlet weak var contentLabel: UILabel!
    //时间
    @IBOutlet weak var timeLabel: UILabel!
    //标题
    @IBOutlet weak var titleLabel: UILabel!
    
    func refreshWithModel(model:AppleNewsModel)
    {
        iconImage.sd_setImageWithURL(NSURL(string: model.picUrl!))
        
        contentLabel.text = model.descrip;
        
        timeLabel.text = model.ctime;
        
        titleLabel.text = model.title;
    
    }
    
    func refreshCellHeight(model:AppleNewsModel)-> CGFloat {
        
        let constraintSize:CGSize =  CGSizeMake(SCREEN_W-16, CGFloat(MAXFLOAT));
        
        let size:CGSize = model.descrip!.boundingRectWithSize(constraintSize, options: [NSStringDrawingOptions.UsesLineFragmentOrigin,NSStringDrawingOptions.UsesFontLeading,NSStringDrawingOptions.UsesDeviceMetrics,NSStringDrawingOptions.TruncatesLastVisibleLine],attributes: [NSFontAttributeName:UIFont.systemFontOfSize(14)], context: nil).size
        
        return size.height+70
    }

    
}
