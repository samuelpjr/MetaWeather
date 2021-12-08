//
//  SearchView.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 07/12/21.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var weatherViewModel = WeatherViewModel()
    @State var cityName: String
    @State var activeSheet: Sheets? = nil
    @State var complete: Bool = false
    @State var inProgress: Bool = false
    
    var body: some View {
        VStack {
            Search(cityName: $cityName)
                .padding([.trailing], 20)
                .padding([.top], 150)
            
            AsyncButton(isComplete: complete, inProgress: $inProgress, action: {
                self.fetchData()
            }) {
                Text(complete || inProgress ? "" : "Search")
            }
            .padding([.leading, .trailing], 50)
        }
        .fullScreenCover(item: $activeSheet) {
            inProgress = false
            complete = false
        } content: { sheet in
            switch sheet {
            case .weather:
                if let weatherData = weatherViewModel.weatherModel {
                    ContainerWeatherView(data: weatherData)
                }
            case .error:
                ErrorView()
            }
        }

        Spacer()
    }
    
    func fetchData() {
        weatherViewModel.fetchData(with: Path.city(name: cityName).url) { success in
            complete = true
            activeSheet = success ? .weather : .error
            cityName = ""
        }
    }
}

enum Sheets: Identifiable {
    case weather
    case error
    
    var id: String {
        String(describing: self)
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(cityName: "Kitchener")
            .background(Color.blue)
    }
}
