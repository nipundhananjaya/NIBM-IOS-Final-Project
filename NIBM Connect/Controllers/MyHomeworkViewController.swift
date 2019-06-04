//
//  MyHomeworkViewController.swift
//  NIBM Connect
//
//  Created by Tharindu Randunu on 6/4/19.
//  Copyright © 2019 NIBM. All rights reserved.
//

import UIKit

class MyHomeworkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var homeworklist:[String] = []
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.rowHeight = 70
        homeworklist = defaults.object(forKey: "savedHomeworks") as? [String] ?? [String]()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        homeworklist = defaults.object(forKey: "savedHomeworks") as? [String] ?? [String]()
        print(homeworklist.count)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homeworklist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var homeWork:String = ""
        homeWork = self.homeworklist[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeworkListCell" ,for: indexPath) as! HomeworkTableViewCell
        
        //Set data to cellview attributes
        cell.setHomework(homework: homeWork)
        return cell
    }
    

}
