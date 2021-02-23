//
//  BadgerPros.swift
//  BadgersInThePros
//
//  Created by Sasha on 2/17/21.
//

import Foundation
import MapKit




struct BadgerPros: Decodable {
    let name: String
    let image: String
    let instagram: String
    let location: CLLocation
    private let regionRadius: CLLocationDistance = 10000
    let region: MKCoordinateRegion


init(from decoder: Decoder) throws {
    
    enum CodingKey: Swift.CodingKey {
        case name
        case location
        case image
        case instagram
        case latitude
        case longitude
  
        
    }
    let valuesBP = try decoder.container(keyedBy: CodingKey.self)
    name = try valuesBP.decode(String.self, forKey: .name)
    image = try valuesBP.decode(String.self, forKey: .image)
    instagram = try valuesBP.decode(String.self, forKey: .instagram)
    let latitude = try valuesBP.decode(Double.self, forKey: .latitude)
    let longitude = try valuesBP.decode(Double.self, forKey: .longitude)
    location = CLLocation(latitude: latitude, longitude: longitude)
    region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
    
    
}
}
