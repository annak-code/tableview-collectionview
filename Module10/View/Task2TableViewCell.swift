//
//  Task2TableViewCell.swift
//  Module10
//
//

import UIKit



class Task2TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textInfoLabel: UILabel!
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
            super.prepareForReuse()
            self.accessoryType = .none
            self.switchOutlet.isHidden = true
            self.textInfoLabel.isHidden = true
        }

}
