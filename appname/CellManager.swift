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

    case repositoryCell

    case categoryCell

    
    var cellStructure: UITableViewCellStructure {
        
        switch self {
            
        case .creditsCell:
            return UITableViewCellStructure(type: CreditsCell(), identifier: "CreditsCell", nib: "CreditsCell")
            
            
        case .repositoryCell:
            return UITableViewCellStructure(type: RepositoryCell(), identifier: "RepositoryCell", nib: "RepositoryCell")
            
        case .categoryCell:
            return UITableViewCellStructure(type: CategoryCell(), identifier: "CategoryCell", nib: "CategoryCell")
        }
        
    }
    
}

