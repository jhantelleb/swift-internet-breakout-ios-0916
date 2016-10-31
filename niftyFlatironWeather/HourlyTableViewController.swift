//
//  HourlyTableViewController.swift
//  niftyFlatironWeather
//
//  Created by Jhantelle Belleza on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit

class HourlyTableViewController: UITableViewController {
    
    var store = ForecastDataStore.sharedInstance
    let main = ViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        main.viewDidLoad()
        store.getRepositoriesFromAPI {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.repositories.hourlyDataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "hourlyCell", for: indexPath) as! HourlyTableViewCell
        cell.hourlySummaryLabel.text = store.repositories.summaryPerHour[indexPath.row] as String?
        //cell.hourlyIcon.image = UIImage(named: store.repositories.hourlyIcon )
        cell.hourlyMinTempLabel.text =
            String(store.repositories.hourlyTemperature[indexPath.row])
        cell.hourlyMaxTempLabel.text =
            String(store.repositories.hourlyApparentTemp[indexPath.row])
        cell.hourlyTime.text = store.repositories.hourlyTimeArray[indexPath.row]
        return cell
    }

}
