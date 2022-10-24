//
//  ContentView.swift
//  swiftui-notification
//
//  Created by Mahmoud Aoata on 24.10.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Local()
                .tabItem {
                    Image(systemName: "bell.circle.fill")
                    Text("Local Notification")
                }
            Remote()
                .tabItem {
                    Image(systemName: "bell.and.waveform")
                    Text("Remote Notification")
                }
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
