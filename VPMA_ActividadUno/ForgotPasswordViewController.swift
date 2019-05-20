//
//  ForgotPasswordViewController.swift
//  VPMA_ActividadUno
//
//  Created by MACBOOK on 20/05/19.
//  Copyright © 2019 MACBOOK. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var btnSendOutlet: UIButton!
    @IBOutlet weak var lblEmail: UITextField!
    
    let strEmail: String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @IBAction func btnSendOk(_ sender: Any)
    {
        if self.isValidEmail(string: lblEmail.text!)
    {
            let alert = UIAlertController(title: "Hecho!", message: "Revisa tu correo electronico, para recuperar tu contraseña.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
                self.dismiss(animated: true, completion: nil)
            })
           
            alert.addAction(ok)
            DispatchQueue.main.async(execute: {
                self.present(alert, animated: true)
            })
        
        }else if lblEmail.text == "" {
            self.showAlert(withTitle: "Oops!", withMessage: "Ingresa el correo electronico para recuperar tu contraseña.")
        }else{
            self.showAlert(withTitle: "Oops!", withMessage: "Ingresa un correo electronico valido.")
        }
    }

    //MARK: - A L E R T
    func showAlert(withTitle title: String, withMessage message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok    = UIAlertAction(title: "OK", style: .default, handler: { action in })
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { action in })
        
        alert.addAction(ok)
        alert.addAction(cancel)
        DispatchQueue.main.async(execute: { self.present(alert, animated: true) })
    }
    
    //MARK: - V A L I D A T I O N S
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func isValidEmail(string: String) -> Bool
    {
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailReg)
        return emailTest.evaluate(with: string)
    }
}
