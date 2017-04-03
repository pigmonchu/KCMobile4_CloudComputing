import Foundation

class Summary {
    typealias NewsArray = [New]
    
    var allNews = NewsArray()

    //MARK: - Initializators
    
    init(news : NewsArray) {
        for new in news {
            allNews.append(new)
        }
    }
    

}
