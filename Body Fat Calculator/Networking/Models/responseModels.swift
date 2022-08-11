//
//  AnnotatedModel.swift
//  Body Fat Calculator
//
//  Created by Michael Green on 2022-07-22.
//

import Foundation
import CoreLocation

struct ServerResponse: Codable {
    let htmlAttributions: [String]
    let nextPageToken: String
    let results: [Business]
    
    enum CodingKeys: String, CodingKey {
        case htmlAttributions = "html_attributions"
        case nextPageToken = "next_page_token"
        case results
    }
}

// MARK: - Business
struct Business: Codable, Identifiable {
    let id = UUID()
    let businessStatus: String
    let geometry: Geometry
    let icon: String
    let iconBackgroundColor: String
    let iconMaskBaseURI: String
    let name: String
    let photos: [Photo]?
    let placeID: String
    let plusCode: PlusCode
    let rating: Double?
    let reference, scope: String
    let types: [String]
    let userRatingsTotal: Int?
    let vicinity: String
    
    enum CodingKeys: String, CodingKey {
        case businessStatus = "business_status"
        case geometry, icon
        case iconBackgroundColor = "icon_background_color"
        case iconMaskBaseURI = "icon_mask_base_uri"
        case name, photos
        case placeID = "place_id"
        case plusCode = "plus_code"
        case rating, reference, scope, types
        case userRatingsTotal = "user_ratings_total"
        case vicinity
    }
}

// MARK: - Geometry
struct Geometry: Codable {
    let location: Location
    let viewport: Viewport
}

// MARK: - Location
struct Location: Codable {
    let lat, lng: Double
}

// MARK: - Viewport
struct Viewport: Codable {
    let northeast, southwest: Location
}

// MARK: - Photo
struct Photo: Codable {
    let height: Int
    let htmlAttributions: [String]
    let photoReference: String
    let width: Int
    
    enum CodingKeys: String, CodingKey {
        case height
        case htmlAttributions = "html_attributions"
        case photoReference = "photo_reference"
        case width
    }
}

// MARK: - PlusCode
struct PlusCode: Codable {
    let compoundCode, globalCode: String
    
    enum CodingKeys: String, CodingKey {
        case compoundCode = "compound_code"
        case globalCode = "global_code"
    }
}

