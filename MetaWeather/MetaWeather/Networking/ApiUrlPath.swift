//
//  ApiUrls.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 05/12/21.
//

enum Path {
    case city(name: String)
    case location(id: String)
    case days(id: String, date: String)
    case largeImageIcon(abreviation: String)
    
    var url: String {
        
        switch self {
        
        case let .city(name): return "\(Base.str.url)api/location/search/?query=\(name)"
        case let .location(id): return "\(Base.str.url)api/location/\(id)/"
        case let .days(id, date): return "\(Base.str.url)api/location/\(id)/\(date)/"
        case let .largeImageIcon(abreviation): return "\(Base.str.url)static/img/weather/png/\(abreviation).png"
        }
    }
}

enum Base {
    case str
    
    var url: String {
        return "https://www.metaweather.com/"
    }
}
