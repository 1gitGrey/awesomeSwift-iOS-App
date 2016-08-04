//
//  ListViewController.swift
//  AwesomeSwift
//
//  Created by Matteo Crippa on 8/4/16.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import Alamofire
import AlamofireRouter
import Debug
import DGElasticPullToRefresh_CanStartLoading
import RealmSwift
import SwiftyJSONRealmObject
import UIKit

class ListViewController: BaseViewController {

    @IBOutlet weak var table: UITableView!

    var isFavorite = false
    var api: RepositoryType?

    var categories: Results<Category>? {
        didSet {
            table.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // get data from locale
        getDataFromLocale()

        // only if repository
        if isFavorite == false {

            // pull to refresh setup
            let loadingView = DGElasticPullToRefreshLoadingViewCircle()
            loadingView.tintColor = .whiteColor()

            table.dg_addPullToRefreshWithActionHandler({ [unowned self] in

                // update data from remote
                self.getDataFromRemote({ (completed) in
                    if completed == true {
                        self.getDataFromLocale()
                    }
                    self.table.dg_stopLoading()
                })

            }, loadingView: loadingView)
            table.dg_setPullToRefreshFillColor(UIColor.awesomeColor())
            table.dg_setPullToRefreshBackgroundColor(.whiteColor())

            // perform update w/ animation delayed by 0.1 sec
            performSelector(
                #selector(ListViewController.updateWithLittleDelay),
                withObject: nil,
                afterDelay: 0.1
            )
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

// MARK: - Table Data Source
extension ListViewController: UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cats = categories else { return 0 }
        return cats.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cat = categories![indexPath.row] as? Category else { return UITableViewCell() }
        return tableView.setUICell(CellManager.categoryCell, object: cat)
    }
}

// MARK: - Table Delegate
extension ListViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    }
}

// MARK: - Networking
extension ListViewController {

    // MARK: - Delayed update
    func updateWithLittleDelay() {
        guard let t = table else { return }
        t.dg_startLoading()
    }

    // MARK: - Local data
    func getDataFromLocale() {
        
        guard let apiCheck = api else { return }
        
        categories = realm.objects(Category)
        if categories?.count > 0 {
            categories = categories?.filter("source = \(apiCheck.hashValue)").sorted("title")
        }
        
        Debug.print(categories)
    }

    // MARK: - Get current API
    func getCurrentAPI() -> URLRequestConvertible? {

        guard let apiCheck = api else { return nil }

        switch apiCheck {
        case .awesomeSwift:
            Debug.print("Awesome Swift")
            return AwesomeSwiftAPI.getJson()
        case .osApp:
            Debug.print("Open Source iOS Apps")
            return OpenSourceIosAppsAPI.getJson()
        }
    }

    // MARK: - Remote data
    func getDataFromRemote(completion: (completed: Bool) -> ()) {

        netManager.request(
            getCurrentAPI()!,
            showSpinner: false,
            showError: false,
            completionHandler: { response in

                let jsonCats = response["categories"]
                Debug.print(jsonCats)

                var cats = [Category]()

                for c in jsonCats.arrayValue {
                    cats.append(Category(withJson: c, forRepository: self.api!))
                }

                // swiftlint:disable:next force_try
                try! self.realm.write({
                    // store cats in realm
                    self.realm.add(cats, update: true)
                })

                Debug.print(cats)

                completion(completed: true)

            }, errorHandler: { error in

                Debug.print("error: \(error)")
                completion(completed: false)

        })

    }
}
