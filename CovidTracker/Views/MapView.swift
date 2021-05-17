import UIKit
import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    @Binding var countryData: [CountryData]

    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        var pins: [Pin] = []

        for data in countryData {
            guard let latitude = data.latitude, let longitude = data.longitude else { continue }

            let title = data.country + "\n Confirmed " + data.confirmed.formatNumber() + "\n Death " + data.deaths.formatNumber()
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

            pins.append(Pin(title: title, coordinate: coordinate))
        }

        uiView.annotations.forEach { uiView.removeAnnotation($0) }
        uiView.addAnnotations(pins)
    }

    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        return MKMapView()
    }
}

final class Pin: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D

    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
