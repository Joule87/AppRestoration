//
//  AppDelegate.swift
//  AppRestoration
//
//  Created by Julio Collado on 12/3/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Main Scene", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
}

// MARK: - AppDelegate State Restoration

extension AppDelegate {
    
    /**    Apps must implement this method and the application:shouldSaveApplicationState: method for
         state preservation to occur. In addition, your implementation of this method must return true
         each time UIKit tries to preserve the state of your app. You can return NO to disable state
         preservation temporarily. For example, during testing, you could disable state preservation
         to test specific code paths.
     */
/// - Tag: shouldSaveApplicationState
    func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    /**    Apps must implement this method and the application:shouldRestoreApplicationState: method for
         state preservation to occur. In addition, your implementation of this method must return true
         each time UIKit tries to restore the state of your app. You can use the information in the
         provided coder object to decide whether or not to proceed with state restoration. For example,
         you might return NO if the data in the coder is from a different version of your app and cannot
         be effectively restored to the current version.
    */
/// - Tag: shouldRestoreApplicationState
    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    /**    Store application state data not necessarily related to the user interface, this is called when the app is suspended to the background.
         The state preservation system calls this method at the beginning of the preservation process.
         This is your opportunity to add any app-level information to state information.
         For example, you might use this method to write version information or the high-level
        configuration of your app.
    */
    func application(_ application: UIApplication, willEncodeRestorableStateWith coder: NSCoder) {
        // Encode any application state data at the app delegate level.
    }
    
    /**    Reload application state data not necessarily related to the user interface, this is called when the app is re-launched.
         The state restoration system calls this method as the final step in the state restoration process.
         By the time this method is called, all other restorable objects will have been restored and
         put back into their previous state. You can use this method to read any high-level app data
         you saved in the application:willEncodeRestorableStateWithCoder: method and apply it to your app.
    */
    func application(_ application: UIApplication, didDecodeRestorableStateWith coder: NSCoder) {
        /**    Decode any application state data at the app delegate level.
            If you plan to do any asynchronous initialization for restoration -
            Use these methods to inform the system that state restoration is occuring
               asynchronously after the application has processed its restoration archive on launch.
            In the event of a crash, the system will be able to detect that it may have been
               caused by a bad restoration archive and arrange to ignore it on a subsequent application launch.
        */
        UIApplication.shared.extendStateRestoration()

        DispatchQueue.global(qos: .background).async {
            /**    On background thread:
                Do any additional asynchronous initialization work here.
            */
            DispatchQueue.main.async {
                // Back on main thread: Done asynchronously initializing, complete our state restoration.
                UIApplication.shared.completeStateRestoration()
            }
        }
    }
    
    /** Asks the  the application delegate to provide the specified view controller.
         Returns the view controller object to use or nil if the app delegate does not supply this view controller.
     
         During state restoration, when UIKit encounters a view controller without a restoration class,
         it calls this method to ask for the corresponding view controller object. Your implementation
         of this method should create (or find) the corresponding view controller object and return it.
         If your app delegate does not provide the view controller, return nil.
     */
    func application(
            _ application: UIApplication,
            viewControllerWithRestorationIdentifierPath identifierComponents: [String],
            coder: NSCoder) -> UIViewController? {
        /** If you don't assign a restoration class to each view controller created inside this class,
             here we need to implement this function.
         */
        return nil
    }

}



