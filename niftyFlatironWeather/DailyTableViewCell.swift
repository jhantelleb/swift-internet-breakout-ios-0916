//
//  DailyTableViewCell.swift
//  niftyFlatironWeather
//
//  Created by Jhantelle Belleza on 10/29/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit

class DailyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dailySummaryLabel: UILabel!
    @IBOutlet weak var dailyMinTempLabel: UILabel!
    @IBOutlet weak var dailyMaxTempLabel: UILabel!
    @IBOutlet weak var dailyIcon: UIImageView!
    @IBOutlet weak var dailyTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
