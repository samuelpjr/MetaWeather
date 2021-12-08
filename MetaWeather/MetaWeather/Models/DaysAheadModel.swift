//
//  DaysAheadModel.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 04/12/21.
//

import Foundation

// MARK: - DaysAheadModelElement
struct DaysAheadModelElement: Codable {
    let id: Int?
    let weatherStateName: String?
    let weatherStateAbbr: String?
    let minTemp, maxTemp, theTemp: Double?


    enum CodingKeys: String, CodingKey {
        case id
        case weatherStateName = "weather_state_name"
        case weatherStateAbbr = "weather_state_abbr"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case theTemp = "the_temp"
    }
}

typealias DaysAheadModel = [DaysAheadModelElement]
