//
//  Extension + UITableView.swift
//  Insta
//
//  Created by Artem on 31.01.2023.
//

import Foundation
import UIKit

extension UITableView {
    func createTable() -> UITableView {
        let table = UITableView()
        table.showsVerticalScrollIndicator = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }
}
