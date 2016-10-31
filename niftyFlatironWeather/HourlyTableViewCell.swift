//
//  HourlyTableViewCell.swift
//  niftyFlatironWeather
//
//  Created by Jhantelle Belleza on 10/29/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit

class HourlyTableViewCell: UITableViewCell {

    @IBOutlet weak var hourlySummaryLabel: UILabel!
    @IBOutlet weak var hourlyMinTempLabel: UILabel!
    @IBOutlet weak var hourlyMaxTempLabel: UILabel!
    @IBOutlet weak var hourlyIcon: UIImageView!
    @IBOutlet weak var hourlyTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
