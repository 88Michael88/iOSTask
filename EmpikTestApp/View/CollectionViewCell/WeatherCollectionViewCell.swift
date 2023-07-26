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
    @IBOutlet var cellConditionImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
