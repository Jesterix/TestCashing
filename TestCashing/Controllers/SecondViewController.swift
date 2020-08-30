import UIKit

class SecondViewController: UIViewController {
    
    var textField = UITextField()
    let stateService = StateService()
    
    override func viewDidLoad() {
        view.backgroundColor = .systemIndigo
        
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
            make.centerY.equalTo(view)
            make.height.equalTo(40)
        }
        textField.backgroundColor = .white
        textField.autocorrectionType = .no
        textField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        stateService.saveState(screenIndex: 1, text: textField.text ?? "")
    }
}

extension SecondViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        stateService.saveState(screenIndex: 1, text: textField.text ?? "")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
