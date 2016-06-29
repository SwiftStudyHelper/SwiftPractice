//
//  ZKQHomePageViewController.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/8.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit
import SwiftyJSON
class ZKQHomePageViewController: UIViewController {

    var modelArray:Array<Model>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.orangeColor()
        
        let dic = ["id":"popular","page":"1"]
        
        
        self.modelArray = Array()
        
        AMFHelper .BaiduGet(baiduNewsTouTiaoUrl, parameters: dic, success: { (responseObject) in
         
            let json = JSON(responseObject)

            for  dict  in json["data"]["article"].array! {
                
               
               let model = Model()
                
                model.setValuesForKeysWithDictionary(dict.dictionaryObject!)
                
                self.modelArray?.append(model)
                
            }
            
        }) { (error) in
            
            print(error)
            
        }
        
         print(CalculateTimeHelper.calculateTimeWithInterval(1465871624))
       
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
