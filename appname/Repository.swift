//
//  AwesomeRepository.swift
//  AwesomeSwift
//
//  Created by Matteo Crippa on 02/06/2016.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import SwiftyJSON
import SwiftyJSONRealmObject
import RealmSwift

class RString: Object {
    dynamic var name = ""
    
    override static func primaryKey() -> String? {
        return "name"
    }
}

class Repository: SwiftyJSONRealmObject {

    dynamic var title = ""
    dynamic var category: Category?
    dynamic var descr = ""
    dynamic var homepage = ""
    var tags = List<RString>()

    override static func primaryKey() -> String? {
        return "homepage"
    }

    convenience required init(json: JSON) {

        self.init()

        title = json["title"].stringValue
        descr = json["description"].stringValue
        homepage = json["homepage"].stringValue

        // loop tags
        for t in json["tags"].arrayValue {
            let name = t.stringValue

            let tag = RString()
            tag.name = name

            tags.append(tag)
        }

        // get the cat
        let cat: Category?
        do {
            cat = try Realm().objects(Category.self).filter("id = '\(json["category"].stringValue)'").first!
        } catch _ {
            cat = nil
        }

        // set the cat
        category = cat

    }

}
