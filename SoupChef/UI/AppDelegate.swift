 

import UIKit
import SoupKit
import os.log

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        
        guard userActivity.activityType == NSStringFromClass(OrderSoupIntent.self) ||
            userActivity.activityType == NSUserActivity.viewMenuActivityType ||
            userActivity.activityType == NSUserActivity.orderCompleteActivityType else {
            os_log("Can't continue unknown NSUserActivity type %@", userActivity.activityType)
            return false
        }
        
        guard let window = window,
            let rootViewController = window.rootViewController as? UINavigationController else {
                os_log("Failed to access root view controller.")
                return false
        }
         
        restorationHandler(rootViewController.viewControllers)
        return true
    }
}
