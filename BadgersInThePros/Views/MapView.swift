//
//  MapView.swift
//  BadgersInThePros
//
//  Created by Sasha on 2/17/21.
//

import SwiftUI
import MapKit


struct MapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 38.980584, longitude: -95), span: MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 90))
    
    private let places: [Location] = [
        Location(name: "TJ Watt", coordinate: CLLocationCoordinate2D(latitude: 40.446681, longitude: -80.015767), tint: .yellow, image: UIImage(named: "steeler")!),
        Location(name: "JJ Watt", coordinate: CLLocationCoordinate2D(latitude: 29.684744, longitude: -95.410874), tint: .red, image: UIImage(named: "texan")!),
        Location(name: "Rose Lavelle", coordinate: CLLocationCoordinate2D(latitude: 53.285200, longitude: -2.113400), tint: .white, image: UIImage(named: "city")!),
        Location(name: "Jonathan Taylor", coordinate: CLLocationCoordinate2D(latitude: 39.760066, longitude: -86.163948), tint: .blue, image: UIImage(named: "colt")!),
        Location(name: "Brian Elliot", coordinate: CLLocationCoordinate2D(latitude: 39.901193, longitude: -75.171958), tint: .orange, image: UIImage(named: "flyer")!)
    
    ]

    
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: places) { place in
            MapAnnotation(coordinate: place.coordinate) {
                Image(uiImage: place.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 25)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 25/10))
                    .shadow(radius: 10)
            }
        }
    

    }
}

struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
    var tint: Color
    var image: UIImage
}









struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
