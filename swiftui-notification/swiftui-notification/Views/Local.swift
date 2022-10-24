//
//  local.swift
//  swiftui-notification
//
//  Created by Mahmoud Aoata on 24.10.2022.
//

import SwiftUI
import UserNotifications
struct Local: View {
    @State private var islocalNotificationActive: Bool = false
    var body: some View {
        ZStack {
            VStack {
                Toggle(isOn: $islocalNotificationActive, label: {
                    Text("Send Local Notification")
                })
                .onChange(of: islocalNotificationActive) { toggleNewValue in
                    if toggleNewValue {
                        sendLocalNotification()
                    }
                }
            }
            .padding(.horizontal, 20)
        
        }
        .onAppear{
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    print("permission granted!")
                } else if error != nil {
                    print("error.\(String(describing: error?.localizedDescription))")
                }
            }
        }
    }
    
    //MARK: - send local notification after toggle is on
    
    private func sendLocalNotification() {
        let content = UNMutableNotificationContent()
        
        content.title = "Local Notification"
        content.subtitle = "Local Notification has been triggered on toggle active state"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        // request to schedual local notification
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}

struct local_Previews: PreviewProvider {
    static var previews: some View {
        Local()
    }
}
