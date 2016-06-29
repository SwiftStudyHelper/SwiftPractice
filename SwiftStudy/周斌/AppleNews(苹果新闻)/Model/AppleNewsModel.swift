//
//  AppleNewsModel.swift
//  SwiftStudy
//
//  Created by feaonline on 16/6/20.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class AppleNewsModel: NSObject {
    //时间
    var ctime:String?
    //标题
    var title:String?
    //描述
    var descrip:String?
    //图片
    var picUrl:String?
    //详情
    var url:String?
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
        if key == "description" {
            
            self.descrip = value as? String
        }
        
    }


}
