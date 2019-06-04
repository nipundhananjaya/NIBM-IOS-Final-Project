//
//  HomeworkTableViewCell.swift
//  NIBM Connect
//
//  Created by Tharindu Randunu on 6/4/19.
//  Copyright © 2019 NIBM. All rights reserved.
//

import UIKit

class HomeworkTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var Homework: UILabel!
    
    func setHomework(homework:String){
        print(homework)
        self.Homework.text = homework
    }
    

}
