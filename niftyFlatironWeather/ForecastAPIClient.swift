//
//  ForecastAPIClient.swift
//  niftyFlatironWeather
//
//  Created by Jhantelle Belleza on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation

class ForecastAPIClient {
    
    class func generateResponseJSON(latitude: Double, longitude: Double, with completion: @escaping ([String: Any]) -> Void) {
        
        let urlString = "https://api.darksky.net/forecast/\(Secrets.clientKey)/\(latitude),\(longitude)"
        
        let url = URL(string: urlString)
        
        guard let unwrappedURL = url else { return }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            
            guard let unwrappedData = data else { return }
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String: Any]
                
                completion(responseJSON)
                
            } catch {
                print("Shit's Broken")
            }
        }
        dataTask.resume()
    }
}


