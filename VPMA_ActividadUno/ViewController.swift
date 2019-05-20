//
//  ViewController.swift
//  VPMA_ActividadUno
//
//  Created by MACBOOK on 20/05/19.
//  Copyright © 2019 MACBOOK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - O U T L E T S
    @IBOutlet weak var lblUserOrEmail: UITextField!
    @IBOutlet weak var lblDrowssap: UITextField!
    
    //MARK: - V A R I A B L E S
    let userH: String = "usuarioTest"
    let userM: String = "aaaa@aaa.com"
    let passH: String = "12345"
    
    //MARK: - Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: - A C T I O N
    @IBAction func btnLogIn(_ sender: Any)
    {
        if self.validateEmptyFields(user: lblUserOrEmail.text!, andPass: lblDrowssap.text!)
        {
            if self.validate(user: lblUserOrEmail.text!, andPass: lblDrowssap.text!)
            {
                performSegue(withIdentifier: "LoginVCToSelectUserVC", sender: self)
            }
        }
    }

    //MARK: - V A L I D A T I O N S
    func validate(user :String, andPass pass: String) -> Bool {
        if user == userH && pass == passH
        {
            return true
        }else if user != userH || user != userM
        {
            self.showAlert(withTitle: "Oops!", withMessage: "Este Usuario no existe!\n Registrate para iniciar")
            return false
        }else if pass != passH
        {
            self.showAlert(withTitle: "Oops!", withMessage: "La contraseña es Incorrecta, por favor, verificala.")
            return false
        }
        return false
    }
    
    func validateEmptyFields(user: String, andPass pass:String) -> Bool {
        if user == "" || pass == ""
        {
            self.showAlert(withTitle: "Oops!", withMessage: "Ingresa los datos necesarios por favor.")
            return false
        }else{
            return true
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    //MARK: - A L E R T
    func showAlert(withTitle title: String, withMessage message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok    = UIAlertAction(title: "OK", style: .default, handler: { action in })
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { action in })
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }

    //MARK: - N A V I G A T I O N
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "LoginVCToSelectUserVC"){
            // pass data to next view
        }
     }
}

