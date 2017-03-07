//
//  EmployeeCell.swift
//  Comp
//
//  Created by Pekka Pöyry on 23.01.17.
//  Copyright © 2017 Pekka Pöyry. All rights reserved.
//

import UIKit

class EmployeeCell: UITableViewCell {
    @IBOutlet weak var fname: UILabel!
    @IBOutlet weak var lname: UILabel!
    @IBOutlet weak var dep: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var placeholderImageView: UIImageView!

    var employee: Employee! {
        didSet {
            fname.text = employee.fname!
            lname.text = employee.lname!
            dep.text = employee.dname!
            
            if let empImg = employee?.image{
                let imageUrl = URL(string: Api.companyImageUrl + empImg)
                if let image = imageUrl!.cachedImage{
                    //cached: set immediately
                    avatarImageView.image = image
                    avatarImageView.alpha = 1
                    placeholderImageView.alpha = 0
                }else {
                    //not cached
                    avatarImageView.alpha = 0
                    placeholderImageView.alpha = 1
                    imageUrl!.fetchImage{image in self.avatarImageView.image = image
                        UIView.animate(withDuration: 0.3, animations: {
                            self.avatarImageView.alpha = 1
                            self.placeholderImageView.alpha = 0
                        })
                    }
                }
                
            }else {
                //no image
                self.avatarImageView.alpha = 0
                self.placeholderImageView.alpha = 1
            }
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
