import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputFName: UITextField!
    @IBOutlet weak var inputLName: UITextField!
    @IBOutlet weak var inputAdd: UITextField!
    @IBOutlet weak var retrieveFName: UITextField!
    @IBOutlet weak var retrieveLName: UITextField!
    @IBOutlet weak var retrieveAdd: UITextField!
    
    
    @IBAction func addInformation(_ sender: Any) {
        UserDefaults.standard.set([inputFName.text, inputLName.text, inputAdd.text], forKey: "userInfo")
        
    }
    
    @IBAction func retrieveInformation(_ sender: Any) {
        let detailObject = UserDefaults.standard.object(forKey: "userInfo")
        if let detail = detailObject as? NSArray {
            retrieveFName.text = String(describing: detail[0])
            retrieveLName.text = String(describing: detail[1])
            retrieveAdd.text = String(describing: detail[2])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

