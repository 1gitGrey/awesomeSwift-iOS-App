//
//  Storyboard.swift
//  AwesomeSwift
//
//  Created by Matteo Crippa on 8/4/16.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import StoryboardEnum

enum Storyboard: StoryboardEnum {

    case tabBar

    case list
    case filter
    case detail

    case credits

    var story: StoryboardVC {
        return StoryboardVC(inWindow: UIApplication.sharedApplication().windows.first!)
    }

    var vc: UIViewController? {
        switch self {
        case tabBar:
            return story.getVC(fromStoryboard: "TabBar")

        case list:
            return story.getVC(fromStoryboard: "List")
        case filter:
            return story.getVC(fromStoryboard: "Filter")
        case detail:
            return story.getVC(fromStoryboard: "Detail")

        case credits:
            return story.getVC(fromStoryboard: "Credits")
        }
    }

}
