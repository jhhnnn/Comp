//
//  ProjectCell.swift
//  Comp
//
//  Created by Juho Heinonen on 13/02/17.
//  Copyright © 2017 Pekka Pöyry. All rights reserved.
//

import UIKit

class ProjectCell: UITableViewCell {
    @IBOutlet weak var pname: UILabel!
    @IBOutlet weak var fname: UILabel!
    @IBOutlet weak var lname: UILabel!
    
    var project: Project! {
        didSet {
            pname.text = project.pname
            fname.text = project.fname
            lname.text = project.lname
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
