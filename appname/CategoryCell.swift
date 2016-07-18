//
//  CategoryCell.swift
//  AwesomeSwift
//
//  Created by Matteo Crippa on 7/18/16.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel?
    
    var category = Category()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func setUI(object: AnyObject?) {
        
        guard let cat = object as? Category else { return }
        category = cat
        
        guard let lbl = lblTitle else { return }

        lbl.text = category.title
    }
    
}
