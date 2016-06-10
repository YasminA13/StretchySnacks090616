//
//  SnackTableViewCell.swift
//  StretchySnacks090616
//
//  Created by Yasmin Ahmad on 2016-06-09.
//  Copyright © 2016 YasminA. All rights reserved.
//

import UIKit

class SnackTableViewCell: UITableViewCell {
    @IBOutlet weak var snackLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(snack: String) {
        snackLabel.text = snack

    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
