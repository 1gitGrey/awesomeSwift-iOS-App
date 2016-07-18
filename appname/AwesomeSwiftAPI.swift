//
//  AwesomeSwiftAPI.swift
//  AwesomeSwift
//
//  Created by Matteo Crippa on 02/06/2016.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import AlamofireRouter
import Foundation

enum AwesomeSwiftAPI: RouterProtocol {

    case getJson()

    var router: Router { return Router(baseURL: "https://raw.githubusercontent.com/matteocrippa/awesome-swift/master") }

    var URLRequest: NSMutableURLRequest {

        switch self {

        case .getJson():

            return router.endPoint(path: "/contents.json")

        }

    }

}
