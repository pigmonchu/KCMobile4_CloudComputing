import Foundation
import UIKit

class User {
    let username: String
    let pwd: String
    let firstName: String?
    let lastName: String?
    let photo: UIImage?


    //MARK: - Initialization
    init(username   : String,
         pwd        : String,
         firstName  : String?,
         lastName   : String?,
         photo      : UIImage)
    {
        
        self.username = username
        self.pwd = pwd
        self.firstName = firstName
        self.lastName = lastName
        self.photo = photo
    }
    
}
