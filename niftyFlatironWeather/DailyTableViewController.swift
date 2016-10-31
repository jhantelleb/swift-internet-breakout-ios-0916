//
//  DailyTableViewController.swift
//  niftyFlatironWeather
//
//  Created by Jhantelle Belleza on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit

class DailyTableViewController: UITableViewController {

    let store = ForecastDataStore.sharedInstance
    
    let main = ViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        let queue = OperationQueue()
        queue.qualityOfService = .background
        
        queue.addOperation {
            self.store.getRepositoriesFromAPI {
                OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.repositories.dailyDataArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dailyCell", for: indexPath) as! DailyTableViewCell
        cell.dailySummaryLabel?.text = store.repositories.summaryPerDay[indexPath.row]
        cell.dailyIcon?.image = UIImage(named: store.repositories.dailyIcon)
        cell.dailyMinTempLabel?.text = String(describing: store.repositories.dailyTempMin[indexPath.row])
        cell.dailyMaxTempLabel?.text =
            String(describing: store.repositories.dailyTempMax[indexPath.row])
        cell.dailyTime.text = store.repositories.dailyTimeArray[indexPath.row]
        
        return cell
    }
}
