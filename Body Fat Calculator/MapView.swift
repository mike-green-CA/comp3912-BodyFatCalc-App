//
//  MapView.swift
//  Body Fat Calculator
//
//  Created by Michael Green on 2022-07-21.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject var viewModel = BusinessService()
    @EnvironmentObject var viewModelLoc : LocationViewModel
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 49.250944, longitude: -122.759012), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))

    
    private var gymsNearBy = [AnnotatedItem]()
    
    func getAnnotatedItems() -> [AnnotatedItem] {
        for buisness in viewModel.businessList {
            print(buisness)
        }
        
        return []
    }
    
    var body: some View {
     
        Map(coordinateRegion: $viewModelLoc.region, annotationItems: viewModel.gymsNearBy) { item in
                MapMarker(coordinate: item.coordinate, tint: .red)
            }
            .edgesIgnoringSafeArea(.all)
        
        .task {
            do {
                try await viewModel.getData2(lat: viewModelLoc.region.center.latitude, lon: viewModelLoc.region.center.longitude)
            } catch{
                print("---> ContentView error: \(error)")
            }
        }
    }
}

class BusinessService: ObservableObject{
    @Published var businessList: [Business] = []
    @Published var gymsNearBy: [AnnotatedItem] = []
    
    func getData2(lat: Double, lon: Double) async throws {
        if let url = URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(lat),\(lon)&radius=15000&types=gym&key=AIzaSyDO6e22zBmz5ncD4uOTpS6JmstqW2XmSRE") {
            let (data, _) = try await URLSession.shared.data(from: url)
            Task{@MainActor in
                let responseData = try JSONDecoder().decode(ServerResponse.self, from: data)
                self.businessList = responseData.results
                //print("RESPONSE DATA - results: \(responseData.results)")
                //print("TEST FOR BUSINESS DATA")
                for business in businessList {
                    let annoItem = AnnotatedItem(name: business.name, coordinate: .init(latitude: business.geometry.location.lat, longitude: business.geometry.location.lng))
                    gymsNearBy.append(annoItem)
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
        static var previews: some View {
            MapView()
        }
}


