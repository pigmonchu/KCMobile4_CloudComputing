import UIKit

class NewsViewController: UIViewController {

    let model: Summary
    
    @IBOutlet weak var newsCollection: UICollectionView!
    @IBOutlet weak var btnCreate: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Scoop"

        let create_button = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(createNew(_:)))
        
        self.navigationItem.rightBarButtonItem = create_button
        
        if model.newsCount == 0 {
            btnCreate.layer.cornerRadius = 5
            btnCreate.layer.borderWidth = 1
            btnCreate.layer.borderColor = UIColor.white.cgColor
            
            newsCollection.isHidden = true
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Initializers
    init(model: Summary) {
        self.model = model
        
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
