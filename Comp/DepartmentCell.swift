//
//  DepartmentCell.swift
//  Comp
//
//  Created by Juho Heinonen on 13/02/17.
//  Copyright © 2017 Pekka Pöyry. All rights reserved.
//

import UIKit

class DepartmentCell: UITableViewCell {
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var dname: UILabel!

    var department: Department! {
        didSet {
            id.text = department.id
            dname.text = department.dname
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
