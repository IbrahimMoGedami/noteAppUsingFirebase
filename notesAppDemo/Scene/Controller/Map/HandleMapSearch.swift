//
//  HandleMapSearch.swift
//  notesAppDemo
//
//  Created by Ibrahim Mo Gedami on 06/02/2021.
//

import UIKit
import MapKit

extension MapVC : HandleMapSearch {
    
    
    func dropPinZoomIn(placemark: MKPlacemark) {
        
        // cache the pin
        selectedPin = placemark
        
        // clear existing pins
    
        if let annotations = self.myMapView?.annotations {
            for _annotation in annotations {
                if let annotation = _annotation as? MKAnnotation
                {
                    self.myMapView.removeAnnotation(annotation)
                }
            }
        }
        
        let annotiation = MKPointAnnotation()
        annotiation.coordinate = placemark.coordinate
        annotiation.title = placemark.name
        self.lat = placemark.coordinate.latitude
        self.long = placemark.coordinate.longitude
        print("\(self.long)\n\(self.lat)")
        
        if let city = placemark.locality ,
            let state = placemark.administrativeArea {
            annotiation.subtitle = "\(city) , \(state)"
            DispatchQueue.main.async {
                self.locationTitle = "\(city) , \(state)"
                print(self.locationTitle)
            }
        }
        DispatchQueue.main.async {
            self.myMapView.addAnnotation(annotiation)
        }
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: placemark.coordinate, span: span)
        myMapView.setRegion(region, animated: true)
        self.navigationController?.isNavigationBarHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            print((self.locationTitle))
            self.delgate?.getLocationTitle(title: self.locationTitle)
            self.navigationController?.popViewController(animated: true)
        }
    }
}

