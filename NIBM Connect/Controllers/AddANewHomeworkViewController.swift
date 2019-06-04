

import UIKit

class AddANewHomeworkViewController: UIViewController {
    
    
    @IBOutlet weak var NewHomework: UITextView!
    var homeworklist:[String]=[]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        NewHomework.placeholderText = "Type..."
        homeworklist = defaults.object(forKey: "savedHomeworks") as? [String] ?? [String]()
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func AddNewHomework(_ sender: UIButton){
        
        if (NewHomework.text?.isEmpty)!{
            let alert = UIAlertController(title: "Error", message:"Empty Field!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: {action in self.dismissView()})
            alert.addAction(action)
            self.present(alert, animated: true)
            return
        }
        
        homeworklist.append(NewHomework.text)
        defaults.set(self.homeworklist, forKey: "savedHomeworks")
        let alert = UIAlertController(title: "Successsful", message:"Saved Successfully", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: {action in self.dismissView()})
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    
    func dismissView(){
        self.dismiss(animated: true, completion: nil)
    }
}
