//
//  ViewController.swift
//  fileManager
//
//  Created by Sergey Ivchenko on 27.04.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        FileStorage.shared["1"] = 1
        print(FileStorage.shared["1"])
    }

}
class FileStorage {

    private lazy var data:[String:Any] = { () -> [String:Any] in
        guard let dir = dir else { return [String : Any]()}
        return NSDictionary(contentsOf: dir.appendingPathComponent(file)) as! [String: Any]
    }()
    static let shared = FileStorage()
    private let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    private let file = "data.txt"
    private func writeData(someData:Dictionary<String, Any>) {
        let dictionary = someData as NSDictionary
        guard let dir = dir else { return }
        let fileURL = dir.appendingPathComponent(file)
        dictionary.write(to: fileURL, atomically: false)
    }
    subscript (key: String) -> Any {
        get {
            data[key]
        }
        set {
            data[key] = newValue
            writeData(someData: data)
        }
    }
}
