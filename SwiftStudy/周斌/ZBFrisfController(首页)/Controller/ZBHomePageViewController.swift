//
//  ZBHomePageViewController.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/8.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class ZBHomePageViewController: UIViewController{
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "日常生活"
        
        let tableView = UITableView.init(frame: CGRectMake(0, 0, SCREEN_W, SCREEN_H-64-49))
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
        
        tableView.registerNib(UINib(nibName:"DailyTableViewCell",bundle: nil), forCellReuseIdentifier: "DailyTableViewCell")
        
        tableView.registerNib(UINib(nibName:"ZhoubinJokeTableViewCell",bundle: nil), forCellReuseIdentifier: "ZhoubinJokeTableViewCell")
        
        tableView.registerNib(UINib(nibName:"FirstTableViewCell",bundle: nil), forCellReuseIdentifier: "FirstTableViewCell")

        
    }
 
}


//MARK:tableViewDataSource
extension ZBHomePageViewController:UITableViewDelegate,UITableViewDataSource
{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        
        if(indexPath.section == 0){
            
            return 150
            
        }else if (indexPath.section == 1){
            
            return 265
            
        }
        //笑话高度
        return 160;
        
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if(section == 0){
            
            return 0.1
            
        }
        
        return 5
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        if(indexPath.section == 0){
            //加一张图片
            let cell = tableView.dequeueReusableCellWithIdentifier("FirstTableViewCell") as! FirstTableViewCell
            
            return cell
            
        }else if (indexPath.section == 1){
            //日常快捷入口
            
        let cell = tableView.dequeueReusableCellWithIdentifier("DailyTableViewCell") as! DailyTableViewCell
            
            cell.delgete = self
            
            return cell
        }
            //笑话
            let cell1 = tableView.dequeueReusableCellWithIdentifier("ZhoubinJokeTableViewCell") as! ZhoubinJokeTableViewCell
            
            return cell1
    }
    
//    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        if indexPath.section == 1 {
//            
//            let cell1 = cell as! DailyTableViewCell
//            
//            for bt  in cell1.contentView.subviews {
//                
//              
//                for bu in bt.subviews {
//                    if bu.isKindOfClass(UIButton) {
//                        
//                    switch bt.tag {
//                      case 201:
//                       print(111)
//                    default:
//                       print(22)
//                                            }
//                    }
//                }
//                
//            }
//        }
//        
//    }

}


extension ZBHomePageViewController:buttonTableViewDelegate
{

    func clickBtn(btnName:NSString)
    {
        if(btnName .isEqualToString("查快递")){
        
            print("查快递")
        
        }
        if(btnName .isEqualToString("体育新闻")){
            
        let zbsport = ZBSportNewsViewController()
            
        self.navigationController?.pushViewController(zbsport, animated: true)
            
        }
        if(btnName .isEqualToString("健康资讯")){
            
            print("健康资讯")
            
        }
        if(btnName .isEqualToString("违章查询")){
            
            print("违章查询")
            
        }
        if(btnName .isEqualToString("苹果新闻")){
            
            let zbAppleNews = AppleNewsViewController()
            
            self.navigationController?.pushViewController(zbAppleNews, animated: true)
            
            print("苹果新闻")
            
        }
        if(btnName .isEqualToString("星座运势")){
            
            print("星座运势")
            
        }
        if(btnName .isEqualToString("汇率转换")){
            
            let zbchange = ChangeMoneyViewController()
            
            self.navigationController?.pushViewController(zbchange, animated: true)
            
        }
        
        
    }
    

}


