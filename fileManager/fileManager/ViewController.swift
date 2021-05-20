//
//  ViewController.swift
//  fileManager
//
//  Created by Sergey Ivchenko on 19.05.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FileStorage.shared["one"] = 1
    }

}

