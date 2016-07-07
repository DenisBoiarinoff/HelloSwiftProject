//
//  StudentTableViewCell.swift
//  HelloSwiftProject
//
//  Created by Rhinoda3 on 06.07.16.
//  Copyright © 2016 Rhinoda. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

	@IBOutlet weak var studentName: UILabel!
	@IBOutlet weak var studentPhone: UILabel!
	@IBOutlet weak var studentEmeil: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
