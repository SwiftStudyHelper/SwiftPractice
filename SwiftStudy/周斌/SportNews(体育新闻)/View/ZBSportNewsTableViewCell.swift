//
//  ZBSportNewsTableViewCell.swift
//  SwiftStudy
//
//  Created by feaonline on 16/6/16.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit
import SDWebImage

class ZBSportNewsTableViewCell: UITableViewCell {

    @IBOutlet weak var sportAuthor: UILabel!
    @IBOutlet weak var sportTitleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    func refreshCellWithModel(model:ZBSportNewsModel){

        sportAuthor.text = model.author
        
        sportTitleLabel.text = model.title
        
        //将时间戳转化为日期
        timeLabel.text = CalculateTimeHelper.calculateTimeWithInterval(model.time)
        
    }
    
    func refreshCellHeight(model:ZBSportNewsModel)-> CGFloat {
    
    let constraintSize:CGSize =  CGSizeMake(SCREEN_W-16, CGFloat(MAXFLOAT));
    
    let size:CGSize = model.title!.boundingRectWithSize(constraintSize, options: [NSStringDrawingOptions.UsesLineFragmentOrigin,NSStringDrawingOptions.UsesFontLeading,NSStringDrawingOptions.UsesDeviceMetrics,NSStringDrawingOptions.TruncatesLastVisibleLine],attributes: [NSFontAttributeName:UIFont.systemFontOfSize(14)], context: nil).size
    
    return size.height+60
    }

}
