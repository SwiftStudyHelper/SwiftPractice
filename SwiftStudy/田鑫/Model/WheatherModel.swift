//
//  WheatherModel.swift
//  SwiftStudy
//
//  Created by l2cplat on 16/6/14.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class WeatherModel: NSObject {
    
    var city:String? //城市
    
    var locTime:String? //时间
    
    var weather:String? //天气状况描述
    
    var fl:String? //体感温度
    
    var hum:String? //相对湿度(%)
    
    var pcpn:String? //降水量(mm)
    
    var pres:String? //气压
    
    var tmp:String? //温度
    
    var vis:String? //能见度(km)
    
    var windDeg:String? //风向(360度)
    
    var windDir:String? //风向
    
    var windSc:String? //风力
    
    var windSpd:String? //风速
    
    var airAqi:String? //空气质量指数
    
    var airQlty:String? //空气质量类别
  
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
