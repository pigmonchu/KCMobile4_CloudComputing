import Foundation
import Firebase

class CloudManager {
    
    let databaseRef : FIRDatabaseReference
    let PostRef: FIRDatabaseReference
//    let AuthorRef: FIRDatabaseReference
    
    //MARK: - Initialization
    init() {
        FIRApp.configure()
        databaseRef = FIRDatabase.database().reference()
        PostRef = FIRDatabase.database().reference().child("Posts")
//        AuthorRef = FIRDatabase.database().reference().child("Authors")
    }
    
    //MARK: - Manejadores
    func readNews(closure: @escaping ([String : New]) -> Void ) {
        var dictNews: [String: New] = [:]
        
        PostRef.observe(FIRDataEventType.value, with: { (snap) in
            let json = snap.value as! [String: Any]
            for postRef in json {
                let new = New(dict: postRef.value as! [String: Any])
                dictNews[postRef.key] = new
            }
            closure(dictNews)
            
        })
    }
    
}
