//
//  CollegeListTableViewCell.swift
//  College-Student-Using-Coredata
//
//  Created by NTS on 20/03/24.
//

import UIKit

class CollegeListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var college: College? {
            didSet {
                nameLabel.text = "Name: \(college?.name ?? "")"
                cityLabel.text = "City: \(college?.city ?? "")"
                addressLabel.text = "Address: \(college?.address ?? "")"
            }
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
