//
//  ApiHandler.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 04/12/21.
//

enum APIError: Error {

    case requestFailed(description: String)
    case jsonConversionFailure(description: String)
    case invalidData
    case responseUnsuccessful(description: String)
    case jsonParsingFailure
    case noInternet
    case failedSerialization
    case invalidURL

    var customDescription: String {
        switch self {
        case let .requestFailed(description): return "Request Failed error -> \(description)"
        case .invalidData: return "Invalid Data error)"
        case let .responseUnsuccessful(description): return "Response Unsuccessful error -> \(description)"
        case .jsonParsingFailure: return "JSON Parsing Failure error)"
        case let .jsonConversionFailure(description): return "JSON Conversion Failure -> \(description)"
        case .noInternet: return "No internet connection"
        case .failedSerialization: return "serialization print for debug failed."
        case .invalidURL: return "Invalid URL"
        }
    }
}
