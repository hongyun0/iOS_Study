//
//  File.swift
//  LoginJoin
//
//  Created by yuny on 2018. 3. 5..
//  Copyright © 2018년 YunYoung. All rights reserved.
//

import Foundation
import UIKit

class JoinViewController : UIViewController, UITextFieldDelegate {
    @IBOutlet weak var idGenerateTextField: UITextField!
    
    @IBOutlet weak var passwordGenerateTextField: UITextField!
    
    @IBOutlet weak var passwordCheckTextField: UITextField!
    
    @IBOutlet weak var nickNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var alertTextLabel: UILabel!
    
    @IBOutlet weak var profilePhotoPreview: UIImageView!
    
    @IBOutlet weak var profilePhotoUpdateIcon: UIImageView!
    
    var id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 각 텍스트필드의 delegate 연결해둠.
    }
    override func didReceiveMemoryWarning() {
        
    }
    
    @IBAction func profileCameraIconTap(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var JoinEnterButton: UIButton!
    
    @IBAction func JoinEnterAction(_ sender: UIButton) {
        alertTextLabel.text = ""
        
        guard let idCount = idGenerateTextField.text?.count, idCount >= 6, idCount <= 15 else {
            alertTextLabel.text = "아이디는 6자 이상 15자 이하이어야 합니다."
            idGenerateTextField.becomeFirstResponder()
            return
        }
        
        guard let passwordCount = passwordGenerateTextField.text?.count, passwordCount >= 8, passwordCount <= 16 else {
            alertTextLabel.text = "비밀번호는 8자 이상 16자 이하이어야 합니다."
            passwordGenerateTextField.becomeFirstResponder()
            return
        }
        
        guard passwordCheckTextField.text == passwordGenerateTextField.text else {
            alertTextLabel.text = "비밀번호와 비밀번호 확인이 다릅니다."
            passwordCheckTextField.becomeFirstResponder()
            return
        }
        
        guard nickNameTextField.text != "" else {
            alertTextLabel.text = "닉네임을 입력해주세요."
            nickNameTextField.becomeFirstResponder()
            return
        }
        
        guard let emailText = emailTextField.text, emailText.first != "@", emailText.contains("@"), emailText.last != "@" else {
            alertTextLabel.text = "이메일을 올바르게 입력해주세요."
            emailTextField.becomeFirstResponder()
            return
        }
        
                //회원가입 성공 화면 연결
        print("welcome")
        view.endEditing(true)
//
//        if let idCount = idGenerateTextField.text?.count, idCount < 6 {
//            alertTextLabel.text = "똑바로 Id 입력해라"
//            idGenerateTextField.becomeFirstResponder()
//        }

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idGenerateTextField {
            passwordGenerateTextField.becomeFirstResponder()
        } else if textField == passwordGenerateTextField {
            passwordCheckTextField.becomeFirstResponder()
        } else if textField == passwordCheckTextField {
            emailTextField.becomeFirstResponder()
        } else if textField == emailTextField {
            nickNameTextField.becomeFirstResponder()
        } else if textField == nickNameTextField {
            nickNameTextField.resignFirstResponder()
        }
        return true
    }
}

extension JoinViewController: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // Dictionary? Tuple? Array?
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            return
        }
        
        profilePhotoPreview.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
}

extension JoinViewController: UINavigationControllerDelegate {
    
}
