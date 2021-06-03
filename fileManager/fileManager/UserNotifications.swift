//
//  UserNotifications.swift
//  fileManager
//
//  Created by Sergey Ivchenko on 24.05.2021.
//

import Foundation
import UserNotifications

private struct Constants {
    static let timeout = 3 // что бы не ждать срабатывания
}

class UserNotifications {
    
    
    
    static func notifyRequest() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound, .badge]) { (allowed, error) in
            
            guard let error = error else { return }
            print(error.localizedDescription)
            
        }
    }
    
    static func sendNotifications() {
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(Constants.timeout) , repeats: false)
        let content = UNMutableNotificationContent()
        var contentTitle:String {
            get {
                return "First notify"
            }
        }
        var contentBody:String {
            get {
                return "It's " + String(trigger.timeInterval) + " seconds in background"
            }
        }
        content.title = contentTitle
        content.body = contentBody
        content.sound = UNNotificationSound.default

        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            guard let error = error else { return }
            print(error.localizedDescription)
            
        }
    }
    
    static func removeNotifications() {
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["notification"])
    }
    
}
