//
//  File.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/4.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//
import UIKit
import Foundation


let SCREEN_W = UIScreen.mainScreen().bounds.width

let SCREEN_H = UIScreen.mainScreen().bounds.height

let Navi_H:CGFloat = 64

let Bar_H:CGFloat = 49


let iOS_VERSION = (UIDevice.currentDevice().systemVersion as NSString).doubleValue

let BAIDUAPIKEY = "38e9683d1699b83d2145e6d55a140da7"

let ZBSportNewsKey = "997df217972eab512e8d67fa09b57f9d"

func RGBA(R:CGFloat,G:CGFloat,B:CGFloat,A:CGFloat)->UIColor{
    
    return UIColor(red: R/255.0, green: G/255.0, blue: B/255.0, alpha:A)

}
