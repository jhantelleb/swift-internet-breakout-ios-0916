//
//  ForecastDataStore.swift
//  niftyFlatironWeather
//
//  Created by Jhantelle Belleza on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation

class ForecastDataStore {
    
    static let sharedInstance = ForecastDataStore()
    
    var repositories = ForecastObject()
    
    var dailyWeather = [String: Any]()
    var hourlyWeather = [String:Any]()
    var dailyWeatherData = [String: Any]()
    var hourlyWeatherData = [String:Any]()
    
    var latitude = Double()
    var longitude = Double()
    
    func getRepositoriesFromAPI(_ completion: @escaping () -> ()) {

        ForecastAPIClient.generateResponseJSON(latitude: self.latitude, longitude: self.longitude) { repos in
            self.repositories = ForecastObject(dictionary: repos)
            print(self.repositories)
            completion()
        }
       
    }
}

enum Forecast {
    case daily, hourly
}
