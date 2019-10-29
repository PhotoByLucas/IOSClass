//
//  TableViewCellController.swift
//  2019.10.15
//
//  Created by Lucas on 2019/10/29.
//  Copyright © 2019 Lucas. All rights reserved.
//

import UIKit

class TableViewCellController: UITableViewCell {

    @IBOutlet weak var imageViewOL: UIImageView!
    @IBOutlet weak var labelOneOL: UILabel!
    @IBOutlet weak var labelTwoOL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
