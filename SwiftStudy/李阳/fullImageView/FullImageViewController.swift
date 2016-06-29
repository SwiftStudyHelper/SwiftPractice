//
//  FullImageViewController.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/18.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit
import Photos


class FullImageViewController: UIViewController {
    
    var scrollView:UIScrollView?

    var imageView:UIImageView?

    var model:CellModel?
    
    var startSize:CGSize?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.5, animations: {
            
            self.imageView?.frame =  CGRectMake(0, 0, SCREEN_W+0.5, SCREEN_H+0.5)
            
        })

        
    }
    
    func createUI()
    {
        
        
        self.scrollView = UIScrollView(frame:CGRectMake(0, 0, SCREEN_W, SCREEN_H))
        
        self.scrollView?.contentSize = CGSizeMake(SCREEN_W, SCREEN_H)
        
        self.scrollView?.delegate = self
        
        self.scrollView?.scrollEnabled = true
        
        self.scrollView?.maximumZoomScale = 3
        
        self.scrollView?.minimumZoomScale = 1
        
        self.view.addSubview(self.scrollView!)
        
        self.view.backgroundColor = UIColor.blackColor()
        
        self.imageView = UIImageView()
        
        self.imageView?.frame.size = self.startSize!

        self.imageView?.center = self.view.center
        
        self.imageView?.userInteractionEnabled = true
        
        self.imageView?.multipleTouchEnabled = true
        
        self.scrollView!.addSubview(imageView!)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(FullImageViewController.handleTapGesture(_:)))
        
        self.view.addGestureRecognizer(tapGesture)
        
        let manager = PHCachingImageManager()
        
        /* For faster performance, and maybe degraded image */
        let options = PHImageRequestOptions()
        
        options.deliveryMode = .HighQualityFormat
        
        options.synchronous = true

        let imageSize = CGSizeMake(model!.w, model!.h)
        
        manager.requestImageForAsset(model!.image!, targetSize: imageSize, contentMode: PHImageContentMode.AspectFit, options: options, resultHandler: { (image, info) in
            
            
            self.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
            self.imageView?.image = image
            

        })


    }

   
    func handleTapGesture(gesture:UITapGestureRecognizer){
        
        self .dismissViewControllerAnimated(false, completion: nil)
        
    }
    
    
    func centerScrollViewContents() {
        
        var  xcenter = scrollView!.center.x
        
        var  ycenter = scrollView!.center.y;
        
        //目前contentsize的width是否大于原scrollview的contentsize，如果大于，设置imageview中心x点为contentsize的一半，以固定imageview在该contentsize中心。如果不大于说明图像的宽还没有超出屏幕范围，可继续让中心x点为屏幕中点，此种情况确保图像在屏幕中心。
        
        xcenter = scrollView!.contentSize.width > scrollView!.frame.size.width ? scrollView!.contentSize.width/2 : xcenter;
        
        ycenter = scrollView!.contentSize.height > scrollView!.frame.size.height ? scrollView!.contentSize.height/2 : ycenter;
        
        self.imageView?.center = CGPointMake(xcenter, ycenter)

        
    }
}

extension FullImageViewController:UIScrollViewDelegate
{
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        
        
        return self.imageView
        
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        
        
        centerScrollViewContents()

        
    }

}
