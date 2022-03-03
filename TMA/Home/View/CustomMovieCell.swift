//
//  CustomMovieCell.swift
//  TMA
//
//  Created by Antonio Espino Muñoz on 3/3/22.
//

import UIKit

class CustomMovieCell: UITableViewCell {

    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var descriptionMovie: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
