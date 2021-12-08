//
//  CosolidationWeatherModel.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 04/12/21.
//


// MARK: - CosolidationWeather
struct CosolidationWeatherModel: Codable {
    let consolidatedWeather: [ConsolidatedWeather]
    let title, locationType: String
    let woeid: Int

    enum CodingKeys: String, CodingKey {
        case consolidatedWeather = "consolidated_weather"
        case title
        case locationType = "location_type"
        case woeid
    }
}

// MARK: - ConsolidatedWeather
struct ConsolidatedWeather: Codable {
    let id: Int
    let weatherStateName, weatherStateAbbr: String
    let minTemp, maxTemp, theTemp: Double


    enum CodingKeys: String, CodingKey {
        case id
        case weatherStateName = "weather_state_name"
        case weatherStateAbbr = "weather_state_abbr"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case theTemp = "the_temp"
        
    }
}
