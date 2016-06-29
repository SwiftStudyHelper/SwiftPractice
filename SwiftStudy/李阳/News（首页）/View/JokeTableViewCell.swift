//
//  JokeTableViewCell.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/15.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class JokeTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func refreshCellWithModel(model:JokeModel) {
        
        do{
            let attrStr = try NSAttributedString(data: model.text!.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
            
            contentLabel.text = attrStr.string
            
        }catch let error as NSError {
            
            print(error.localizedDescription)
        }
     
        titleLabel.text = model.title
        
        timeLabel.text = model.ct!
        
    }
    
}
