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
    
    // MARK: - UIUserActivityRestoring
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
    
    // MARK: - State Restoration (UIStateRestoring)
    /// - Tag: encodeRestorableState
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        
        let encodedActivity = NSUserActivityEncoder(detailUserActivity)
        coder.encode(encodedActivity, forKey: Constants.ViewControllerStateIdentifiers.viewControllerRestorationIdentifier)
    }
    
    /// - Tag: decodeRestorableState
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        
        if coder.containsValue(forKey: Constants.ViewControllerStateIdentifiers.viewControllerRestorationIdentifier) {
            if let decodedActivity = coder.decodeObject(forKey: Constants.ViewControllerStateIdentifiers.viewControllerRestorationIdentifier) as? NSUserActivityEncoder {
                if let activityUserInfo = decodedActivity.userActivity.userInfo {
                    restoreItemInterface(activityUserInfo)
                }
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
