//
//  ApiRepository.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 05/12/21.
//

import UIKit

struct Request<T: Codable> {
    static func fetchWeatherData(url: String) async throws -> T {

        guard let url = URL(string: url) else {
            throw APIError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
         let decodableData = try JSONDecoder().decode(T.self, from: data)
        return decodableData
    }
}

struct RequestImage {
    static func fetchImageData(url: String) async throws -> UIImage {

        guard let url = URL(string: url) else {
            throw APIError.invalidURL
        }

        let task: Task<UIImage, Error> = Task {
            let (imageData, _) = try await URLSession.shared.data(from: url)
            let image = UIImage(data: imageData)!
            return image
        }
       
        let image = try await task.value
        
        return image
    }
}
