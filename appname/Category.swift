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
    dynamic var parent = ""
    dynamic var source = 100
    let repositories = LinkingObjects(fromType: Repository.self, property: "category")

    override static func primaryKey() -> String? {

        return "id"
    }

    convenience required init(json: JSON) {

        self.init()
        mapping(fromJson: json)

    }

    convenience required init(withJson json: JSON, forRepository repo: RepositoryType) {
        self.init()

        mapping(fromJson: json)

        source = repo.hashValue
    }

    func mapping(fromJson json: JSON) {

        id = json["id"].stringValue
        title = json["title"].stringValue

        if json["description"].stringValue.characters.count > 0 {
            descr = json["description"].stringValue
        }

        if json["parent"].stringValue.characters.count > 0 {
            parent = json["parent"].stringValue
        }
    }

}
