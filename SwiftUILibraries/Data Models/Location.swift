//
//  Location.swift
//  SwiftUILibraries
//
//  Created by Allan Evans on 7/14/23.
//

import Foundation

struct Location: Decodable {
    let latitude: String?
    let longitude: String?
    let needsRecoding: Bool?
    
    enum CodingKeys: String, CodingKey {
        case latitude = "latitude"
        case longitude = "longitude"
        case needsRecoding = "needs_recoding"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
        needsRecoding = try values.decodeIfPresent(Bool.self, forKey: .needsRecoding)
    }
}
