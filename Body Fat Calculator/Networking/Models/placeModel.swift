//
//  placeModel.swift
//  Body Fat Calculator
//
//  Created by Michael Green on 2022-07-31.
//

import Foundation

struct PlaceModel: Decodable{
    var name: String
    var coordinate: Coordinate
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case coordinate
    }
}

struct Coordinate {
    var latitude: Double
    var longitude: Double

    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
}

extension Coordinate: Decodable{
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Coordinate.CodingKeys.self)
        latitude = try values.decode(Double.self, forKey: .latitude)
        longitude = try values.decode(Double.self, forKey: .longitude)
    }
}
