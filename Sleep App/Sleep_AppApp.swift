//
//  Sleep_AppApp.swift
//  Sleep App
//
//  Created by Matthew Sigit on 20/01/22.
//

import SwiftUI
import UserNotifications
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    private func requestNotifs(application: UIApplication) {
        let center = UNUserNotificationCenter.current()
        let options:  UNAuthorizationOptions = [.alert, .badge, .sound]
        center.requestAuthorization(options: options) { granted, error in
            if let error = error {print(error.localizedDescription)}
        }
            }
}

@main
struct Sleep_AppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
    }
}
