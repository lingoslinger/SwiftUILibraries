//
//  LibraryDetailView.swift
//  SwiftUILibraries
//
//  Created by Allan Evans on 7/19/23.
//

import SwiftUI
import MapKit

struct LibraryDetailView: View {
    let library: Library
    @State private var region: MKCoordinateRegion
    private var location: CLLocationCoordinate2D
    
    init(library: Library) {
        self.library = library
        let latString = library.location?.latitude ?? ""
        let lonString = library.location?.longitude ?? ""
        let latitude = Double(latString) ?? 0
        let longitude = Double(lonString) ?? 0
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.05)
        _region = State(initialValue: MKCoordinateRegion(center: coordinate, span: span))
        location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 5) {
                Map(coordinateRegion: $region, annotationItems: [library]) { item in
                    MapMarker(coordinate: location) // MapPin was deprecated in iOS 16
                }
                .frame(height: 200, alignment: .top)
                
                Text(library.name)
                Spacer()
            }
        }
        .navigationTitle(library.name)
    }
}

struct LibraryDetailView_Previews: PreviewProvider {
    static var previews: some View {
//        LibraryDetailView()
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
