//
//  AppleNewsViewController.swift
//  SwiftStudy
//
//  Created by feaonline on 16/6/20.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit
import SwiftyJSON
import MJRefresh

class AppleNewsViewController: UIViewController {
    
    var num:Int = 10
    
    var page:Int = 1
    
    var tableView:UITableView?
    
    var muArray:Array<AppleNewsModel> = []
    
    // 顶部刷新
    let header = MJRefreshNormalHeader()
    // 底部刷新
    let footer = MJRefreshAutoNormalFooter()
    
//    var ischange:Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        creatUI()
        
        creatGet()

    }
    
    func creatUI(){
        
        self.navigationItem.title = "苹果新闻"
        
        tableView = UITableView.init(frame: CGRectMake(0, 0, SCREEN_W, SCREEN_H-64-49))
        
        tableView?.delegate = self
        
        tableView?.dataSource = self
        
        tableView!.registerNib(UINib(nibName:"AppNewsTableViewCell",bundle: nil), forCellReuseIdentifier: "AppNewsTableViewCell")
        // 下拉刷新
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh1))
        
        self.tableView!.mj_header = header

         // 上拉加载
        footer.setRefreshingTarget(self, refreshingAction: #selector(footerRefresh1))
        
        self.tableView!.mj_footer = footer
  
        self.view.addSubview(tableView!)
    
        
    
    }
    
    func headerRefresh1(){
    
        print("下拉刷新")
        
        self.page = 1
        
        self.muArray.removeAll()
        
        creatGet()
        
        
    }
    func footerRefresh1(){
    
        print("上拉加载")
        
        if num >= 10 {
            
            page += 1
            
            creatGet()
            
        }else{
            
            footer.endRefreshingWithNoMoreData()
        }

    }
    
    
    
    
    func creatGet() {
        
        let dic:Dictionary<String,AnyObject>  = ["apikey":ZBSportNewsKey,"num":num,"page":page]
        
        AMFHelper.BaiduGet(ZBAppleNewsUrl, parameters: dic, success: { (responseObject) in
            
            
            print(responseObject)
            
            
            let result = JSON(responseObject)
            
            let arr = result["newslist"].array!
            
            print(arr)
            
            
            for dic in arr{
                
                let model = AppleNewsModel()
                
                model.setValuesForKeysWithDictionary(dic.dictionaryObject!)
                
                self.muArray.append(model)
                                
            }
            dispatch_async(dispatch_get_main_queue(), {
                
                self.tableView!.mj_header.endRefreshing()
                
                self.tableView!.mj_footer.endRefreshing()
                
                self.tableView!.reloadData()
                
//                self.ischange = false
                
                
            })
            

            
            
        }) { (error) in
            
            print(error);
            
        }
  
    }

}

extension AppleNewsViewController:UITableViewDelegate,UITableViewDataSource
{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return  1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return muArray.count
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let model = muArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("AppNewsTableViewCell") as! AppNewsTableViewCell
        
        return cell.refreshCellHeight(model)
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("AppNewsTableViewCell") as! AppNewsTableViewCell
        
        cell.refreshWithModel(self.muArray[indexPath.row])
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        
        let Vc = ZBSportContentViewController()
        
        Vc.urlContent = muArray[indexPath.row].url
        
        self.navigationController?.pushViewController(Vc, animated: true)
        
        
    }
    

    
}








