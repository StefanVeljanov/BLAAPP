import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation
import GooglePlacesSearchController
import CoreLocation

class ViewControllerCreateRide: UIViewController,CLLocationManagerDelegate{
    
    @IBAction func autocompleteClicked(_ sender: UIButton) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self as? GMSAutocompleteViewControllerDelegate
        present(autocompleteController, animated: true, completion: nil)
    }
   
    
    let GoogleSearchAPIkey = "AIzaSyB8pBcZ3_8llM-yKrnDll6g9EtGTQIL1Kw"
    var locationManager = CLLocationManager()
    @IBOutlet weak var map1: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       initializeTheLocationManager()
        self.map1.isMyLocationEnabled = true
        //self.tabBarController?.tabBar.isHidden = true
        
        let camera = GMSCameraPosition.camera(withLatitude:41.996735, longitude: 21.43141, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: self.map1.frame, camera: camera)
        mapView.isMyLocationEnabled = true
        
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 41.99646, longitude: 21.43141)
        marker.title = "Skopje"
        marker.snippet = "Macedonia"
        marker.map = map1
    }
    
    
    func initializeTheLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locationManager.location?.coordinate
        cameraMoveToLocation(toLocation: location)
        
        
    }
    func cameraMoveToLocation(toLocation: CLLocationCoordinate2D?) {
        if toLocation != nil {
            map1.camera = GMSCameraPosition.camera(withTarget: toLocation!, zoom: 15.0)
        }
    }
    
    
    func checkLocationServices() {
        
        locationManager.delegate = self
        
        if CLLocationManager.locationServicesEnabled() {
            switch (CLLocationManager.authorizationStatus()) {
            case .authorizedAlways, .authorizedWhenInUse:
                locationManager.startUpdatingLocation()
                break
            case .denied,.notDetermined,.restricted:
                locationManager.requestWhenInUseAuthorization()
                break
            }
        }
        
        
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
            break
        case .notDetermined, .restricted:
            locationManager.requestWhenInUseAuthorization()
            break
        case .denied:
            break
        }
    }
    
    
}
