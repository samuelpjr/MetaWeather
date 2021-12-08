//
//  MetaWeatherTests.swift
//  MetaWeatherTests
//
//  Created by Samuel Pinheiro Junior on 04/12/21.
//

import XCTest
@testable import MetaWeather
import SwiftUI

class MetaWeatherTests: XCTestCase {
    
    let viewmodel =  WeatherViewModel()
   
    func testFetchDataIsSuccess() {
        viewmodel.fetchData(with:  Path.city(name: "London").url) { succes in
            XCTAssertTrue(succes)
        }
    }
    
    func testFetchDataIsFail() {
        viewmodel.fetchData(with:  Path.city(name: "xpto").url) { succes in
            XCTAssertFalse(succes)
        }
    }
    
    func testConvertable() {
        let mockNumber = "10"
        let convertableNumber = viewmodel.covertDobleInString(10)
        XCTAssertEqual(convertableNumber, mockNumber)
        
    }
}
