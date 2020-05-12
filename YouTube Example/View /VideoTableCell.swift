//
//  VideoTableCell.swift
//  YouTube Example
//
//  Created by AshutoshD on 22/04/20.
//  Copyright © 2020 ravindraB. All rights reserved.
//

import UIKit

class VideoTableCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblSubTitlte: UILabel!
    @IBOutlet weak var backView: UIView!
    
    var video : Video? {
        didSet{
            
        lblTitle.text = video?.title
        lblSubTitlte.text = video?.subtitle
        let image = UIImage(named: (video?.thumbURL.path)!)
        imgView.image = image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
