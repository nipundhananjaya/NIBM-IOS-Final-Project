

import UIKit
import Firebase
import FirebaseDatabase

class friendsInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var friendsTableView: UITableView!
    
    var friendInfoList: [FriendInfoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadFriendsData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friendInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friendsInfo = self.friendInfoList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsInfoCell" ,for: indexPath) as! uniFriendsTableViewCell
        
        //Set data to cellview attributes
        cell.setFriendsInfo(friend: friendsInfo)
        return cell
    }
    
    
    //Load data from firebase
    func loadFriendsData(){
        //        var tempFriendList: [Friend] = []
        Database.database().reference().child("Friends").observe(.childAdded, with: {(snapshot) in
            
            if let dictionary = snapshot.value as? [String:AnyObject]{
                let firstname = dictionary["firstname"] as! String
                let lastname = dictionary["lastname"] as! String
                let profileimageurl = dictionary["imageurl"] as! String
                let phonenumber = dictionary["phonenumber"] as! String
                let fburl = dictionary["fburl"] as! String
                let city = dictionary["city"] as! String
                
                let friend = FriendInfoModel(firstName: firstname,lastName: lastname,profileImageURL: profileimageurl,phoneNumber: [phonenumber],fbProfileURL: fburl,city: city)
                print(firstname , lastname , profileimageurl)
                self.friendInfoList.append(friend)
                DispatchQueue.main.async {
                    self.friendsTableView.reloadData()
                }
            }
        })
    }


}
