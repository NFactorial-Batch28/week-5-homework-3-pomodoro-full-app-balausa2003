//
//  HistoryViewController.swift
//  PomodoroTimer
//
//  Created by Балауса Косжанова on 08.05.2023.
//
import UIKit

class HistoryViewController: UIViewController {
    
    var datesArr = ["25.02.2023", "24.04.2023","24.04.2023"]
    
    lazy private var table: UITableView = {
        let table = UITableView()
        table.backgroundColor = .black
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        view.addSubview(table)
        setupConstraints()
        table.dataSource = self
        table.delegate = self
        navigationItem.title = "History"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        // Do any additional setup after loading the view.
    }
    
    func setupConstraints() {
        table.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
        
        
    }
    
}

extension HistoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell else { return UITableViewCell()}
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = datesArr[section]
        return title
    }
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return 4
    }
}

