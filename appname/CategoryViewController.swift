//
//  CategoryViewController.swift
//  AwesomeSwift
//
//  Created by Matteo Crippa on 7/18/16.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import AlamofireRouter
import DGElasticPullToRefresh_CanStartLoading
import RealmSwift
import UIKit

class CategoryViewController: BaseViewController {

    @IBOutlet weak var table: UITableView?

    var apiNet: RouterProtocol?
    
    var categories: Results<Category>? {
        didSet {
            table!.reloadData()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // pull to refresh setup
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = .whiteColor()
        
        // get data from locale
        getDataFromLocale()
        
        guard let t = table else { return }

        t.dg_addPullToRefreshWithActionHandler({ [unowned self] in

            // TODO: update data from remote
            self.getDataFromRemote({ (completed) in
                if completed == true {
                    self.getDataFromLocale()
                }
                t.dg_stopLoading()
            })


            }, loadingView: loadingView)
        t.dg_setPullToRefreshFillColor(UIColor.awesomeColor())
        t.dg_setPullToRefreshBackgroundColor(.whiteColor())

        // perform update w/ animation delayed by 0.1 sec
        self.performSelector(#selector(CategoryViewController.updateWithLittleDelay), withObject: nil, afterDelay: 0.1)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CategoryViewController {

    // MARK: - Delayed update
    func updateWithLittleDelay() {
        guard let t = table else { return }
        t.dg_startLoading()
    }

    // MARK: - Local data
    func getDataFromLocale() {

        categories = realm.objects(Category).sorted("title")

        log.debug(categories)

    }


    // MARK: - Remote data
    func getDataFromRemote(completion: (completed: Bool) -> ()) {

        netManager.request(
            AwesomeSwiftAPI.getJson(),
            showSpinner: false,
            showError: false,
            completionHandler: { response in

                let jsonCats = response["categories"]
                log.debug(jsonCats)

                let _ = Category(json: jsonCats)

                completion(completed: true)

            }, errorHandler: { error in

                log.error(error)
                completion(completed: false)

        })

    }
}

// MARK: - Table handler
extension CategoryViewController: UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cats = categories else { return 0 }
        return cats.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cat = categories![indexPath.row] as? Category else { return UITableViewCell() }
        return tableView.setUICell(CellManager.categoryCell, object: cat)
    }
}
