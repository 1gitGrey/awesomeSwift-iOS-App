//
//  ListViewController.swift
//  AwesomeSwift
//
//  Created by Matteo Crippa on 8/4/16.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import AlamofireRouter
import UIKit

class ListViewController: BaseViewController {

    @IBOutlet weak var table: UITableView!

    var isFavorite = false
    var api: RepositoryType?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
