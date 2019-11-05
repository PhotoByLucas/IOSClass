//
//  TableViewCell.swift
//  homework4
//
//  Created by Apple on 2019/10/29.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    //@IBOutlet weak var listAvatar: UIImageView!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var moneyText: UILabel!
    @IBOutlet weak var listAvatar: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
