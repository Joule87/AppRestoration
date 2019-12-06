//
//  RestorableBaseViewController.swift
//  AppRestoration
//
//  Created by Julio Collado on 12/6/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class RestorableBaseViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func updateUserActivityState(_ activity: NSUserActivity) {
        super.updateUserActivityState(activity)
        applyUserActivityEntries(activity)
    }
    
    override func restoreUserActivityState(_ activity: NSUserActivity) {
        super.restoreUserActivityState(activity)
        
        // Check if the activity is of our type.
        if activity.activityType == activityType {
            // Get the user activity data.
            if let activityUserInfo = activity.userInfo {
                restoreItemInterface(activityUserInfo)
            }
        }
    }
    
    func applyUserActivityEntries(_ activity: NSUserActivity) {
        
    }
    
    func restoreItemInterface(_ activityUserInfo: [AnyHashable : Any]) {
        
    }

}

extension RestorableBaseViewController: Restorable {
    
    var detailUserActivity: NSUserActivity {
        let userActivity = NSUserActivity(activityType: activityType)
        userActivity.title = "Restore Item"
        applyUserActivityEntries(userActivity)
        return userActivity
    }
    
}
