//
//  NewsWebViewController.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/13.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class NewsWebViewController: UIViewController {
    
    
    var url:String? = String()
    
    var newsWebView:UIWebView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsWebView = UIWebView(frame:CGRectMake(0, 0, SCREEN_W, SCREEN_H-Navi_H))
        
        newsWebView?.loadRequest(NSURLRequest(URL: NSURL(string: self.url!)!))
        
        self.view.addSubview(newsWebView!)

    }
}
