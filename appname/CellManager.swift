//
//  CellManager.swift
//  AwesomeSwift
//
//  Created by Matteo Crippa on 7/18/16.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import UITableViewCellManager

enum CellManager: UITableViewCellStructureDataSource {
    
    case creditsCell
    
    var cellStructure: UITableViewCellStructure {
        
        switch self {
            
        case .creditsCell:
            return UITableViewCellStructure(type: CreditsCell(), identifier: "CreditsCell", nib: "CreditsCell")
            
        }
        
    }
    
}

