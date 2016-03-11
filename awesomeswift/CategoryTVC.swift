//
//  CategoryTableViewCell.swift
//  awesomeswift
//
//  Created by Matteo Crippa on 24/01/2016.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblDescription: UILabel!
        
    var viewModel: CategoryVVM? {
        didSet {
            
            viewModel?.name.bindAndFire{
                [unowned self] in
                self.lblName.text = $0
            }
            
            viewModel?.description.bindAndFire{
                [unowned self] in
                self.lblDescription.text = $0
            }
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
