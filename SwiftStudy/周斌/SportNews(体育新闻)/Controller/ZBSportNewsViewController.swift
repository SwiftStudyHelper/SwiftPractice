//
//  ZBSportNewsViewController.swift
//  SwiftStudy
//
//  Created by feaonline on 16/6/16.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit
import SwiftyJSON
import MJRefresh

class ZBSportNewsViewController: UIViewController {
    
    var num:Int = 10
    
    var page:Int = 1
    
    var tableView:UITableView?
    
    // 顶部刷新
    let header = MJRefreshNormalHeader()
    // 底部刷新
    let footer = MJRefreshAutoNormalFooter()
    
    var nsMuArray:Array<ZBSportNewsModel> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        creatUI()
        
        creatGet()

    }

    func creatUI()
    {
        self.navigationItem.title = "体育新闻"
        
        tableView = UITableView.init(frame: CGRectMake(0, 0, SCREEN_W, SCREEN_H-64-49))
        
        tableView!.registerNib(UINib(nibName:"ZBSportNewsTableViewCell",bundle: nil), forCellReuseIdentifier: "ZBSportNewsTableViewCell")
        
         tableView!.delegate = self
        
         tableView!.dataSource = self
        
        // 下拉刷新
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
       
        self.tableView!.mj_header = header
        
        // 上拉刷新
        footer.setRefreshingTarget(self, refreshingAction: #selector(footerRefresh))
        
        self.tableView!.mj_footer = footer
        
        self.view.addSubview(tableView!)
        
    }
    
    func creatGet()
    {
        let dic:Dictionary<String,AnyObject>  = ["apikey":ZBSportNewsKey,"num":num,"page":page]
        
        AMFHelper .BaiduGet(baiduNewsTouTiaoUrl, parameters: dic, success: { (responseObject) in
            
            print(dic)
            
            let result = JSON(responseObject)
            
            let arr = result["data"]["article"].array!
            
            print(arr)

            
            for dic in arr{
                
                let model = ZBSportNewsModel()
                
                model.setValuesForKeysWithDictionary(dic.dictionaryObject!)
                
                self.nsMuArray.append(model)
                
            }
            
            dispatch_async(dispatch_get_main_queue(), {

                self.tableView!.mj_header.endRefreshing()
                
                self.tableView!.mj_footer.endRefreshing()
                
                self.tableView!.reloadData()
                
                
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
        
        self.nsMuArray.removeAll()
        
        self.creatGet()
        
        
    }
    

    // 底部刷新
    func footerRefresh(){
        
        if num > 10 {

    // 底部加载
    func footerRefresh(){
        
        
        if num >= 10 {

            
            page += 1
            
            creatGet()
            
        }else{

        
        tableView?.tableFooterView

                    
            footer.endRefreshingWithNoMoreData()
            
            

        }
        


    }


      }
    }
}
extension ZBSportNewsViewController:UITableViewDelegate,UITableViewDataSource
{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return  1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        return 10
        return nsMuArray.count

    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let model = nsMuArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ZBSportNewsTableViewCell") as! ZBSportNewsTableViewCell
        
         return cell.refreshCellHeight(model)
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCellWithIdentifier("ZBSportNewsTableViewCell") as! ZBSportNewsTableViewCell
        
        cell.refreshCellWithModel(self.nsMuArray[indexPath.row] )
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        
        let Vc = ZBSportContentViewController()
        
        Vc.urlContent = nsMuArray[indexPath.row].url
        
        self.navigationController?.pushViewController(Vc, animated: true)

        
    }
    
}


