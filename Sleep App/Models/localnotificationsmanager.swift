//
//  localnotificationsmanager.swift
//  Sleep App
//
//  Created by Matthew Sigit on 26/01/22.
//

import Foundation
import UserNotifications
import UIKit
class NotificationPublisher: NSObject, UNUserNotificationCenterDelegate {
    func sendNotification(title: String, subtitle: String, body: String, badge: Int?, delayInterval: Int?) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.subtitle = subtitle
        notificationContent.body = body
        var delayTimeTrigger: UNTimeIntervalNotificationTrigger?
        
        if let delayInterval = delayInterval {
            delayTimeTrigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(delayInterval), repeats: false)
        }
    notificationContent.sound = UNNotificationSound.default
        
        UNUserNotificationCenter.current().delegate = self
    
    let request = UNNotificationRequest(identifier: "SendSleep", content: notificationContent, trigger: delayTimeTrigger)
    
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print(error.localizedDescription)
        }
    }
    }
    
}

extension NotificationPublisher {
    func userNotificationCenter(    center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping
                                    (UNNotificationPresentationOptions) -> Void) {
        print("The notification is about to be presented")
        completionHandler([.badge, .sound, .alert])
    }
    func userNotificationCenter(    center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let identifier = response.actionIdentifier
        switch identifier {
            
        case UNNotificationDismissActionIdentifier:
            print("The notif was dismissed")
            completionHandler()
        
        case UNNotificationDefaultActionIdentifier:
            // app opened
            completionHandler()
        default:
            //default
            completionHandler()
        }
    }
                                
}
