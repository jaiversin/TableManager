//
//  ViewController.swift
//  TodoIsh
//
//  Created by Jhon Jaiver Lopez on 12/9/18.
//  Copyright © 2018 Jhon Jaiver Lopez. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var tableViewManager: TableManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewManager = TableManager(tableView: self.tableView)
        
        Contact.fetchAllContacts {
            
            switch $0 {
            case .data(let contacts):
                let section = TableSection(index: 0, rows: contacts)
                tableViewManager?.sections = [section]
                break
            case .noData:
                let emptySection = TableSection(index: 0, rows: [.noData])
                tableViewManager?.sections = [emptySection]
                break
            }
        }
    }
    
}
