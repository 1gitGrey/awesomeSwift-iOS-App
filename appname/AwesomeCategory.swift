//
//  CategoryJson.swift
//  AwesomeSwift
//
//  Created by Matteo Crippa on 02/06/2016.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import SwiftyJSON
import SwiftyJSONRealmObject
import RealmSwift

class Category: SwiftyJSONRealmObject {

    dynamic var id = ""
    dynamic var title = ""
    dynamic var descr = ""
    let repositories = LinkingObjects(fromType: Repository.self, property: "category")


    override static func primaryKey() -> String? {

        return "id"
    }

    convenience required init(json: JSON) {

        self.init()

        id = json["id"].stringValue
        title = json["title"].stringValue
        descr = json["description"].stringValue

    }
    
}
