import UIKit

class ViewController: UIViewController {
    
    var mainStackView = UIStackView()
    var welcomeStackView = UIStackView()
    var input3: UITextField!
    var input2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createMainStackView()
        createLockImage()
        createWelcomeStackView()
        createAuthorisationStackView()
    }
 
}

#Preview {
    ViewController()
}

