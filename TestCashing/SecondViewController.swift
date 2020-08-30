//
//  SecondViewController.swift
//  TestCashing
//
//  Created by Georgy Khaydenko on 30.08.2020.
//  Copyright © 2020 Georgy Khaydenko. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var textField = UITextField()
    
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
}

extension SecondViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("save info")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
