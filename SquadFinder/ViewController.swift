import UIKit
import MapKit
import Firebase

class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var tableView: UITableView!
    
    var annotations = [UserAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        watch()
    }
    
    func watch() {
        let ref = Firestore.firestore().collection("locations")
        ref.getDocuments { snapshot, error in
            for document in snapshot!.documents {
                let annotations = UserAnnotation(document: document)
                self.annotations.append(annotations)
                self.tableView.reloadData()
                
                
                
            }
        }
    }
    
    
    func save(location: CLLocation) {
        let ref = Firestore.firestore().collection("locations").document("G")
        let geoPoint = GeoPoint(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        ref.setData(["location": geoPoint])
    }
    
}

extension ViewController:CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        save(location: locations.last!)
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        _ = annotations[indexPath.row]
        // this is where seques happen when you select a row if you want it to appear some where else put segue here
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return annotations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let annotationForCell = annotations[indexPath.row]
            cell.textLabel?.text = annotationForCell.text
            return cell
            
            
    }
    
    
    
}


