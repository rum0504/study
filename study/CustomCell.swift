//
//  CustomCell.swift
//  study
//
//  Created by 齊藤愛華 on 2020/02/08.
//  Copyright © 2020 com.lifeistech. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet var nichijiLabel: UILabel!
    @IBOutlet var jikanLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
