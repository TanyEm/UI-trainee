
import UIKit

class PhoneNumberViewController: UIViewController {

    @IBOutlet weak var regionNumber: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var moveNext: UIButton!
    
    var selectedCountry: String?
    var codes:[String] = [
        "+358",
        "+7",
        "+3"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPicker()
        dismissAndClosePicker()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // the regionNumber layer
        regionNumber.layer.cornerRadius = 20
        regionNumber.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        regionNumber.layer.borderWidth = 0
        regionNumber.clipsToBounds = true
        
        // padding region code text field
        let paddingCode = UIView(frame: CGRect(x: 0,
                                               y: 0,
                                               width: 20,
                                               height: self.regionNumber.frame.height))
        regionNumber.leftView = paddingCode
        regionNumber.leftViewMode = UITextField.ViewMode.always

        // the phoneNumber layer
        // make a border on the left side phoneNumber text field
        let leftBorder = CALayer()
        let width = CGFloat(1.0)
        leftBorder.frame = CGRect(x: 0.0,
                                   y: 0.0,
                                   width: width,
                                   height: phoneNumber.frame.size.height - width)
        leftBorder.backgroundColor = UIColor.lightGray.cgColor
        phoneNumber.layer.addSublayer(leftBorder)
            
        phoneNumber.layer.cornerRadius = 20
        phoneNumber.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        phoneNumber.layer.borderWidth = 0
        phoneNumber.clipsToBounds = true
        
        // padding number text field
        let paddingNumber = UIView(frame: CGRect(x: 0,
                                                 y: 0,
                                                 width: 20,
                                                 height: self.phoneNumber.frame.height))
        phoneNumber.leftView = paddingNumber
        phoneNumber.leftViewMode = UITextField.ViewMode.always
        
        // the moveNext layer
        moveNext.layer.cornerRadius = 20
                
    }
    
    @IBAction func moveToWelcome(_ sender: Any) {
        performSegue(withIdentifier: "MoveToWelcome", sender: self)
    }
    
    @IBAction func moveToNextScreen(_ sender: Any) {
        guard let regionCode = regionNumber.text else { return }
        guard let phoneNumber = phoneNumber.text else { return }
        
        let isValid = isPhoneNumerIsValid(code: regionCode, number: phoneNumber)
        if isValid == true {
            performSegue(withIdentifier: "GoNext", sender: self)
        } else {
            displayMessage(userMessage: "Your phone number is empty. Try to fill it again")
        }
    }
    
    // MARK: - Phone validation
    
    func isPhoneNumerIsValid(code: String, number: String) -> Bool {
        let phoneValidation: Bool
        if code.isEmpty && number.isEmpty {
            phoneValidation = false
        } else {
            phoneValidation = true
        }
        return phoneValidation
    }
    
    // MARK: - Alert message
        
    func displayMessage(userMessage:String) -> Void {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Error",
                                                    message: userMessage,
                                                    preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK",
                                            style: .default,
                                            handler: { (action: UIAlertAction) in
                //Will working when OK tapped
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                }
            })
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    // MARK: - DatePicker
    
    func createPicker() {
        let picker = UIPickerView()
        regionNumber.inputView = picker
        
        picker.delegate = self
        picker.dataSource = self
    }
    
    func dismissAndClosePicker() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dissmissAction))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        regionNumber.inputAccessoryView = toolBar
        
    }
    
    @objc func dissmissAction() {
        regionNumber.resignFirstResponder()
        self.view.endEditing(true)
    }

}

extension PhoneNumberViewController: UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        codes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        codes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        regionNumber.text = codes[row]
    }
    
}
