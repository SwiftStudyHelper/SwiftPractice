//
//  JokeModel.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/15.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class JokeModel: NSObject {
    
    var ct:String?
    
    var text:String?
    
    var title:String?
    
    var type:Int64?
    
    var uid:String?
    
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
        if key == "id" {
            
            self.uid = value as? String
        }
    }

}
