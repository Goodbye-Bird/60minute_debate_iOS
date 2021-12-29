//
//  ChatTableViewCell.swift
//  60_debate_iOS
//
//  Created by 김상은 on 2021/12/29.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var chatLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
