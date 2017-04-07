/*
 Mon 6/IV/'17 - NOTA INTERNA PARA CUANDO USE ESTE PROYECTO PARA ESTUDIAR
 
 Necesito entender como funciona la presentación de pantalla por dentro y no tengo mucho tiempo. La información que me ha llevado a este planteamiento la he sacado de
        http://randexdev.com/2014/07/uicollectionview/
        http://randexdev.com/2014/08/uicollectionviewcell/

 */

import UIKit
import Firebase


class NewsViewController: UIViewController {
    
//Inyectar cloud manager en lugar del el modelo y este se obtiene de cloud manager
    
    var model = NewIndex()
    let backendManager: CloudManager
    let cellId  = "newCell"
    
    @IBOutlet weak var newsCollection: UICollectionView!
    @IBOutlet weak var btnCreate: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        initScreen()
        
        
        //Carga inicial de noticias
        backendManager.readAllNews(callBack: loadModel)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
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
        let new = New(title: "Post creado desde el Movil",
                      body: "Con este post puedo demostrar algo",
                      author: "1",
                      lat: nil,
                      lng: nil,
                      isDraft: false,
                      rating: nil,
                      numOfReadings: nil,
                      attachment: URL(string: "https://static.pexels.com/photos/92902/pexels-photo-92902.jpeg")
        )
        
        backendManager.createNewInCloud(new)
    
    }
    
    @IBAction func createNew(_ sender: Any) {
        create()
    }

    //
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Utils
    func initScreen() {
        self.title = "Scoop"
        
        addCreateButton()
        defineButtonEmptyScreen()
        iniNewsCollection()
        
    }
    
    func addCreateButton() {
        let create_button = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(createNew(_:)))
        navigationItem.rightBarButtonItem = create_button
    }

    func defineButtonEmptyScreen() {
        btnCreate.layer.cornerRadius = 5
        btnCreate.layer.borderWidth = 1
        btnCreate.layer.borderColor = UIColor.white.cgColor
    }

    func iniNewsCollection() {
        newsCollection.dataSource = self // -> Creo que indica que el proveedor de datos es este controlador. Aún así, no sé muy bien qué significa eso
        newsCollection.delegate = self   // -> Este creo que lo tengo más claro. El delegado de un evento en la CollectionView es este controlador
        newsCollection.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: cellId) // -> Define el tipo básico de celda que tiene esta colección
    }

    func loadModel(_ newsIndex: NewIndex ) {
        self.model = newsIndex

        if self.model.count == 0 {
            self.newsCollection.isHidden = true
        }
        
        DispatchQueue.main.async {
            self.drawCollection()
        }
      
    }
    
    func drawCollection() {
        var ix = 0
        for card in self.model.cards {
            let newCell : NewsCollectionViewCell
            let cell = Bundle.main.loadNibNamed("NewsCollectionViewCell", owner: self, options: nil)?.first
            if cell == nil {
                newCell = NewsCollectionViewCell(coder: NSCoder())!
            } else {
                newCell = cell as! NewsCollectionViewCell
            }
            
            newCell.new = card.value
            
            
//            let indexPath = IndexPath(item: 1, section: 1)
//            
//            let perhapsACell = newsCollection.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
//            let aCell =  perhapsACell as! NewsCollectionViewCell
//            aCell.new = card.value
//            
//            ix += 1
        }
    }
    
}

extension NewsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath as IndexPath)
        cell.backgroundColor = UIColor.orange
        return cell
    }
    
}
