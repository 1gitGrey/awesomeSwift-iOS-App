//
//  OpenSourceIosAppsAPI.swift
//  AwesomeSwift
//
//  Created by Matteo Crippa on 7/18/16.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import AlamofireRouter
import Foundation

enum OpenSourceIosAppsAPI: RouterProtocol {
    
    case getJson()
    
    var router: Router { return Router(baseURL: "https://raw.githubusercontent.com/dkhamsing/open-source-ios-apps/master") }
    
    var URLRequest: NSMutableURLRequest {
        
        switch self {
            
        case .getJson():
            
            return router.endPoint(path: "/contents.json")
            
        }
        
    }
    
}