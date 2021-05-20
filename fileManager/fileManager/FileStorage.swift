//
//  FileStorage.swift
//  fileManager
//
//  Created by Sergey Ivchenko on 20.05.2021.
//

import Foundation

class FileStorage {
    
    static let shared = FileStorage()
    
    subscript (key: String) -> Any {
        get {
            data[key]
        }
        set {
            data[key] = newValue
            writeData(someData: data)
        }
    }
    
    private let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    
    private let file = "data.txt"
    
    private lazy var data:[String:Any] = { () -> [String:Any] in
        guard let dir = dir else { return [String : Any]()}
        guard let dict = try? NSDictionary(contentsOf: dir.appendingPathComponent(file))  else { return [String:Any]() }
        return dict as! [String: Any]
    }()
    
    private func writeData(someData:Dictionary<String, Any>) {
        let dictionary = someData as NSDictionary
        guard let dir = dir else { return }
        let fileURL = dir.appendingPathComponent(file)
        dictionary.write(to: fileURL, atomically: false)
    }
}
