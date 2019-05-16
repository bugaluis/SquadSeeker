import UIKit
import MapKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    

    @IBOutlet weak var mapView: MKMapView!
    
    
    @IBAction func filter(_ sender: UIButton) {
    }
    @IBAction func showAll(_ sender: UIButton) {
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        mapView.delegate = self
        watch()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resource that can be recreated.
    }

    
    //add user annotations
    func createAnnotations(documents: [DocumentSnapshot]) {
        mapView.removeAnnotations(mapView.annotations)
        for document in documents {
            let annotation = UserAnnotation(document: document)
            mapView.addAnnotation(annotation)
        }
    }
    func watch() {
        let ref = Firestore.firestore().collection("locations")
        ref.addSnapshotListener { snapshot, error in
            self.createAnnotations(documents: snapshot!.documents)
        }
    }
    
    func save(location: CLLocation) {
        let ref = Firestore.firestore().collection("locations").document("NAME")
        let geoPoint = GeoPoint(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        ref.setData(["location": geoPoint])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ProfileVC
        vc.annotation = sender as? UserAnnotation
//        dismiss(animated:true, completion: nil)
    }
    // the dismiss allows the app to not crash due to the staking up of view controllers since all these view controllers take up memory
    
}

//button func reset() {
//    remove annotations
//mapView.addAnnotation(annotation)
//}
// If we had more time we would have created more users then created a filter search 
//fbutton unc filterSearch() {
//    if statement
//
//}

extension ViewController:CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        save(location: locations.last!)
        
        
    }
    
}

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? UserAnnotation else { return }
        performSegue(withIdentifier: "profile", sender: annotation)
        mapView.deselectAnnotation(annotation, animated: true)
}
    
}
