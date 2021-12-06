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
    let weatherStateName: WeatherStateName?
    let weatherStateAbbr: WeatherStateAbbr?
    let windDirectionCompass, created, applicableDate: String?
    let minTemp, maxTemp, theTemp: Double?
    let windSpeed, windDirection: Double?
    let airPressure, humidity: Int?
    let visibility: Double?
    let predictability: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case weatherStateName = "weather_state_name"
        case weatherStateAbbr = "weather_state_abbr"
        case windDirectionCompass = "wind_direction_compass"
        case created
        case applicableDate = "applicable_date"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case theTemp = "the_temp"
        case windSpeed = "wind_speed"
        case windDirection = "wind_direction"
        case airPressure = "air_pressure"
        case humidity, visibility, predictability
    }
}

enum WeatherStateAbbr: String, Codable {
    case c = "c"
    case lc = "lc"
    case lr = "lr"
}

enum WeatherStateName: String, Codable {
    case clear = "Clear"
    case lightCloud = "Light Cloud"
    case lightRain = "Light Rain"
}

typealias DaysAheadModel = [DaysAheadModelElement]
