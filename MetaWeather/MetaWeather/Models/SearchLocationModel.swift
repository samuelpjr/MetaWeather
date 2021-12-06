//
//  Model.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 04/12/21.
//

import Foundation


struct SearchLocationElement: Codable {
    let title: String?
    let locationType: LocationType?
    let woeid: Int?
    let lattLong: String?

    enum CodingKeys: String, CodingKey {
        case title
        case locationType = "location_type"
        case woeid
        case lattLong = "latt_long"
    }
}

enum LocationType: String, Codable {
    case city = "City"
}

typealias SearchLocationModel = [SearchLocationElement]
