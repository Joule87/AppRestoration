//
//  Loadable.swift
//  AppRestoration
//
//  Created by Julio Collado on 12/4/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

protocol Loadable {
    static func loadFromStoryboard() -> UIViewController?
}
