
import UIKit
import Kingfisher

class FriendsDetailViewController: UIViewController {

    var selectedFriend : FriendInfoModel?
    
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var phoneNo: UILabel!
    @IBOutlet weak var fbUrl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadData()
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    //LoadData to controllers
    func loadData(){
        let url = URL(string:(self.selectedFriend?.profileImageURL)!)
        profilePhoto.kf.indicatorType = .activity
        let processor = RoundCornerImageProcessor(cornerRadius: 20)
        profilePhoto.kf.setImage(with: url , options:[.processor(processor)])
        let profileName = "\(self.selectedFriend?.firstName) \(self.selectedFriend?.lastName)"
        print(profileName)
        friendName.text = "\(self.selectedFriend!.firstName) \(self.selectedFriend!.lastName)"
        city.text = self.selectedFriend!.city
        phoneNo.text = self.selectedFriend!.phoneNumber[0]
        fbUrl.text = self.selectedFriend!.fbProfileURL
    }
    
}



