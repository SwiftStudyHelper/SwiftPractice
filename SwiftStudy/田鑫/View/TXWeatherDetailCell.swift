//
//  TXWeatherDetailCell.swift
//  SwiftStudy         //
//  Created by l2cplat on 16/6/14.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class TXWeatherDetailCell: UITableViewCell {
    
    var city:UILabel!
    var time:UILabel!
    var weather:UILabel!
    var weatherImage:UIImageView!
    var fl:UILabel!
    var hum:UILabel!
    var pcpn:UILabel!
    var pres:UILabel!
    var tmp:UILabel!
    var vis:UILabel!
    var windDeg:UILabel!
    var windDir:UILabel!
    var windSc:UILabel!
    var windSpd:UILabel!
    var airAqi:UILabel!
    var airQlty:UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.cyanColor()
        self.backgroundView = UIImageView(image:UIImage(named:"cellBackView"))
        city = UILabel(frame: CGRectMake(SCREEN_W / 2 - 100 , 180, 200, 50))
        city.backgroundColor = UIColor.clearColor()
        city.text = "Xi'an"
        city.font = UIFont(name: "AmericanTypewriter-Bold", size: 35)//设置字体，同时设置大小
        city.textColor = RGBA(255, G: 0, B: 128, A: 0.6)
        city.textAlignment = NSTextAlignment.Center
        self.addSubview(city)
        
        weatherImage = UIImageView(frame: CGRectMake(SCREEN_W / 2 - 55, 50, 110, 110))
        weatherImage.image = UIImage(named:"w0")
        self.addSubview(weatherImage)
        
        let line1 = UILabel(frame: CGRectMake(SCREEN_W/2 - 150, 270, 300, 2))
        line1.backgroundColor = UIColor.lightGrayColor()
        line1.alpha = 0.6
        self.addSubview(line1)
        
        tmp = UILabel(frame: CGRectMake(40, CGRectGetMaxY(line1.frame) + 40, 100, 100))
        tmp.text = "27℃"
        tmp.font = UIFont.systemFontOfSize(40)
        self.addSubview(tmp)
        
        let flName = UILabel(frame: CGRectMake(CGRectGetMaxX(tmp.frame) + 50, CGRectGetMinY(line1.frame) + 20, 70, 30))
        flName.text = "体感温度"
        flName.font = UIFont.systemFontOfSize(14)
        self.addSubview(flName)
        
        fl = UILabel(frame: CGRectMake(CGRectGetMaxX(flName.frame) + 10, CGRectGetMinY(flName.frame), 70, 30))
        fl.text = "30℃"
        fl.font = UIFont.systemFontOfSize(14)
        self.addSubview(fl)
        
        let airQltyName = UILabel(frame: CGRectMake(CGRectGetMaxX(tmp.frame) + 50, CGRectGetMaxY(flName.frame), 70, 30))
        airQltyName.text = "空气质量"
        airQltyName.font = UIFont.systemFontOfSize(14)
        self.addSubview(airQltyName)
        
        airQlty = UILabel(frame: CGRectMake(CGRectGetMaxX(airQltyName.frame) + 10, CGRectGetMinY(airQltyName.frame), 70, 30))
        airQlty.text = "良"
        airQlty.font = UIFont.systemFontOfSize(14)
        self.addSubview(airQlty)
        
        let windDirName = UILabel(frame: CGRectMake(CGRectGetMaxX(tmp.frame) + 50, CGRectGetMaxY(airQltyName.frame), 70, 30))
        windDirName.text = "风       向"
        windDirName.font = UIFont.systemFontOfSize(14)
        self.addSubview(windDirName)
        
        windDir = UILabel(frame: CGRectMake(CGRectGetMaxX(windDirName.frame) + 10, CGRectGetMinY(windDirName.frame), 70, 30))
        windDir.text = "东南风"
        windDir.font = UIFont.systemFontOfSize(14)
        self.addSubview(windDir)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}