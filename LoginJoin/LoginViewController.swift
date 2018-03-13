//
//  ViewController.swift
//  LoginJoin
//
//  Created by yuny on 2018. 3. 5..
//  Copyright © 2018년 YunYoung. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toJoin"  {
            let vc = segue.destination as! JoinViewController
            vc.id = idTextField.text ?? ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        idTextField.delegate = self
        passwordTextField.delegate = self
    }
    @IBOutlet weak var loginEnterButton: UIButton!
    
    @IBAction func loginEnterAction(_ sender: UIButton) {
        print("go") //홈화면 연결
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources thsat can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField == idTextField) {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            loginEnterAction(loginEnterButton)
        }
        return true
    }

    @IBOutlet weak var joinButton: UIButton!
    @IBAction func joinAction(_ sender: UIButton) {
        //회원가입화면 연결
        
    }
}

