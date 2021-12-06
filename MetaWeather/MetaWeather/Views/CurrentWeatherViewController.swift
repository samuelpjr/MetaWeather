//
//  ViewController.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 04/12/21.
//

import UIKit
import SwiftUI

class CurrentWeatherViewController: UIViewController {
    
    @IBOutlet weak var theContainer: UIView!
    
    var image = UIImage()
    var cosolidationWeatherModel: CosolidationWeatherModel?
    var currentWeatherViewModel: CurrentWeatherViewModel<CurrentWeatherViewController>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentWeatherViewModel = CurrentWeatherViewModel(view: self)
        currentWeatherViewModel?.fetchLocationData(with: Path.city(name: "London").url)
        
    }
    
    func covertDobleInString(_ double: Double?) -> String {
        guard let number = double else {return ""}
        return String(format: "%.0f", number)
    }
    
    func setupUI() {
        
        let theTemp = cosolidationWeatherModel?.consolidatedWeather.first?.theTemp
        let maxTemp = cosolidationWeatherModel?.consolidatedWeather.first?.maxTemp
        let minTemp = cosolidationWeatherModel?.consolidatedWeather.first?.minTemp
        
        let containerViewData = ContainerView(
            image: image,
            city: cosolidationWeatherModel?.title ?? "Ops...",
            currentDegree: covertDobleInString(theTemp),
            weather: cosolidationWeatherModel?.consolidatedWeather.first?.weatherStateName ?? "Ops...",
            max: covertDobleInString(maxTemp),
            min: covertDobleInString(minTemp)
        )
        
        AddChildrenView(containerViewData)
    }
    
    fileprivate func AddChildrenView(_ containerViewData: ContainerView) {
        let childView = UIHostingController(rootView: containerViewData)
        
        addChild(childView)
        childView.view.frame = theContainer.bounds
        childView.view.backgroundColor = .clear
        theContainer.addSubview(childView.view)
        childView.didMove(toParent: self)
    }
}


