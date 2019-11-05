//
//  textTableViewCell.swift
//  text
//
//  Created by Apple on 2019/10/29.
//  Copyright © 2019 qhp. All rights reserved.
//

import UIKit

class textTableViewCell: UITableViewCell {

    @IBOutlet weak var textImage: UIImageView!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }

}
