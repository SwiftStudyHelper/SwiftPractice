//
//  HeadlineViewController.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/13.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

import SwiftyJSON

import MJRefresh

protocol HeadlineViewControllerDelegate:NSObjectProtocol {
    
    func clickTheCellWithIndexPath(url:String)
    
}


class HeadlineViewController: UIViewController{
    
    var dataSource:Array<HLModel> = []
    
    var HeadlineTableView:UITableView?
    
    var  typeKey:String?
    
    var locationKey:CGFloat = 0.0
    
    var page:Int = 1
    
    weak var delegate: HeadlineViewControllerDelegate?

    // 顶部刷新
    let header = MJRefreshNormalHeader()
    // 底部刷新
    let footer = MJRefreshAutoNormalFooter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    


    //MARK:-初始化控件
    func CreatUI(){
        
        self.HeadlineTableView = UITableView(frame:CGRectMake(locationKey*SCREEN_W, 0, SCREEN_W, SCREEN_H-Navi_H-Bar_H))
        
        self.HeadlineTableView!.delegate = self
        
        self.HeadlineTableView!.dataSource  = self
        
        self.HeadlineTableView!.registerNib(UINib(nibName: "NewsCommTableViewCell",bundle: nil), forCellReuseIdentifier: "NewsCommTableViewCell")
        
        
        // 下拉刷新
        header.setRefreshingTarget(self, refreshingAction: #selector(HeadlineViewController.headerRefresh))
        // 现在的版本要用mj_header
        self.HeadlineTableView!.mj_header = header
        
        // 上拉刷新
        footer.setRefreshingTarget(self, refreshingAction: #selector(HeadlineViewController.footerRefresh))
        self.HeadlineTableView!.mj_footer = footer
        
    }
    
    //MARK:-网络请求
    func getDataFromNetWork()
    {
        let dic:Dictionary<String,AnyObject>  = ["id":self.typeKey!,"page":page]
        
        AMFHelper .BaiduGet(baiduNewsTouTiaoUrl, parameters: dic, success: { (responseObject) in
            
            print(responseObject)
            
            let result = JSON(responseObject)
            
            let arr = result["data"]["article"].array!
            
            for dic in arr{
                
                let model = HLModel()
                
                model.setValuesForKeysWithDictionary(dic.dictionaryObject!)
                
                self.dataSource.append(model)
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                
                if self.page == 1
                {
                    self.HeadlineTableView!.mj_header.endRefreshing()

                }
                else
                {
                    
                    self.HeadlineTableView!.mj_footer.endRefreshing()
                
                }
                
                self.HeadlineTableView!.reloadData()
                

            })
            
            }) { (error) in
            
            print(error)
                
        }
    }
    

    // 顶部刷新
    func headerRefresh(){
        print("下拉刷新")
        // 结束刷新
        self.page = 1
        
        self.dataSource.removeAll()
        
        self.getDataFromNetWork()
        
        
        
    }
    
    // 底部刷新
    func footerRefresh(){
        print("上拉刷新")
        
        self.page += 1
        
        if self.page > 10 {
            
            self.HeadlineTableView!.mj_footer.endRefreshing()
            
            return

        }
        
        self.getDataFromNetWork()

        
        
        
    }
   
}



extension HeadlineViewController:UITableViewDelegate,UITableViewDataSource
{
    //MARK:-tableView代理方法
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewsCommTableViewCell") as! NewsCommTableViewCell
        
        cell.refreshCellWithModel(self.dataSource[indexPath.row])
        
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        
        return 80
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        self.delegate?.clickTheCellWithIndexPath(self.dataSource[indexPath.row].url!)
    }

    
}
