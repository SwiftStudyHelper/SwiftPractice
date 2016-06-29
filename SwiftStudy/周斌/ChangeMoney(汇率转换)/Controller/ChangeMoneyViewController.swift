//
//  ChangeMoneyViewController.swift
//  SwiftStudy
//
//  Created by feaonline on 16/6/18.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class ChangeMoneyViewController: UIViewController {
    
    var nsMutableArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        creatGET()

    }

    func creatGET(){
        
        let dic:Dictionary<String,AnyObject>  = ["apikey":ZBSportNewsKey]
        
        AMFHelper.BaiduGet(ZBChangeMoneyUrl, parameters: dic, success: { (responseObject) in
            
            
            print(responseObject)
            
            }) { (error) in
                
                print(error);
                
        }
        
        

        
    }
    

}
