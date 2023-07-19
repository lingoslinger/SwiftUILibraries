//
//  LibraryDetailView.swift
//  SwiftUILibraries
//
//  Created by Allan Evans on 7/19/23.
//

import SwiftUI

struct LibraryDetailView: View {
    let library: Library
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 5) {
                LibraryMapView(library: library)
                    .frame(height: 200, alignment: .top)
                
                Text(library.address ?? "Address not available")
                Text("Phone: \(library.phone ?? "Phone number not available")")
                Text(library.hoursOfOperation?.formattedHours ?? "Hours not available")
                Spacer()
            }
        }
        .navigationTitle(library.name)
    }
}

struct LibraryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryDetailView(library: previewLibrary)
    }
}
