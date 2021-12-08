//
//  Model.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 04/12/21.
//

struct SearchLocationElement: Codable {
    let title: String?
    let woeid: Int?

    enum CodingKeys: String, CodingKey {
        case title
        case woeid
    }
}

typealias SearchLocationModel = [SearchLocationElement]
