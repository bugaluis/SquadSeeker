import MapKit
import Firebase

class UserAnnotation: NSObject, MKAnnotation  {
    
    var coordinate: CLLocationCoordinate2D
    var highScore: Int!
    
    init(document: DocumentSnapshot) {
        let dict = document.data()!
        let geoPoint = dict["location"] as! GeoPoint
        coordinate = CLLocationCoordinate2D(latitude: geoPoint.latitude, longitude: geoPoint.longitude)
        highScore = dict["Highscore"] as! Int
        
// NEED TO LIST make them variables list them underneath the snapshot eg
    }
    
}
//Dict in a funct google dictionary in swift
// Use a dictionary to store all aspects of the user info

