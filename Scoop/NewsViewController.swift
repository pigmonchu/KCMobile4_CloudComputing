import UIKit
import Firebase

class NewsViewController: UIViewController {
    
//Inyectar cloud manager en lugar del el modelo y este se obtiene de cloud manager

    var model: [String: New] = [ : ]
    let backendManager: CloudManager
    
    @IBOutlet weak var newsCollection: UICollectionView!
    @IBOutlet weak var btnCreate: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Scoop"

        let create_button = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(createNew(_:)))
        
        self.navigationItem.rightBarButtonItem = create_button

        //Recupero noticias
        backendManager.readNews { (dict) in
            self.model = dict

            if self.model.count == 0 {
                self.btnCreate.layer.cornerRadius = 5
                self.btnCreate.layer.borderWidth = 1
                self.btnCreate.layer.borderColor = UIColor.white.cgColor
                
                self.newsCollection.isHidden = true
            }

        }
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
        
        
        //        let newsRef = FIRDatabase.database().reference().child("news")
//        
//        newsRef.observe(.value, with: { (snap) in
//            let listNews = snap.value
//        })
       
    }
    
    // MARK: - Initializers
    init(dataManager: CloudManager) {

        self.backendManager = dataManager

        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func create() {
        let a=0
        
        let b = a+1
    }
    
    @IBAction func createNew(_ sender: Any) {
        create()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
