import MapKit
import Firebase

class UserAnnotation: NSObject, MKAnnotation  {
    
    var coordinate: CLLocationCoordinate2D
    
    init(document: DocumentSnapshot) {
        let dict = document.data()!
        let geoPoint = dict["location"] as! GeoPoint
        coordinate = CLLocationCoordinate2D(latitude: geoPoint.latitude, longitude: geoPoint.longitude)
    }
    
} 
//

