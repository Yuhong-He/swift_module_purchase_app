//
//  LoginViewController.swift
//  swift_geekTime_Eclass
//
//  Created by Yuhong He on 09/10/2023.
//

import UIKit
import SnapKit

protocol ValidatesPhoneNumber {
    func validatePhoneNumber(_ phoneNumber: String) -> Bool
}

protocol ValidatesPassword {
    func validatePassword(_ password: String) -> Bool
}

extension ValidatesPhoneNumber {
    func validatePhoneNumber(_ phoneNumber: String) -> Bool {
        if phoneNumber.count != 11 {
            return false
        } else {
            return true
        }
    }
}

extension ValidatesPassword {
    func validatePassword(_ password: String) -> Bool {
        if password.count < 6 || password.count > 12 {
            return false
        } else {
            return true
        }
    }
}

class LoginViewController: BaseViewController, ValidatesPhoneNumber, ValidatesPassword {
    
    var phoneTextField: UITextField!
    var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        let logoView = UIImageView(image: R.image.logo())
        view.addSubview(logoView)
        logoView.snp.makeConstraints{ (make) in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
        
        let phoneIconView = UIImageView(image: R.image.icon_phone())
        phoneTextField = UITextField()
        phoneTextField.leftView = phoneIconView
        phoneTextField.leftViewMode = .always
        phoneTextField.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        phoneTextField.layer.borderWidth = 1
        phoneTextField.textColor = UIColor.hexColor(0x333333)
        phoneTextField.layer.cornerRadius = 5
        phoneTextField.layer.masksToBounds = true
        phoneTextField.placeholder = "Input phone number"
        view.addSubview(phoneTextField)
        phoneTextField.snp.makeConstraints{ (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(logoView.snp_bottom).offset(20)
            make.height.equalTo(50)
        }
        
        let passwoedIconView = UIImageView(image: R.image.icon_pwd())
        passwordTextField = UITextField()
        passwordTextField.leftView = passwoedIconView
        passwordTextField.leftViewMode = .always
        passwordTextField.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.textColor = UIColor.hexColor(0x333333)
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.masksToBounds = true
        passwordTextField.placeholder = "Input password"
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints{ (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(phoneTextField.snp_bottom).offset(15)
            make.height.equalTo(50)
        }
        
        let loginButton = UIButton(type: .custom)
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        loginButton.setBackgroundImage(UIColor.hexColor(0xf8892e).toImage(), for: .normal)
        loginButton.layer.cornerRadius = 5
        loginButton.layer.masksToBounds = true
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints{ (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(passwordTextField.snp_bottom).offset(20)
            make.height.equalTo(50)
        }
        
        loginButton.addTarget(self, action: #selector(didClickLoginButton), for: .touchUpInside)
    }
    
    @objc func didClickLoginButton() {
        if validatePhoneNumber(phoneTextField.text ?? "") && validatePassword(passwordTextField.text ?? "") {
            
        } else {
            self.showToast()
        }
    }
    
    func showToast() {
        let alertVC = UIAlertController(title: "Warning", message: "Phone number of password incorrect", preferredStyle: .alert)
        present(alertVC, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            alertVC.dismiss(animated: true, completion: nil)
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
