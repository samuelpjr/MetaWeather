//
//  CurrentWeatherViewModel.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 05/12/21.
//

import Foundation
import UIKit


class CurrentWeatherViewModel<V: CurrentWeatherViewController> {
    
    private(set) unowned var view: V
    
    required init(view: V) {
        self.view = view
    }
    
    func set(view: V) {
        self.view = view
    }
    
    @MainActor
    func fetchLocationData(with urlPath: String) {
        Task {
            do {
                let locations = try await Request<SearchLocationModel>.fetchWeatherData(url: urlPath)
                guard let locationId = locations.first?.woeid else {
                    return
                }
                let stringLocationId = String(locationId)
                fetchWheaterData(with: Path.location(id: stringLocationId).url)
            } catch {
                print("The error is --- \((error as! APIError).customDescription)")
            }
        }
    }
    
    @MainActor
    func fetchWheaterData(with urlPath: String) {
        Task {
            do {
                let locations = try await Request<CosolidationWeatherModel>.fetchWeatherData(url: urlPath)
                view.cosolidationWeatherModel = locations
                guard let abreviation = locations.consolidatedWeather.first?.weatherStateAbbr else {
                    return
                }
                featchLargeImage(with: Path.largeImageIcon(abreviation: abreviation).url)
            } catch {
                print("The error is --- \((error as! APIError).customDescription)")
            }
        }
    }
    
    @MainActor
    func featchLargeImage(with urlPath: String)  {
        Task {
            do {
                view.image = try await RequestImage.fetchImageData(url: urlPath)
                view.setupUI()
            } catch {
                print("The error is --- \((error as! APIError).customDescription)")
            }
        }
    }
}
