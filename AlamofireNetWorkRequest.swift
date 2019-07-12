//
//  AlamofireNetWorkRequest.swift
//  CocoaPodsManager
//
//  Created by Sunrise on 2019/7/12.
//  Copyright © 2019 ANSO. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

/// 基于Alamofire的二次封装
class AlamofireNetWorkRequest: NSObject {

    static let shareInstance : AlamofireNetWorkRequest = {
        
        let share = AlamofireNetWorkRequest()
        
        return share;
    }()
    
    /// 网络请求
    ///
    /// - Parameters:
    ///   - method: 请求方式
    ///   - urlStr: 请求路径
    ///   - parameters: 请求参数
    ///   - requestBlock: 请求返回结果(json数据, 请求返回状态)
    func NetWorkJsonRequest(method:HTTPMethod,urlStr:String,parameters:NSMutableDictionary, requestBlock : @escaping (_ :JSON, _ :Bool) -> ()){
        
        let headers = NSMutableDictionary.init()
        
        request(urlStr, method: method, parameters: (parameters as? Parameters), encoding: JSONEncoding.default, headers: (headers as! HTTPHeaders)).responseJSON { (response) in
            
            switch response.result{
                
            case .success(_):
                
                if let jsonString = response.result.value {
                    
                    let dataDic = JSON(jsonString)
                    
                    requestBlock(dataDic,true)
                    
                }else {
                    
                    print("JSON转换失败")
                    requestBlock(JSON.null,false)
                }
                
            case .failure(let error):
                
                print("\(method)请求失败:\(error)")
                requestBlock(JSON.null,false)
            }
        }
    }
}
