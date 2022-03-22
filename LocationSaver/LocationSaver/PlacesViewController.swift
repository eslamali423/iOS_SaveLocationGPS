//
//  PlacesViewController.swift
//  LocationSaver
//
//  Created by Eslam Ali  on 21/03/2022.
//

import UIKit
import RealmSwift
import CoreLocation
import MapKit

class PlacesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    let realm = try! Realm()

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear( true)
        let landmark =  realm.objects(Landmark.self)
        Places.shared.landmarks = landmark
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate =  self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let landmark = Places.shared.landmarks else {
            return 0
        }
        return landmark.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlacesTableViewCell
        cell.nameLabel.text = Places.shared.landmarks[indexPath.row].name
        cell.descriptionLabel.text = Places.shared.landmarks[indexPath.row].desc
        cell.timeLable.text = DateFormatter.localizedString(from: Places.shared.landmarks[indexPath.row].time, dateStyle: .short, timeStyle: .short)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openMapForPlace()
        
    }
    
    //MARK:- OPEN MAP
    
    func openMapForPlace() {
        
       
        
        let latitude:CLLocationDegrees = 0.0
        let longitude:CLLocationDegrees = 0.0
        
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
       // mapItem.name = "\(self.venueName)"
        mapItem.openInMaps(launchOptions: options)
        
    }
    
    
}
