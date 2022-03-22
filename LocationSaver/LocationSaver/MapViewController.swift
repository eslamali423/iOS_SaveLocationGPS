//
//  MapViewController.swift
//  LocationSaver
//
//  Created by Eslam Ali  on 21/03/2022.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    var locationManager = CLLocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveButton(_ sender: Any) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MapViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location  = locations.last
        print(location)
      
        Places.shared.userLat = location?.coordinate.latitude   ?? 0.0
        Places.shared.userLon = location?.coordinate.longitude ?? 0.0
        
        
        let center =  CLLocationCoordinate2D (latitude:(location?.coordinate.latitude)! , longitude: (location?.coordinate.longitude)!)
        let region = MKCoordinateRegion(center : center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        map.setRegion (region, animated: true)
        map.showsUserLocation = true
    }
    
    func locationManager(_ manager: CLLocationManager, didFinishDeferredUpdatesWithError error: Error?) {
        print("somethin went wrong", error?.localizedDescription)
    }
    
}
