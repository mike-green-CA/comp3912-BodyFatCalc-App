//
//  AnnotatedItem.swift
//  Body Fat Calculator
//
//  Created by Michael Green on 2022-07-21.
//

import Foundation
import MapKit

struct AnnotatedItem: Identifiable {
        let id = UUID()
        var name: String
        var coordinate: CLLocationCoordinate2D
}

