//
//  ListViewController.swift
//  AwesomeSwift
//
//  Created by Matteo Crippa on 8/4/16.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import AlamofireRouter
import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    var isFavorite = false
    var api: RepositoryType?

    override func viewDidLoad() {
        super.viewDidLoad()
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
