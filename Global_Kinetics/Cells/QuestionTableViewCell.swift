//
//  QuestionTableViewCell.swift
//  Global_Kinetics
//
//  Created by Sibusiso Sibisi on 2022/01/31.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var onwerName: UILabel!
    
    static let cellIdentifier = "QuestionTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "QuestionTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
        contentView.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
