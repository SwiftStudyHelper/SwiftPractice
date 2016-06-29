//
//  ZBSportContentViewController.swift
//  SwiftStudy
//
//  Created by feaonline on 16/6/16.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class ZBSportContentViewController: UIViewController {


    var urlContent:String?

    var web:UIWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "详情"
        
        print(urlContent)
        
        web = UIWebView.init(frame: CGRectMake(0, 0, SCREEN_W, SCREEN_H-49-46))
        
        web?.loadRequest(NSURLRequest(URL:NSURL(string: urlContent!)! ))
        
        
        
        self.view.addSubview(web!)


    }

}