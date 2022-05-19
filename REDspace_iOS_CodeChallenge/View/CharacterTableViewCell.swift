//
//  CharacterTableViewCell.swift
//  REDspace_iOS_CodeChallenge
//
//  Created by Harsh on 17/05/22.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    @IBOutlet weak var numberOfEpisodes: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var thumbNail: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCellForItem(result: Result) {
        name.text = "Name : \(result.name ?? "")"
        numberOfEpisodes.text   = "Episodes : \(result.episode.count)"
        thumbNail.load(url:URL(string:result.image ?? "")!)
    }
}
