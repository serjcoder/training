//
//  UserNotifications.swift
//  fileManager
//
//  Created by Sergey Ivchenko on 24.05.2021.
//

import Foundation
import UserNotifications

class UserNotifications {
    
    func sendNotifications() {
        
        let content = UNMutableNotificationContent()
        content.title = "First notify"
        content.body = "It's 30 seconds in background"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 30, repeats: false)
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            guard let error = error else { return }
            print(error.localizedDescription)
        }
    }
    
    func removeNotifications() {
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["notification"])
    }
    
}
