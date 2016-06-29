//
//  NaviBarView.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/13.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

protocol NaviBarViewDelegate:NSObjectProtocol {
    
    func clickTitleBtn(btn:UIButton)
}


class NaviBarView: UIView {
    
    let btnWidth:CGFloat = 50
    
    var titleBarScrollView:UIScrollView = UIScrollView()
    
    var redView:UIView = UIView()
    
    let titles = ["头条","国际","科技","体育","网络","社会","相册","段子"]
    
    weak var delegate:NaviBarViewDelegate?
    
    //重载父类的init方法
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        createSubViews()
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK:-初始化子控件
    func createSubViews() {
        
        self.titleBarScrollView.backgroundColor = UIColor.brownColor()

        self.titleBarScrollView.frame = CGRectMake(0, 0, SCREEN_W-24, 44)
        
        self.titleBarScrollView.backgroundColor = UIColor.clearColor()
        
        self.titleBarScrollView.contentSize = CGSizeMake(btnWidth*8, 44)
        
        self.titleBarScrollView.showsHorizontalScrollIndicator = false
        
        self.addSubview(self.titleBarScrollView)
        
        for i in 0 ..< 8 {
            
            let btn:UIButton = UIButton(type:.Custom)
            
            btn.frame = CGRectMake(CGFloat(Float(i))*btnWidth, 0, btnWidth, 42)
            
            btn.tag = 1000+i
            
            btn.addTarget(self, action:#selector(NaviBarView.clickBtn(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            
            btn.setTitle(titles[i], forState: UIControlState.Normal)
            
            btn.setTitleColor(RGBA(154, G: 154, B: 154, A: 1), forState: UIControlState.Normal)
            
            btn.setTitleColor(UIColor.redColor(), forState: UIControlState.Selected)

            self.titleBarScrollView.addSubview(btn)
        }
        
        redView.frame = CGRectMake(0, 40, btnWidth, 2)
        
        redView.backgroundColor = UIColor.redColor()
        
        self.titleBarScrollView.addSubview(redView)
        
        
    }
    
    //MARK:-字体变红
    func redTitle(pageNum:Int){
        
        if pageNum>4 {
            
            animationWithTitle(400-SCREEN_W+24)

        }
        else
        {
            animationWithTitle(0)

        }
        
        
        
        for i in 1000..<1008
        {
            if i == pageNum+1000 {
                
                let btn = viewWithTag(i) as! UIButton
                
                btn.selected = true

            }else{
                let btn = viewWithTag(i) as! UIButton
                
                btn.selected = false
            
            }
        }
        
        
        
    }
    
    //MARK:-点击btn事件
    func clickBtn(btn:UIButton){
        
        
        let offset = btn.tag-1000
        
        animationWithTitle(CGFloat(offset)*50)
        
        UIView.animateWithDuration(0.3) {
            
            self.redView.frame = CGRectMake(CGFloat(offset)*50, 40, 50, 2)
        }

        self.redTitle(offset)
        
        if btn.tag>1004 {
            
            animationWithTitle(400-SCREEN_W+24)
            
        }
        else
        {
            animationWithTitle(0)
        }
        
        //回调出去
        self.delegate?.clickTitleBtn(btn)
    }
    
    
    //MARK:-动画封装
    func animationWithTitle(x:CGFloat) {
        
        
        UIView.animateWithDuration(0.3, animations: {
            
            self.titleBarScrollView.contentOffset = CGPointMake(x, 0)
            
        })

    }

}
