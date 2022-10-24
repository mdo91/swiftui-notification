//
//  swiftui_notificationApp.swift
//  swiftui-notification
//
//  Created by Mahmoud Aoata on 24.10.2022.
//

import SwiftUI

@main
struct swiftui_notificationApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
