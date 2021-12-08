//
//  CurrentWeatherViewModel.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 05/12/21.
//
import UIKit
import SwiftUI

class WeatherViewModel: ObservableObject {
    
    @Published var model: CosolidationWeatherModel?
    @Published var weatherModel: WeatherModel?
    
    func fetchData(with urlPath: String, completion: @escaping (Bool)->()) {
        Task {
            let success = await fetchLocationData(with: urlPath)
            completion(success)
            
        }
    }
    
    @MainActor
    private func fetchLocationData(with urlPath: String) async -> Bool {
        return await withCheckedContinuation { continuation in
            Task {
                do {
                    let locations = try await Request<SearchLocationModel>.fetchWeatherData(url: urlPath)
                    guard let locationId = locations.first?.woeid else {
                        continuation.resume(returning: false)
                        return
                    }
                    let stringLocationId = String(locationId)
                    let _ = await fetchWheaterData(with: Path.location(id: stringLocationId).url)
                    continuation.resume(returning: true)

                } catch {
                    continuation.resume(returning: false)
                }
            }
        }
    }
    
    @MainActor
    private  func fetchWheaterData(with urlPath: String) async -> Bool {
        return await withCheckedContinuation { continuation in
            Task {
                do {
                    let locations = try await Request<CosolidationWeatherModel>.fetchWeatherData(url: urlPath)
                    model = locations
                    
                    guard let abreviation = locations.consolidatedWeather.first?.weatherStateAbbr else {
                        continuation.resume(returning: false)
                        return
                    }
                    let _ = await featchLargeImage(with: Path.largeImageIcon(abreviation: abreviation).url)
                    continuation.resume(returning: true)
                    
                } catch {
                    
                    continuation.resume(returning: false)
                }
            }
        }
    }
    
    @MainActor
    private  func featchLargeImage(with urlPath: String) async -> Bool {
        return await withCheckedContinuation { continuation in
            Task {
                do {
                    let image = try await RequestImage.fetchImageData(url: urlPath)
                    
                    let theTemp = model?.consolidatedWeather.first?.theTemp
                    let maxTemp = model?.consolidatedWeather.first?.maxTemp
                    let minTemp = model?.consolidatedWeather.first?.minTemp
                    
                    weatherModel = WeatherModel(
                        image: image,
                        city: model?.title ?? "Ops...",
                        currentDegree: covertDobleInString(theTemp),
                        weather: model?.consolidatedWeather.first?.weatherStateName ?? "Ops...",
                        max: covertDobleInString(maxTemp),
                        min: covertDobleInString(minTemp)
                    )
                    continuation.resume(returning: true)
                    
                } catch {
                    continuation.resume(returning: false)
                }
            }
        }
    }
    
    func covertDobleInString(_ double: Double?) -> String {
        guard let number = double else {return ""}
        return String(format: "%.0f", number)
    }
}
