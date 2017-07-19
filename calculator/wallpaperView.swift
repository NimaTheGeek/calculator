import Foundation
import UIKit

class wallpaperView: UIViewController{
    
    var name = "8.jpg"
    
    @IBAction func wallpaperSelect(_ sender: AnyObject) {
        
        if sender.restorationIdentifier == "1"{
            name = "1.jpg"
        }else if sender.restorationIdentifier == "2"{
            name = "2.jpg"
        }else if sender.restorationIdentifier == "3"{
            name = "3.jpg"
        }else if sender.restorationIdentifier == "4"{
            name = "4.jpg"
        }else if sender.restorationIdentifier == "5"{
            name = "5.jpg"
        }else if sender.restorationIdentifier == "6"{
            name = "6.jpg"
        }else if sender.restorationIdentifier == "7"{
            name = "7.jpg"
        }else if sender.restorationIdentifier == "8"{
            name = "8.jpg"
        }else {
            name = "9.jpg"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "8.jpg")!)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let firstViewController = segue.destination as! ViewController
            firstViewController.name = name
    }
}
