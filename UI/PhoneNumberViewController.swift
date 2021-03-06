
import UIKit

class PhoneNumberViewController: UIViewController {

    @IBOutlet weak var regionNumber: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var moveNext: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    var buttonMover: ButtonMover?
    var gestureHendler: GesturesHendler?
    var selectedCountry: String?
    var codes:[String] = [
        "+1",
        "+3",
        "+358",
        "+7"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        gestureHendler = GesturesHendler(view: self.view)
//        gestureHendler?.gestureRecognizer()
        gestureRecognizer()
        
        buttonMover = ButtonMover(view: self.view, constraint: self.bottomConstraint)
        guard let mover = buttonMover else {return}
                
        NotificationCenter.default.addObserver(mover,
                                               selector: #selector(mover.keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(mover,
                                               selector: #selector(mover.keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(mover,
                                               selector: #selector(mover.keyboardWillChangeFrame),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil)
        
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
        
        // add image on the right side of text field
        let arrow = TextFieldArrowOnTheRightSide()
        arrow.makeArrow(field: regionNumber)
    }
    
    func gestureRecognizer() {
        // hide keyboad when user taps on view
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.delegate = self
        tap.cancelsTouchesInView = false
        self.view?.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view?.endEditing(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        guard let mover = buttonMover else {return}
       
        NotificationCenter.default.removeObserver(mover, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(mover, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(mover, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    
    @IBAction func moveToWelcome(_ sender: Any) {
        performSegue(withIdentifier: "MoveToWelcome", sender: self)
    }
    
    @IBAction func moveToNextScreen(_ sender: Any) {
        guard let regionCode = regionNumber.text else { return }
        guard let phoneNumber = phoneNumber.text else { return }
        
        if phoneNumerIsValid(code: regionCode, number: phoneNumber) {
            performSegue(withIdentifier: "GoNext", sender: self)
        } else {
            let messageAlert = MessageAlert()
            messageAlert.showMessage(on: self, with: "Ooops!", message: "Your phone number is empty. Try to fill it again")
        }
    }
    
    // MARK: - Phone validation
    
    func phoneNumerIsValid(code: String, number: String) -> Bool {
        let phoneValidation: Bool
        if code.isEmpty && number.isEmpty {
            phoneValidation = false
        } else {
            phoneValidation = true
        }
        return phoneValidation
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


extension PhoneNumberViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        let isControllTapped = touch.view is UIControl
        return !isControllTapped
    }
}
