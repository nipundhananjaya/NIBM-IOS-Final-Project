

import UIKit

class HomeworkTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var Homework: UILabel!
    
    func setHomework(homework:String){
        print(homework)
        self.Homework.text = homework
    }
    

}
