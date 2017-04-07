import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    private var _new = New()
    
    var new:New {
        get {
            return _new
        }
        set {
            _new = newValue
            
            title.text = newValue.title
            author.text = newValue.author
            
            do {
                if newValue.attachment != nil {
                    guard let imgData = try? Data(contentsOf: newValue.attachment!) else {
                        throw ScoopErrors.urlImageNotReachable
                    }
                    photo.image = UIImage(data: imgData)
                }
            } catch {
                
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
