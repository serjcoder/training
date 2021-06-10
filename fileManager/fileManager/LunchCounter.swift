//
//  LunchCounter.swift
//  fileManager
//
//  Created by Sergey Ivchenko on 01.06.2021.
//

import Foundation
import CoreData

class LunchCounter {
    
    var previousDates:Array = FileStorage.shared["date"] as? Array<Any> ?? []
    var timeInterval:[TimeIntervalData] = AppDelegate().loadTimeInterval()
    
    func getStringDate(index:Int) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY, MMM dd, HH:mm:ss"
        return dateFormatter.string(from: previousDates[index] as? Date ?? Date())
        
    }
    
    func getStringTimeInterval(index:Int) -> String {
        if timeInterval.count > 0 {
            let itemTimeInterval:String = String(timeInterval[index].value)
            return itemTimeInterval
        } else {
            return "0"
        }
        
    }
    
    func getCount() {
        
        let date = Date()
        
        previousDates.append(_:date)
        var timeIntervalValue: TimeInterval {
            if previousDates.count > 1 {
                guard let lastDay:Date = previousDates[previousDates.count - 2] as? Date else {  return 0 }
                return date.timeIntervalSince(lastDay as Date)
            } else {
                return 0
            }
        }
        
        FileStorage.shared["date"] = previousDates
        AppDelegate().saveTimeInterval(withValue: timeIntervalValue)
        
    }
    
}
