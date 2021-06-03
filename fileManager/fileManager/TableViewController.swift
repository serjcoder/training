//
//  TableViewController.swift
//  fileManager
//
//  Created by Sergey Ivchenko on 26.05.2021.
//

import UIKit

class TableViewController: UITableViewController {
    

    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var TimeInterval: UILabel!
    let lunchCounter = LunchCounter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lunchCounter.previousDates.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.dateLable.text = lunchCounter.getStringDate(index: indexPath.row)
        cell.timeIntervalLable.text = lunchCounter.getStringTimeInterval(index: indexPath.row)
        return cell
    }

}
