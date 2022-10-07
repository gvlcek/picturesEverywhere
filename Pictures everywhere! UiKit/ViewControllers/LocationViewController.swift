//
//  LocationViewController.swift
//  Pictures everywhere! UiKit
//
//  Created by Guadalupe Vlček on 07/10/2022.
//

import UIKit
import MapKit

class LocationViewController: UIViewController {
    @IBOutlet weak var locationMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabView = tabBarController as? DetailUITabBarController
        let picture = tabView?.picture
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: picture?.latitude ?? 0, longitude: picture?.longitude ?? 0)
        locationMap.addAnnotation(annotation)
        locationMap.showAnnotations([annotation], animated: true)
    }
}
