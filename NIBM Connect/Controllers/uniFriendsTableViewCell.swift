

import UIKit
import Kingfisher

class uniFriendsTableViewCell: UITableViewCell {


    @IBOutlet weak var profilephoto: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendCity: UILabel!
    
    func setFriendsInfo(friend : FriendInfoModel){
        let url = URL(string:friend.profileImageURL)
        profilephoto.kf.indicatorType = .activity
        let processor = RoundCornerImageProcessor(cornerRadius: 20)
        profilephoto.kf.setImage(with: url , options:[.processor(processor)])
        friendName.text = "\(friend.firstName) \(friend.lastName)"
        friendCity.text = friend.city
    }
    
}
