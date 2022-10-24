# swiftui-notification
sample app for both remote and local notification 

creating the following app delegate for preparing the app to recieve push notification:

import UIKit
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate {
  // 1
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
    [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // 2
    Task {
      let center = UNUserNotificationCenter.current()
      try await center.requestAuthorization(options: [.badge, .sound, .alert])

      // 3
      await MainActor.run {
        application.registerForRemoteNotifications()
      }
    }

    return true
  }
}
