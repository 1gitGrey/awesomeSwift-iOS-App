//
//  Storyboard.swift
//  AwesomeSwift
//
//  Created by Matteo Crippa on 8/4/16.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import StoryboardEnum

enum Storyboard: StoryboardEnum {

    case TabBar

    case List
    case Filter
    case Detail

    case Credits

    var story: StoryboardVC {
        return StoryboardVC(inWindow: UIApplication.sharedApplication().windows.first!)
    }

    var vc: UIViewController? {
        switch self {
        case TabBar:
            return story.getVC(fromStoryboard: "TabBar")

        case List:
            return story.getVC(fromStoryboard: "List")
        case Filter:
            return story.getVC(fromStoryboard: "Filter")
        case Detail:
            return story.getVC(fromStoryboard: "Detail")

        case Credits:
            return story.getVC(fromStoryboard: "Credits")
        }
    }

}
