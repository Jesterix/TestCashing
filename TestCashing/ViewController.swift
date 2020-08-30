import UIKit
import SnapKit
import Disk

class ViewController: UIViewController {
    
    let stateService = StateService()
    
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
        stateService.saveState(screenIndex: 0, text: "")
    }
    
    @objc func tapButton() {
        let text = stateService.retrieveState()?.text
        navigationController?.pushViewController(
            Configurator().createSecond(with: text ?? ""),
            animated: true)
    }
}

