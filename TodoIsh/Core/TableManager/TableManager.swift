//
//  TableManager.swift
//  TodoIsh
//
//  Created by Jhon Jaiver Lopez on 12/9/18.
//  Copyright © 2018 Jhon Jaiver Lopez. All rights reserved.
//

import UIKit

class TableManager: NSObject {
    let tableView: UITableView
    var sections: [TableSection?] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    fileprivate func itemFor(indexPath path: IndexPath) -> CellType? {
        guard let section = sections[path.section],
            let item = section.rows[path.row] else {
            return nil
        }
        return item
    }
}

// MARK: - UITableViewDataSource
extension TableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = self.sections[section] else {
            return 1
        }
        
        return section.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = itemFor(indexPath: indexPath) else {
            return UITableViewCell()
        }
        switch item {
        case .contact(let contact):
            let viewCell = tableView.dequeueReusableCell(withIdentifier: ContactViewCell.identifier,
                                                         for: indexPath) as! ContactViewCell
            
            viewCell.model = contact
            return viewCell
        case .noData:
            let viewCell = tableView.dequeueReusableCell(withIdentifier: "NoData",
                                                         for: indexPath)
            return viewCell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate
extension TableManager: UITableViewDelegate {
    
}
