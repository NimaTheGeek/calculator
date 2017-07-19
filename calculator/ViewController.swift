//  calculator
//  ViewController.swift
// Nima M.Farahani


// **app is designed for iphone 6 and 6s**



import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    override var shouldAutorotate : Bool {
        return false
    }
 
    @IBOutlet var myImage: UIImageView!
    @IBOutlet var showDigits: UILabel!
    @IBOutlet var showCalculation: UILabel!
    
    var number1 = 0.0, number2 = 0.0, result = 0.0
    var istyping = false, decimalPushed = false
    var opr = ""
    var tempRes: Double = 0.0
    var decimalCount = 0
    var name = "9.jpg"
    
    //for numbers
    @IBAction func numbers(_ sender: AnyObject) {
        
        let number = sender.currentTitle!
        if istyping {
            showDigits.text = showDigits.text! + number!
            showCalculation.text = showCalculation.text! + number!
           
        } else {
            showDigits.text = number;
            showCalculation.text = showCalculation.text! + number!
            istyping = true;
        }
    }
    
    //decimal period
    @IBAction func decimal(_ sender: AnyObject) {
        
        let decimal = sender.currentTitle!
        
        if decimalPushed{} else{
            showDigits.text = showDigits.text! + decimal!
            if istyping{
                showCalculation.text = showCalculation.text! + decimal!
            }
            decimalPushed = true
        }
        decimalCount += 1
    }
    
    //for equal sign
    @IBAction func answer(_ sender: AnyObject) {
        
        number2 = Double(showDigits.text!)!;
        if opr == "+"{
            result = number1 + number2
        }else if opr=="-"{
            result = number1 - number2
        }else if opr == "x"{
            result = number1 * number2
        }else if opr == "/"{
            
            tempRes = round((Double( number1) / Double(number2))*1000)/1000
            if number1.truncatingRemainder(dividingBy: number2) == 0{
                showDigits.text = "\(Int(tempRes))"
                showCalculation.text = showCalculation.text! + " = " + "\(Int(tempRes))"
            }else{
                showDigits.text = "\(tempRes)"
                showCalculation.text = showCalculation.text! + " = " + "\(tempRes)"
            }
        }
        
        if opr == "+" || opr == "-" || opr == "x"{
            if istyping{
                if decimalCount == 0{
                    showDigits.text = "\(Int(result))"
                    showCalculation.text = showCalculation.text! + " =" + " \(Int(result))"
                
                }else{
                    showDigits.text = "\(result)"
                    showCalculation.text = showCalculation.text! + " =" + " \(result)"
                    
                }
            }
        }
    }
    @IBAction func negativeMaker(_ sender: AnyObject) {
        
        number1 = Double(showDigits.text!)!
        result = number1 - (number1*2)
        if istyping{
            if decimalCount == 0{
                showDigits.text = "\(Int(result))"
                showCalculation.text = "\(Int(result))"
            }else{
                showDigits.text = "\(result)"
                showCalculation.text = "\(result)"
            }
        }
        
        number1 = result
        decimalPushed = false
    }
    
    @IBAction func percentage(_ sender: AnyObject) {
        
        
        number2 = Double(showDigits.text!)!
        
        if opr == "+"{
            tempRes = round(Double(number1) + ((Double(number1) * Double(number2))/100))
            
        }else if opr == "-"{
            tempRes = round(Double(number1) - ((Double(number1) * Double(number2))/100))
            
        }else if opr == "*"{
            tempRes = round(((Double(number1) * Double(number2))/100))
            
        }
        if istyping{
            showDigits.text = "\(tempRes)"
            showCalculation.text = showCalculation.text! + "% = \(tempRes)"
        }
        istyping = false;
        decimalPushed = false
    }
    
    //to reset calc
    @IBAction func reset(_ sender: AnyObject) {
        showDigits.text = "0"
        number1 = 0
        number2 = 0
        result = 0
        opr = ""
        decimalPushed =  false
        showCalculation.text = ""
        istyping = false
    }
    
    @IBAction func operators(_ sender: AnyObject) {
        
        number1 = Double(showDigits.text!)!
        opr = sender.currentTitle!!;
        if istyping{
            showCalculation.text = showCalculation.text! + " \(opr) "
        }
        istyping = false;
        decimalPushed = false;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myImage.image = UIImage(named: name)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
