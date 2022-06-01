//
//  ViewController.swift
//  TableViewSections
//
//  Created by Kalybay Zhalgasbay on 17.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let sections: [String] = ["Inroduction to IOS development", "Assembly and Resources", "Functions and Optionals", "Classes, structures, enums", "OOP", "Xcode, Storyboard and Controller", "Standard UI components", "Autolayout, Constrains and StackViews", "Tables and Collections"]
    
    let rows: [[String]] = [["Intro to Play Ground", "Variables and constants", "Data types"], ["Arrays", "Dictionary", "Sets"], ["IF ELSE conditions", "Switch case", "Function"], ["Optionals", "Enum", "Class"], ["Struct", "OOP", "Protocols"], ["TableView", "XIB","Extenstions"], ["Delegate", "Data source", "ViewDidload"], ["Leading", "Trailing","Top"], ["Bottom", "Identifier", "Storyboard"]]
    
    let rowColor: [UIColor] = [.red, .orange, .blue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .black
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Section", for: indexPath)
        cell.textLabel?.text = rows[indexPath.section][indexPath.row]
        cell.backgroundColor = rowColor[indexPath.row]
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections.count
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.frame = CGRect(x: 20, y: 8, width: 350, height: 40)
        label.textColor = .black
        label.backgroundColor = .yellow
        label.text = self.tableView(tableView, titleForHeaderInSection: section)

        let headerView = UIView()
        headerView.addSubview(label)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerLabel = UILabel()
        footerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        footerLabel.frame = CGRect(x: 20, y: 10,width: 300, height: 30)
        footerLabel.textColor = .white
        footerLabel.backgroundColor = .purple
        //footerLabel.text = self.tableView(tableView, titleForFooterInSection: section)
        footerLabel.text = "Footer view"
        
        let footerView = UIView()
        footerView.addSubview(footerLabel)
        
        return footerView
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
