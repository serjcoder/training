//
//  TableViewCell.swift
//  fileManager
//
//  Created by Sergey Ivchenko on 02.06.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var timeIntervalLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
