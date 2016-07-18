//
//  CategoryViewController.swift
//  AwesomeSwift
//
//  Created by Matteo Crippa on 7/18/16.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import AlamofireRouter
import DGElasticPullToRefresh_CanStartLoading
import UIKit

class CategoryViewController: BaseViewController {

    @IBOutlet weak var table: UITableView?

    var apiNet: RouterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // pull to refresh setup
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = .whiteColor()
        
        guard let t = table else { return }

        t.dg_addPullToRefreshWithActionHandler({ [unowned self] in

            // TODO: update data from remote

            // update data
            /*self.api.getRepos() { json, error in
                if error != nil {
                    log.error(error)
                } else {
                    awesomeJSON = json
                    if let cats = json?["categories"].arrayValue {
                        self.elements = AwesomeCategory.categories(cats).sort({ $0.title.lowercaseString < $1.title.lowercaseString })
                        //Defaults[.categories] = self.elements
                        self.collectionView!.dg_stopLoading()
                    }
                }
                
            }*/

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

}

// MARK: - Table handler
extension CategoryViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cat = nil
        return tableView.setUICell(CellManager.categoryCell, object: cat)
    }
}
