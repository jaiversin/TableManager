//
//  ContactViewCell.swift
//  TodoIsh
//
//  Created by Jhon Jaiver Lopez on 12/9/18.
//  Copyright © 2018 Jhon Jaiver Lopez. All rights reserved.
//

import UIKit

class ContactViewCell: UITableViewCell {
    static let identifier = "ContactViewCell"
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var model: Contact? {
        didSet {
            nameLabel.text = model?.name
            phoneNumberLabel.text = model?.phoneNumber
        }
    }
}
