import UIKit

class AppContainerViewController: UIViewController {
    
    @IBOutlet weak var labelTest: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        AppManager.shared.appContainer = self
        AppManager.shared.showApp()
        
    }
}
