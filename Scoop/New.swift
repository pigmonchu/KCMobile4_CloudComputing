import Foundation
import UIKit


class New {

    enum typeFile {
        case image
        case video
    }
    
    //MARK: - Intern constants
    
    //MARK: - Stored properties
    let title: String
    let body: String
    let photo: UIImage?
    let author: User
    var isDraft: Bool
    var rating: Double
    var numOfReadings: Int
    let lat: Double
    let lng: Double

    //MARK: - Initialization
    init(title          : String,
         body           : String,
         author         : User,
         lat            : Double,
         lng            : Double,
         isDraft        : Bool,
         rating         : Double,
         numOfReadings  : Int,
         photo          : UIImage
         ) {
        
        self.title = title
        self.body = body
        self.author = author
        self.lat = lat
        self.lng = lng
        self.isDraft = isDraft
        self.rating = rating
        self.numOfReadings = numOfReadings
        self.photo = photo
    }
    

}
