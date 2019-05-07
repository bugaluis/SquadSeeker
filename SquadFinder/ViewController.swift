import UIKit
import MapKit
import Firebase

class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var slogan: UILabel!
    @IBOutlet weak var showAll: UIButton!
    @IBOutlet weak var filter: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        watch()
    }
    
    //add user annotations
    func createAnnotations(snapshot: QuerySnapshot) {
        mapView.removeAnnotations(mapView.annotations)
        for document in snapshot.documents {
            let annotation = UserAnnotation(document: document)
            mapView.addAnnotation(annotation)
        }
    }
    
    func watch() {
        let ref = Firestore.firestore().collection("locations")
        ref.addSnapshotListener { snapshot, error in
            self.createAnnotations(snapshot: snapshot!)
            
        }
    }
    
    func save(location: CLLocation) {
        let ref = Firestore.firestore().collection("locations").document("NAME")
        let geoPoint = GeoPoint(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        ref.setData(["location": geoPoint])
    }
    
}

//button func reset() {
//    remove annotations
//mapView.addAnnotation(annotation)
//}

//fbutton unc filterSearch() {
//    if statement
//
//}

extension ViewController:CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        save(location: locations.last!)
    }
    
}
// ask Kyle about getting the firebase users to appear on the map
// download locations, segues and regions project

