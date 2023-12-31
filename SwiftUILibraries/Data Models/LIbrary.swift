//
//  LIbrary.swift
//  SwiftUILibraries
//
//  Created by Allan Evans on 7/14/23.
//

import Foundation
import MapKit

class Library: Decodable, Identifiable, Hashable {
    let address : String?
    let city : String?
    let hoursOfOperation : String?
    let location : Location?
    let name : String
    let phone : String?
    let state : String?
    let website : Website?
    let zip : String?
    let id: Int
    var mapLocation: CLLocationCoordinate2D
    
    enum CodingKeys: String, CodingKey {
        case address = "address"
        case city = "city"
        case hoursOfOperation = "hours_of_operation"
        case location = "location"
        case name = "name_"
        case phone = "phone"
        case state = "state"
        case website = "website"
        case zip = "zip"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        hoursOfOperation = try values.decodeIfPresent(String.self, forKey: .hoursOfOperation)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        website = try values.decodeIfPresent(Website.self, forKey: .website)
        zip = try values.decodeIfPresent(String.self, forKey: .zip)
        id = Date().hashValue
        mapLocation = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
    }
    
    static func == (lhs: Library, rhs: Library) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
