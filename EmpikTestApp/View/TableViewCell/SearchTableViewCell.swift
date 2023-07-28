//
//  SearchTableViewCell.swift
//  EmpikTestApp
//
//  Created by Michael on 7/28/23.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet var resultTextLabel: UILabel!
    @IBOutlet var backgroundUIView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundUIView.layer.cornerRadius = 10
        backgroundUIView.layer.backgroundColor = UIColor(named: K.ColorNames.ViewColors.colCellBackgroundBlue)!.cgColor
        backgroundUIView.layer.borderWidth = 1
        backgroundUIView.layer.borderColor = UIColor(named: K.ColorNames.ViewColors.borderBlue)!.cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
