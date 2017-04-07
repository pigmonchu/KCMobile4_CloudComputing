import Foundation
import Firebase
import FirebaseDatabase

class CloudManager {
    
    typealias Document = [String : Any]
    
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
    func readAllNews(callBack: @escaping (NewIndex) -> Void ) {
        var dictNews = NewIndex()
        
        PostRef.observe(FIRDataEventType.value, with: { (snap) in

            if snap.value is NSNull {
                callBack(dictNews)
                return
            }
            
            let json = snap.value as! [String: Any]
            for postRef in json {
                let new = New(dict: postRef.value as! Document)
                dictNews.append(key: postRef.key, value: new)
            }
            callBack(dictNews)
            
        })
    }
    
    func createNewInCloud(_ document: New) {
        createInCloud(inEntity: PostRef, document: document.toDictionary())
    }
    
    fileprivate func createInCloud(inEntity: FIRDatabaseReference, document: Document) {
        let key = inEntity.childByAutoId().key
        let recordWithKey = ["\(key)" : document]
        inEntity.updateChildValues(recordWithKey)
    }
}
