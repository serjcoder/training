//
//  FileStorage.swift
//  fileManager
//
//  Created by Sergey Ivchenko on 20.05.2021.
//

import Foundation

class FileStorage {
    
    static let shared = FileStorage()
    
    subscript (key: String) -> Any? {
        get {
            data[key]
        }
        set {
            data[key] = newValue
            writeData(someData: data)
        }
    }
    
    private let fullPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("data.txt")
    
    private lazy var data:[String:Any] = { () -> [String:Any] in
        guard let fullPath = fullPath else { return [String : Any]()}
        guard let dict = NSDictionary(contentsOf: fullPath)  else { return [String:Any]() }
        return dict as! [String: Any]
    }()
    
    private func writeData(someData:Dictionary<String, Any>) {
        let dictionary = someData as NSDictionary
        guard let fullPath = fullPath else { return }
        dictionary.write(to: fullPath, atomically: false)
    }
}
