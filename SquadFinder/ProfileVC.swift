import UIKit
import Firebase

class ProfileVC: UIViewController {
    
    var annotation: UserAnnotation!
    @IBOutlet weak var gamerTagLabel: UILabel!
    @IBOutlet weak var topGameLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var gamesConsoleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    gamerTagLabel.text = annotation.gamerTag
    topGameLabel.text = annotation.topGame
    highScoreLabel.text = annotation.highScore
    gamesConsoleLabel.text = annotation.gamesConsole
    
        
        
        
    }
    

    

    
}
