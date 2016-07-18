//
//  BaseViewController.swift
//  AwesomeSwift
//
//  Created by Matteo Crippa on 7/18/16.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import AlamofireUIManager
import RealmSwift
import SwiftyJSON
import UIKit

class BaseViewController: UIViewController {

    // swiftlint:disable:next force_cast
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let netManager = AlamofireUIManager.sharedInstance

    // swiftlint:disable:next force_try
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        netManager.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

// MARK: - Status Bar White
extension BaseViewController {
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}

// MARK: - AlamofireUIManagerDelegate
extension BaseViewController: AlamofireUIManagerDelegate{

    func createSpinner() -> UIView {

        let act  = UIActivityIndicatorView(frame: CGRect(x: 50, y: 50, width: 50, height: 50))

        act.center = view.center
        act.activityIndicatorViewStyle = .Gray

        view.addSubview(act)

        act.startAnimating()

        return act

    }

    func closeSpinner(spinner: UIView?) {
        
        guard spinner != nil else { return }
        
        if let act = spinner as? UIActivityIndicatorView {
            
            act.stopAnimating()
            act.removeFromSuperview()
            
        }
        
    }
    
    func checkJson(json: JSON, showError: Bool, completionHandler: AFRequestCompletionHandler, errorHandler: AFRequestErrorHandler) {
        
        if let errorStr = json["error"]["message"].string { // Probably authorization required
            
            let error = NSError(domain: "json", code: 401, userInfo: ["info": errorStr])
            
            errorHandler(error)
            
        } else { completionHandler(json) }
        
    }
    
    func manageAlertError(error: NSError?, completition: AFRequestCompletionVoid) {
        
        let alertController = UIAlertController(title: "Error", message: error?.description, preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: { _ in
            
            self.netManager.closeAlert()
            completition()
            
        })
        
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)
        
    }

}
