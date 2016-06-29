//
//  TXHomePageViewController.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/8.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

import SwiftyJSON

class TXHomePageViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    // 123
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.brownColor()
        
        let item = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Refresh, target: self, action: nil)
        
        self.navigationItem.rightBarButtonItem = item
     
        var myTableView = UITableView(frame: CGRectMake(0, 0, SCREEN_W, SCREEN_H - 64), style:UITableViewStyle.Grouped)
        
        self.view.addSubview(myTableView)
        
        myTableView.delegate = self
        
        myTableView.dataSource = self
        
        self.getDataFromNetWork()
        
//        myTableView.backgroundColor = UIColor.whiteColor()
        

        // Do any additional setup after loading the view.
    }
    
    func getDataFromNetWork()
    {
        let dic:Dictionary<String,AnyObject>  = ["city":"西安"]
        
        AMFHelper .BaiduGet(baiduWeatherUrl, parameters: dic, success: { (responseObject) in
            
//            print(responseObject)
            let dic = JSON(responseObject)
            print(dic["HeWeather data service 3.0"][0]["aqi"]["city"]["qlty"])
            
        }) { (error) in
            
            print(error)
            
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return SCREEN_H - 200
        

    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = TXWeatherDetailCell()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
        
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
