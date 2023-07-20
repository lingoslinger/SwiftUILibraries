//
//  LibraryMapView.swift
//  SwiftUILibraries
//
//  Created by Allan Evans on 7/19/23.
//

import SwiftUI
import MapKit

struct LibraryMapView: View {
    let library: Library
    @State private var region: MKCoordinateRegion
    
    
    init(library: Library) {
        self.library = library
        let latString = library.location?.latitude ?? ""
        let lonString = library.location?.longitude ?? ""
        let latitude = Double(latString) ?? 0
        let longitude = Double(lonString) ?? 0
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.05)
        _region = State(initialValue: MKCoordinateRegion(center: coordinate, span: span))
        self.library.mapLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [library]) { item in
            MapMarker(coordinate: library.mapLocation) // MapPin is deprecated in iOS 16
        }
    }
}

struct LibraryMapView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryMapView(library: previewLibrary)
    }
}
