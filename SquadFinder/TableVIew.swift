//
//  TableVIew.swift
//  SquadFinder
//
//  Created by Luis Burga Mideros (s5109289) on 29/04/2019.
//  Copyright © 2019 George Wilshaw (s5060140). All rights reserved.
//
import MapKit
import Firebase

class UserAnnotation: NSObject, MKAnnotation  {
    
    var coordinate: CLLocationCoordinate2D
    
    var text: String {
        return "\(coordinate.latitude) - \(coordinate.longitude)"
    }
    
    init(document: DocumentSnapshot) {
        let dict = document.data()!
        let geoPoint = dict["location"] as! GeoPoint
        coordinate = CLLocationCoordinate2D(latitude: geoPoint.latitude, longitude: geoPoint.longitude)
    }
    
}
