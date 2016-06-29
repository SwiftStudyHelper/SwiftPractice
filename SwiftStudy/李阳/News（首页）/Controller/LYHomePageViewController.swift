//
//  LYHomePageViewController.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/8.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class LYHomePageViewController: UIViewController{
    
    var vcArr:Array<HeadlineViewController> = []
    
    var barView:NaviBarView? = NaviBarView()
    
    var newsScrollView:UIScrollView? = UIScrollView()
    
    var jokeVc:JokeViewController?
    
    var photoVc:BeautyGirlViewController?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        createUI()
        
    }
    

    func createUI(){
        
        self.navigationController?.navigationBar.barTintColor = RGBA(251, G: 251, B: 251, A: 1)
        
        barView?.frame = CGRectMake(0, 0, SCREEN_W-24, 44)
        
        barView?.delegate = self
        
        self.navigationItem.titleView = barView!
        
        newsScrollView?.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H-Navi_H-Bar_H)
        
        newsScrollView?.contentSize = CGSizeMake(SCREEN_W*8, SCREEN_H-Navi_H-Bar_H)
        
        newsScrollView?.pagingEnabled = true
        
        newsScrollView?.backgroundColor = RGBA(0, G: 255, B: 255, A: 0.5)
        
        newsScrollView?.delegate = self
        
        self.view.addSubview(newsScrollView!)
        
        //添加controller
        
        let keyArr  = ["recomm","world","tech","sports","internet","society"]
        
        for i in 0..<6
        {
            
            let vc = HeadlineViewController()
            
            vcArr.append(vc)
            
            vc.delegate = self
            
            vc.typeKey = keyArr[i]
            
            vc.locationKey = CGFloat(i)
            
            vc.CreatUI()
            
            vc.getDataFromNetWork()
            
            newsScrollView?.addSubview( vc.HeadlineTableView!)

            
        }
        
        
        self.jokeVc = JokeViewController()
        
        self.jokeVc?.createUI()
        
        self.jokeVc?.getDataFromNetwork()
        
        newsScrollView?.addSubview((jokeVc?.tableView!)!)

        
        //相册
        self.photoVc = BeautyGirlViewController()
        
        self.photoVc?.delegate = self
        
        self.photoVc?.createUI()
        
        self.photoVc?.setData()
        
        newsScrollView?.addSubview((self.photoVc?.collectionView)!)

        
        
    }
    



   


}

extension LYHomePageViewController:UIScrollViewDelegate {

    //MARK:-scrollView代理方法
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        let offsetPage = scrollView.contentOffset.x/SCREEN_W
        
        UIView.animateWithDuration(0.3) {
            
            self.barView?.redView.frame = CGRectMake(offsetPage*50, 40, 50, 2)
        }
        
        self.barView?.redTitle(Int(offsetPage))
        
        
    }



}


extension LYHomePageViewController:HeadlineViewControllerDelegate{
    
    func clickTheCellWithIndexPath(url:String)
    {
        let vc = NewsWebViewController()
        
        vc.hidesBottomBarWhenPushed = true
        
        vc.url = url
        
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

    
}

extension LYHomePageViewController:NaviBarViewDelegate
{
    
    func clickTitleBtn(btn:UIButton)
    {
        let offset:CGFloat = CGFloat(btn.tag-1000)
        
        self.newsScrollView?.setContentOffset(CGPointMake(offset*SCREEN_W, 0), animated: true)
        
        
    }


}

extension LYHomePageViewController:BeautyGirlViewControllerDelegate
{
    func clickItem(size:CGSize,model:CellModel)
    {
        
        let vc = FullImageViewController()
    
        vc.startSize = size
        
        vc.model = model
        
        self.presentViewController(vc, animated: false, completion: nil)
        
        
        
    }


}


