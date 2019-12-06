//
//  FactoryViewController.swift
//  AppRestoration
//
//  Created by Julio Collado on 12/4/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class FactoryViewController {
    
    func getViewController(for key: String) -> UIViewController? {
        switch key {
        case Constants.ViewControllerStateIdentifiers.reportDetailViewController:
            return ReportDetailViewController.loadFromStoryboard()
        case Constants.ViewControllerStateIdentifiers.addReportViewController:
            return AddReportViewController.loadFromStoryboard()
        default:
            return nil
        }
        
    }
}
