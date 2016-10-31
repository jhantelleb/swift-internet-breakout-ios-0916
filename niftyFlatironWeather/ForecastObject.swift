//
//  ForecastObject.swift
//  niftyFlatironWeather
//
//  Created by Jhantelle Belleza on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation

class ForecastObject{
    
    //Daily -> Daily Summary, Icon, tempMin/tempMAx
    var dailySummary: String = ""
    var dailyIcon: String = ""
    var summaryPerDay: [String] = []
    var dailyDataArray = [[String:Any]]()
    var hourlyDataArray = [[String:Any]]()
    var dailyTempMin: [Double] = []
    var dailyTempMax: [Double] = []
    
    //Hourly -> 
    var hourlySummary: String = ""
    var summaryPerHour: [String] = []
    var hourlyIcon: String = ""
    var hourlyTemperature: [Double] = []
    var hourlyApparentTemp: [Double] = []

    var dailyTimeArray: [String] = []
    var hourlyTimeArray: [String] = []
    
    init() {
        
    }
    
    init(dictionary: [String: Any]) {
        let daily = dictionary["daily"] as! [String:Any] //Type Any all data from daily
         //Array of dictionaries
    
        self.dailySummary = daily["summary"] as! String
        self.dailyIcon = daily["icon"] as! String
        dailyDataArray = daily["data"] as! [[String : Any]]
        for data in dailyDataArray {
            self.summaryPerDay.append(data["summary"] as! String)
            self.dailyTempMin.append(data["temperatureMin"] as! Double)
            self.dailyTempMax.append(data["temperatureMax"] as! Double)
            self.dailyTimeArray.append(formatTime(time: data["time"] as! Double, type: .daily))
        }
        
        let hourly = dictionary["hourly"] as! [String:Any]
      
        self.hourlySummary = hourly["summary"] as! String
        self.hourlyIcon = hourly["icon"] as! String
        hourlyDataArray = hourly["data"] as! [[String : Any]]
        
        for data in hourlyDataArray {
            self.summaryPerHour.append(data["summary"] as! String)
            self.hourlyTemperature.append(data["temperature"] as! Double)
            self.hourlyApparentTemp.append(data["apparentTemperature"] as! Double)
            self.hourlyTimeArray.append(formatTime(time: data["time"] as! Double, type: .hourly))
        }
    }
    
    func formatTime(time: Double, type: ForecastType) -> String {
        
        let timeObj = Date(timeIntervalSince1970: time)
        let dateFormatter = DateFormatter()
        switch type {
        case .hourly:
            dateFormatter.dateFormat = "ha"
        case .daily:
            dateFormatter.dateFormat = "EE"
        }
        return dateFormatter.string(from: timeObj)
    }
    
    enum ForecastType {
        case hourly, daily
    }
}
