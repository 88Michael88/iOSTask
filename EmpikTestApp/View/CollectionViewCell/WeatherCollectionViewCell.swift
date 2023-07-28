//
//  WeatherCollectionViewCell.swift
//  EmpikTestApp
//
//  Created by Michael on 7/26/23.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {

    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var backgroundUIView: UIView!
    @IBOutlet var cellConditionImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundUIView.backgroundColor = UIColor(named: K.ColorNames.ViewColors.colCellBackgroundBlue)!
        self.layer.borderColor = UIColor(named: K.ColorNames.ViewColors.borderBlue)!.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
    }

}
