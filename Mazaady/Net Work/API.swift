//
//  API.swift
//  WeQure
//
//  Created by Diaa saeed on 12/16/21.
//

import Foundation
import Alamofire


/// types of header structure
enum httpHeadersType{
    /// add language header
    case langOnly
    /// add authurazation header
    case   token
    /// add language and authorization
 }



@available(iOS 13.0, *)
 
 func getHeaders(type:httpHeadersType) -> HTTPHeaders?{
    var HttpHeaders = HTTPHeaders()
    let User = UserModel.shared
//     print("get_token" ,"Bearer  \(User.get_authToken()" )
      if type == .langOnly{
        HttpHeaders = [  "Content-Type": "application/json" ,
                         "Locale": getLanguage(),
                         "App":"client"]

    }else if type == .token{
        HttpHeaders = ["Locale": getLanguage(),
                       "Content-Type": "application/json",
                       "Authorization": "Bearer \(User.get_authToken())",
                       "App":"client"]
     }
    
    return HttpHeaders
}

