//
//  NetworkingLayer.swift
//  Body Fat Calculator
//
//  Created by Michael Green on 2022-07-22.
//

import Foundation

class NetworkingLayer {

    func getPlaces() {
        let longitudeX = "-122.735960"
        let latitudeY = "49.252400"

        let url = URL(string:"https://maps.googleapis.com/maps/api/place/nearbysearch/json?fields=name%2Cgeometry&location=\(latitudeY),\(longitudeX)&radius=15000&types=gym&key=AIzaSyDO6e22zBmz5ncD4uOTpS6JmstqW2XmSRE")!

        let session = URLSession.shared

        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(String(describing: error))
            } else {

                if let data = data,
                let response = response as? HTTPURLResponse,
                   (200...299).contains(response.statusCode) {
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments])
                        //print("THE JSON")
                        //print(json)
                    }
                    catch {
                        print(error)
                    }
                    
                    //print(url)
                    //let unwrappedData = self.deserialize(data: data)
                    //print("data is: \n \(unwrappedData)")
                }
            }
        }

        task.resume()
    }
}
