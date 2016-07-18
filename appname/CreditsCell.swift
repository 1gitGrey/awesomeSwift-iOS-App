//
//  CreditsCell.swift
//  AwesomeSwift
//
//  Created by Matteo Crippa on 7/18/16.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import UIKit
import SwiftyMarkdown

class CreditsCell: UITableViewCell {

    @IBOutlet weak var lblContent: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func setUI(object: AnyObject?) {

        guard let text = object as? String else { return }
        guard let lbl = lblContent else { return }

        let markDown = SwiftyMarkdown(string: text)
        lbl.attributedText = markDown.attributedString()

    }
}
