import UIKit
import SnapKit
import Disk

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Cashing practice"
        
        let button = UIButton(type: .contactAdd)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        button.addTarget(
            self,
            action: #selector(tapButton),
            for: .touchUpInside)
        
        view.backgroundColor = .systemTeal
    }
    
    override func viewWillAppear(_ animated: Bool) {
        StateService().saveState(screenIndex: 0, text: "")
    }
    
    @objc func tapButton() {
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }
}

