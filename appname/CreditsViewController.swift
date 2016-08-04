//
//  CreditsViewController.swift
//  AwesomeSwift
//
//  Created by Matteo Crippa on 7/18/16.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import UIKit

class CreditsViewController: BaseViewController {
    
    @IBOutlet weak var table: UITableView?
    
    let creditsString = "# AwesomeSwift App\n\n" +
        "This app is powered by developers of libraries that share their job releasing open source projects on Github.\n\n" +
        "If you want to add a new library, feel free to contribute with a **Pull Request** at https://github.com/matteocrippa/awesome-swift\n\n\n" +
        "This app makes use of these *awesome libraries*:\n\n" +
        " - Alamofire\n" +
        " - AlamofireUIManager\n" +
        " - AlamofireRouter\n" +
        " - Debug\n" +
        " - DGEElasticPullToRefresh\n" +
        " - Fabric\n" +
        " - Fastlane tools\n" +
        " - Nimble\n" +
        " - Quick\n" +
        " - RAMAnimatedTabBarController\n" +
        " - SwiftyDate\n" +
        " - SwiftyMarkdown\n" +
        " - SwiftyJSON\n" +
        " - SwiftyUserDefaults\n" +
        " - SwiftyJSONRealmObject\n" +
        " - UITableViewCellManager\n"

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Credits"

        guard let t = table else { return }
        t.estimatedRowHeight = 200
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

// MARK: - Table handler
extension CreditsViewController: UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.setUICell(CellManager.creditsCell, object: creditsString)
    }
}
