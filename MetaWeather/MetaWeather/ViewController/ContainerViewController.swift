//
//  ViewController.swift
//  MetaWeather
//
//  Created by Samuel Pinheiro Junior on 04/12/21.
//

import UIKit
import SwiftUI

class ContainerViewController: UIViewController {
    
    @IBOutlet weak var theContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AddChildrenView()
    }
    
    fileprivate func AddChildrenView() {
        let containerViewData = ContainerSearchView()
        let childView = UIHostingController(rootView: containerViewData)
        addChild(childView)
        childView.view.frame = theContainer.bounds
        childView.view.backgroundColor = .clear
        theContainer.addSubview(childView.view)
        childView.didMove(toParent: self)
    }
}
