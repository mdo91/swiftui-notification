# swiftui-notification
sample app for both remote and local notification 

creating the following app delegate class for preparing the app to recieve push notification:

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
      
Since SwiftUI lifecycle apps no longer call the app delegate by default, we’ll need to tell SwiftUI to use the app delegate you just created:
we add these line to swiftui_notification.swift file:

      @UIApplicationDelegateAdaptor(AppDelegate.self)
      private var appDelegate
