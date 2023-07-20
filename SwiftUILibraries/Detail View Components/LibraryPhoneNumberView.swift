//
//  LibraryPhoneNumberView.swift
//  SwiftUILibraries
//
//  Created by Allan Evans on 7/19/23.
//

import SwiftUI

struct LibraryPhoneNumberView: View {
    let library: Library
    
    var body: some View {
        let unwrappedPhone = library.phone ?? "Phone number not available"
        if unwrappedPhone == "Phone number not available" {
            Text(unwrappedPhone)
        } else {
            Text("Phone: \(unwrappedPhone)")
        }
    }
}

struct LibraryPhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryPhoneNumberView(library: previewLibrary)
    }
}
