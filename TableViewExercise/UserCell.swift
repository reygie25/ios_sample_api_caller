//
//  UserCell.swift
//  TableViewExercise
//
//  Created by Shaider John Abuel on 2022-06-23.
//

import UIKit

class UserCell: UITableViewCell {
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var mobileLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  
  func configure(user: User){
    nameLabel.text = user.name
    addressLabel.text = user.address.fullAddress
    mobileLabel.text = user.phone
    emailLabel.text = user.email
  }

}
