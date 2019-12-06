//
//  Report.swift
//  AppRestoration
//
//  Created by Julio Collado on 12/3/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import Foundation

class Report {
    var reportNumber: String
    var content: String
    
    init(reportNumber: String, content: String) {
        self.reportNumber = reportNumber
        self.content = content
    }
}
