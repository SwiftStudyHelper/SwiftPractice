//
//  DailyTableViewCell.swift
//  SwiftStudy
//
//  Created by feaonline on 16/6/15.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

protocol  buttonTableViewDelegate:NSObjectProtocol{
    
    func clickBtn(btnName:NSString)

}

class DailyTableViewCell: UITableViewCell {
    
    
    weak var delgete:buttonTableViewDelegate?

    @IBAction func searchCourier(sender: UIButton) {
        
        let str = "查快递"
        
        self.delgete?.clickBtn(str)
    }
    
    @IBAction func sportNews(sender: UIButton) {
        
        let str = "体育新闻"
        
        self.delgete?.clickBtn(str)
    }
    
    @IBAction func healthNews(sender: UIButton) {
        
        let str = "健康资讯"
        
        self.delgete?.clickBtn(str)
    }
    
    @IBAction func searchIllegal(sender: UIButton) {
        
        let str = "违章查询"
        
        self.delgete?.clickBtn(str)
    }
    
    @IBAction func appleNews(sender: UIButton) {
        
        let str = "苹果新闻"
        
        self.delgete?.clickBtn(str)
    }
    
    @IBAction func luckyStar(sender: UIButton) {
        
        let str = "星座运势"
        
        self.delgete?.clickBtn(str)
    }
    
    @IBAction func changeMoney(sender: UIButton) {
        
        let str = "汇率转换"
        
        self.delgete?.clickBtn(str)
    }


}
