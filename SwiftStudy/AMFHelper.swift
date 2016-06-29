//
//  AMFHelper.swift
//  SwiftStudy
//
//  Created by l2cplat on 16/6/8.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit
import Alamofire
class AMFHelper: NSObject {


   
    /**
     get请求
     
     - parameter url:        请求url
     - parameter parameters: 请求参数
     - parameter success:    请求成功回调
     - parameter faliure:    请求失败回调
     */
    class func get(url:String, parameters:[String: AnyObject]?,success:(responseObject:AnyObject!)->Void,faliure:(error:NSError?)->Void) -> Void{
        
        Alamofire.request(.GET, url, parameters:parameters).responseJSON { (response) in
            
            if response.result.value != nil {
            
                success(responseObject:response.result.value!)
            
            }
            else {
            
              faliure(error: response.result.error)
            
            }
        }
        
       
        
     }
    
    /**
     BaiduGet
     
     - parameter url:        请求url
     - parameter parameters: 请求参数
     - parameter success:    请求成功回调
     - parameter faliure:    请求失败回调
     */
    class func BaiduGet(url:String, parameters:[String: AnyObject]?,success:(responseObject:AnyObject!)->Void,faliure:(error:NSError?)->Void) -> Void{
        
        Alamofire.request(.GET, url, parameters:parameters,headers: ["apikey":BAIDUAPIKEY]).responseJSON { (response) in
            
            if response.result.value != nil {
                
                success(responseObject:response.result.value)
                
            }
            else {
                
                faliure(error: response.result.error)
                
            }
        }
        
        
        
    }
    
    
    /**
     post请求
     
     - parameter url:        请求url
     - parameter parameters: 请求参数
     - parameter success:    请求成功回调
     - parameter faliure:    请求失败回调
     */
    class func post(url:String, parameters:[String: AnyObject]?, success:(responseObject:AnyObject!)->Void,faliure:(error:NSError?)->Void) -> Void{
        
        Alamofire.request(.POST, url, parameters:parameters).responseJSON { (response) in
            
            if response.result.value != nil {
                
                success(responseObject:response.result.value)
                
            }
            else {
                
                faliure(error: response.result.error)
                
            }
        }
        
    }
    
    /**
     BaiduPost请求
     
     - parameter url:        请求url
     - parameter parameters: 请求参数
     - parameter success:    请求成功回调
     - parameter faliure:    请求失败回调
     */
    class func BaiduPost(url:String, parameters:[String: AnyObject]?, success:(responseObject:AnyObject!)->Void,faliure:(error:NSError?)->Void) -> Void{
        
        Alamofire.request(.POST, url, parameters:parameters,headers:["apikey":BAIDUAPIKEY]).responseJSON { (response) in
            
            if response.result.value != nil {
                
                success(responseObject:response.result.value)
                
            }
            else {
                
                faliure(error: response.result.error)
                
            }
        }
        
    }
    
    /**
     上传
     
     - parameter url:            上传url
     - parameter file:           上传的文件路径
     - parameter uploadProgress: 上传进度
     - parameter faliure:        上传失败回调
     */
    class func upload(url:String,file:NSURL,uploadProgress:(progresss:Int64?)->Void,faliure:(error:NSError?)->Void)->Void {

        //单文件上传
        Alamofire.upload(.POST, url, file: file).progress { (bytesWritten, totalBytesWritten, totalBytesExpectedToWrite) in
         
           
            uploadProgress(progresss: (totalBytesWritten*100/totalBytesExpectedToWrite))
          
            
        }.response { (_,_,_,error) in
              faliure(error: error)
        }
        
        
        
    }
    
    /**
     下载
     
     - parameter url:              下载url
     - parameter downloadProgress: 下载进度
     - parameter faliure:          下载失败回调
     */
    class func download(url:String,downloadProgress:(progresss:Int64?)->Void,faliure:(error:NSError?)->Void)->Void {
        
        //默认路径
        let destination = Alamofire.Request.suggestedDownloadDestination(
            directory: .DocumentDirectory, domain: .UserDomainMask)
        
        Alamofire.download(.POST, url, destination: destination).progress{(bytesRead, totalBytesRead, totalBytesExpectedToRead) in
            
            downloadProgress(progresss:totalBytesRead*100/totalBytesExpectedToRead)
          
            
        }.response { (_, _, _, error) in
            
            faliure (error: error)
        }
    
    
    
    
    }
    
    
}
