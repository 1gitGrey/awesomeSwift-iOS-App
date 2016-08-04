//
//  Utilities.swift
//  AwesomeSwift
//
//  Created by Matteo Crippa on 17/04/2016.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import Debug
import RealmSwift
import SwiftyJSON
import SafariServices
import SwiftyUserDefaults
import UIKit


// MARK: - Defaults
/*extension DefaultsKeys {
    static let Categories = DefaultsKey<[AwesomeCategory]?>("categories")
    static let Favorites = DefaultsKey<[String]>("favorites")
}

extension NSUserDefaults {
    subscript(key: DefaultsKey<[AwesomeCategory]?>) -> [AwesomeCategory]? {
        get { return unarchive(key) }
        set { archive(key, newValue) }
    }
}*/

// MARK: - Safari
extension SFSafariViewController {

    override public func previewActionItems() -> [UIPreviewActionItem] {

        let deleteAction =  UIPreviewAction(title: "Cancel",
                                            style: UIPreviewActionStyle.Destructive,
                                            handler: {
                                                (previewAction, viewController) in

                                                Debug.print("Delete")

        })


        return [deleteAction]
    }

}

extension UITableView {
    func deselectSelectedRow() {
        if let selected = self.indexPathForSelectedRow {
            self.deselectRowAtIndexPath(selected, animated: false)
        }
    }
}

extension UIScrollView {
    func dg_stopScrollingAnimation() {}
}


// UIButton
extension UIButton {

    private func setOrTriggerClosure(closure:((button: UIButton) -> Void)? = nil) {

        // swiftlint:disable type_name
        struct __ {
            static var closure :((button: UIButton) -> Void)?
        }

        //if closure has been passed in, set the struct to use it
        if closure != nil {
            __.closure = closure
        } else {
            //otherwise trigger the closure
            __.closure?(button: self)
        }
    }
    @objc private func triggerActionClosure() {
        self.setOrTriggerClosure()
    }
    func on(event: UIControlEvents, doThis closure: (UIButton) -> Void) {
        self.setOrTriggerClosure(closure)
        self.addTarget(self, action:
            #selector(UIButton.triggerActionClosure),
                       forControlEvents: event)
    }
}
