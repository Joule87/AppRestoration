//
//  Restorable.swift
//  AppRestoration
//
//  Created by Julio Collado on 12/4/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import Foundation

protocol Restorable {
    var detailUserActivity: NSUserActivity { get }
    var activityType: String { get }
}

extension Restorable {
    var activityType: String {
        let activityType = ""
        
        // Load our activity type from our Info.plist.
        if let activityTypes = Bundle.main.infoDictionary?["NSUserActivityTypes"] {
            if let activityArray = activityTypes as? [String] {
                return activityArray[0]
            }
        }
        
        return activityType
    }
}
