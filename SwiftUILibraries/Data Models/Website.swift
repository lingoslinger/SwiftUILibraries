//
//  Website.swift
//  SwiftUILibraries
//
//  Created by Allan Evans on 7/14/23.
//

import Foundation

struct Website: Decodable {
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }
}
