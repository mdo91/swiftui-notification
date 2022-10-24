//
//  AppDelegate.swift
//  swiftui-notification
//
//  Created by Mahmoud Aoata on 24.10.2022.
//

import UIKit
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        Task {
            let center = UNUserNotificationCenter.current()
            try await center.requestAuthorization(options: [.badge, .sound, .alert])
            
            await MainActor.run {
                application.registerForRemoteNotifications()
            }
        }
        return true
    }
}
