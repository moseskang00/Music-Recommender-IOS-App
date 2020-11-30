//
//  mapViewController.swift
//  vf
//
//  Created by Moses Kang on 11/29/20.
//

import UIKit
import MapKit

class mapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var myMap: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        let geoCode = CLGeocoder();
        let address = "Tempe";
        CLGeocoder().geocodeAddressString(address, completionHandler:
            { (placemarks, error) in
                let placemark = placemarks![0]
                let location = placemark.location
                let coords = location!.coordinate
                let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                let region = MKCoordinateRegion(center: placemark.location!.coordinate, span: span)
                self.mapView.setRegion(region, animated: true)
                let ani = MKPointAnnotation()
                ani.coordinate = placemark.location!.coordinate
                ani.title = placemark.locality
                ani.subtitle = placemark.subLocality
                self.mapView.addAnnotation(ani)
            })
        //search()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmented(_ sender: Any) {
        switch(myMap.selectedSegmentIndex)
        {
        case 0:
            mapView.mapType = MKMapType.standard
        
        case 1:
            mapView.mapType = MKMapType.satellite
                
        default:
            mapView.mapType = MKMapType.standard
        }

    }
    @IBAction func search(_ sender: Any) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "Music Stores"
        request.region = mapView.region
        let find = MKLocalSearch(request: request)
        find.start { response, _ in
            guard let response = response else {
                return
            }
            print( response.mapItems )
            var matchingItems:[MKMapItem] = []
            matchingItems = response.mapItems
            for i in 1...matchingItems.count - 1
            {
                let place = matchingItems[i].placemark
                print(place.location?.coordinate.latitude as Any)
                print(place.location?.coordinate.longitude as Any)
                print(place.name as Any)
                let ani = MKPointAnnotation()
                ani.coordinate = place.location!.coordinate
                ani.title = place.name
                self.mapView.addAnnotation(ani)
            }
           
        }
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
