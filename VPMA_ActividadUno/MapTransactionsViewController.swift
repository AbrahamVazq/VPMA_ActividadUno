//
//  MapTransactionsViewController.swift
//  VPMA_ActividadUno
//
//  Created by Abraham Vazquez on 5/23/19.
//  Copyright © 2019 MACBOOK. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapTransactionsViewController: UIViewController {
 
    @IBOutlet weak var mpkMapita: MKMapView!
    
    let locationManager = CLLocationManager()
    let annotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mpkMapita.delegate = self
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingHeading()
        
        let latitude:       CLLocationDegrees = 20.5839797
        let longitude:      CLLocationDegrees = -87.1145768
        
        let latDestiny:     CLLocationDegrees = 19.3632307
        let lonDestiny:     CLLocationDegrees = -99.2317924
        
        let latitudeDelta:  CLLocationDegrees = 0.1
        let longitudeDelta: CLLocationDegrees = 0.1
        ////////////////////////////////////////////////////////////////
        let span       = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let coordinates2 = CLLocationCoordinate2D(latitude: latDestiny, longitude: lonDestiny)
        let region     = MKCoordinateRegion(center: coordinates, span: span)
        ////////////////////////////////////////////////////////////////
        let sourcePlacemark = MKPlacemark.init(coordinate: coordinates)
        let sourceMapItem   = MKMapItem.init(placemark: sourcePlacemark)
        
        let destinationPlacemark = MKPlacemark.init(coordinate: coordinates2)
        let destinationMapItem   = MKMapItem.init(placemark: destinationPlacemark)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source        = sourceMapItem
        directionRequest.destination   = destinationMapItem
        directionRequest.transportType = .automobile
        
        annotation.title = "Occidental at Xcaret Destination"
        annotation.subtitle = "Quiero estar aquí."
        
        annotation.coordinate = coordinates
        mpkMapita.addAnnotation(annotation)
        mpkMapita.selectAnnotation(annotation, animated: true)
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate {
            (response, error) -> Void in
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            let route = response.routes[0]
            self.mpkMapita.addOverlay(route.polyline, level: .aboveRoads)
            let rect = route.polyline.boundingMapRect
            self.mpkMapita.setRegion(MKCoordinateRegion(rect), animated: true)
        }
            
        self.mpkMapita.setRegion(region, animated: true)
        mpkMapita.showsUserLocation = true
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    


}

extension MapTransactionsViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            print("LOCALIZACION")
            print("Latitud:  \(location.coordinate.latitude)")
            print("Longitud: \(location.coordinate.latitude)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error al solicitar la localizacion: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .authorizedAlways:
            print("Autorizado siempre")
        case .authorizedWhenInUse:
            print("Autorizado solo al usar la App")
        case .denied:
            print("Localizacion Denegada")
        case .restricted:
            print("Localizacion Restringid")
        default:
            break
        }
        
    }
}

extension MapTransactionsViewController: MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.orange
        renderer.lineDashPattern = [2,4];
        renderer.lineWidth = 4.0
        renderer.alpha = 1
        return renderer
    }
}
