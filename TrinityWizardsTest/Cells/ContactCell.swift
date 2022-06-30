//
//  ContactCell.swift
//  TrinityWizardsTest
//
//  Created by Iman Zabihi on 30/06/2022.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var img_contact: UIImageView!
    @IBOutlet weak var lbl_name: UILabel!
    
    static let identifier = "ContactCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.img_contact.makeRounded()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ContactCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
