import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    var calculatorBrain = CalculatorBrain()
    var pctChose: Float = 0.0
    
    override func viewDidLoad() {
        tenPctButton.isSelected = true
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Float(buttonTitleMinusPercentSign)!
        pctChose = buttonTitleAsANumber / 100
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format:"%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        if billTextField.text != "" {
            let totalBill = Float(billTextField.text!)!
            let nbrPeople = Int(splitNumberLabel.text!)!
            
            calculatorBrain.calculateBill(total: totalBill, percent: pctChose, nbrPeople: nbrPeople)
            self.performSegue(withIdentifier: "goToResults", sender: self)
            
        } else {
            let msg = "Please enter the amount of money so we can do the work for you ;)"
            let alert = UIAlertController(title: "Oops", message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Ok bro", comment: "Default action"), style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.percent = calculatorBrain.getPercent()
            destinationVC.total = calculatorBrain.getTotal()
            destinationVC.nbrPeople = calculatorBrain.getNbrPeople()
        }
    }
    
    
}

