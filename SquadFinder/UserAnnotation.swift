import MapKit
import Firebase

class UserAnnotation: NSObject, MKAnnotation  {
    
    var coordinate: CLLocationCoordinate2D
    var highScore: String!
    var gamerTag: String!
    var topGame: String!
    var gamesConsole: String!
    
    init(document: DocumentSnapshot) {
        let dict = document.data()!
        let geoPoint = dict["location"] as! GeoPoint
        coordinate = CLLocationCoordinate2D(latitude: geoPoint.latitude, longitude: geoPoint.longitude)
        highScore = dict["highScore"] as? String
        gamerTag = dict["gamerTag"] as? String
        topGame = dict["topGame"] as? String
        gamesConsole = dict["gamesConsole"] as? String
    
//        if let highScore = dict["highScore"] as? String {
//            self.highScore = highScore
//        }
//
//make them variables list them underneath the snapshot eg
    }
    
}
//Dict in a function google - dictionary in swift
// Use a dictionary to store all aspects of the user info
// Has to match the information in Firebase

