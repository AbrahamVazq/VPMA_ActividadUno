//
//  RegisterViewController.swift
//  VPMA_ActividadUno
//
//  Created by MACBOOK on 20/05/19.
//  Copyright © 2019 MACBOOK. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {

    //MARK: - O U T L E T S
    @IBOutlet weak var lblNombre:           UITextField!
    @IBOutlet weak var lblEmail:            UITextField!
    @IBOutlet weak var lblFechaNacimienrto: UITextField!
    @IBOutlet weak var lblNoEmpleado:       UITextField!
    @IBOutlet weak var lblTelefono:         UITextField!
    @IBOutlet weak var lblDrowssap:         UITextField!
    @IBOutlet weak var lblReDrowssap:       UITextField!
    @IBOutlet weak var swImOk:              UISwitch!
    
    //MARK: - V A R I A B L E S
    let datePicker = UIDatePicker()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        swImOk.setOn(false, animated: false)
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view.
    }
    
    //MARK: - V A L I D A T I O N S
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    func isValidEmail(string: String) -> Bool
    {
        let emailReg  = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailReg)
        return emailTest.evaluate(with: string)
    }
    
    func isOnlyNumbers(string: String) -> Bool
    {
        return NSPredicate(format: "SELF MATCHES %@", "\\d{10}").evaluate(with: string)
    }
    
    func isValidateBothPass(pass: String, andRePass Repass: String) -> Bool
    {
        if pass != Repass
        {
            self.showAlert(withTitle: "Oops!", withMessage: "Las contraseñas no coinciden :(")
            return false
        }else{ return true }
    }
    
    func isEmptyFields(name: String, email: String, fechaNac: String, NoEmpleado: String, telefono: String, drowssap: String, reDrowssap: String)-> Bool
    {
        if name.isEmpty {
            self.showAlert(withTitle: "Oops!", withMessage: "Ingresa el nombre")
            return false
        }else if email.isEmpty{
            self.showAlert(withTitle: "Oops!", withMessage: "Ingresa el email")
            return false
        }else if fechaNac.isEmpty{
            self.showAlert(withTitle: "Oops!", withMessage: "Ingresa la Fecha de Nac")
            return false
        }else if NoEmpleado.isEmpty{
            self.showAlert(withTitle: "Oops!", withMessage: "Ingresa el numero de empleado")
            return false
        }else if telefono.isEmpty{
            self.showAlert(withTitle: "Oops!", withMessage: "Ingresa el telefono")
            return false
        }else if drowssap.isEmpty{
            self.showAlert(withTitle: "Oops!", withMessage: "Ingresa la contraseña")
            return false
        }else if reDrowssap.isEmpty{
            self.showAlert(withTitle: "Oops!", withMessage: "Ingresa de nuevo la contraseña")
            return false
        }else{
            return true
        }
    }
    
    //MARK: - D A T E · P I C K E R
    
    func showDatePicker()
    {
        datePicker.datePickerMode = .date
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        lblFechaNacimienrto.inputAccessoryView = toolbar
        lblFechaNacimienrto.inputView = datePicker
    }
    
    @objc func donedatePicker()
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        lblFechaNacimienrto.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker()
    {
        self.view.endEditing(true)
    }
    
    //MARK: - A L E R T
    
    func showAlert(withTitle title: String, withMessage message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok   = UIAlertAction(title: "OK", style: .default, handler: { action in })
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { action in })
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
    
    //MARK: - A C T I O N
    @IBAction func btnAlreadyRegistered(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnRegisterUser(_ sender: Any)
    {
        if self.isEmptyFields(name: lblNombre.text!, email: lblEmail.text!, fechaNac: lblFechaNacimienrto.text!, NoEmpleado: lblNoEmpleado.text!, telefono: lblTelefono.text!, drowssap: lblDrowssap.text!, reDrowssap: lblReDrowssap.text!)
        {
            if self.isValidEmail(string: lblEmail.text!)
            {
                if self.isOnlyNumbers(string: lblTelefono.text!)
                {
                    if self.isValidateBothPass(pass: lblDrowssap.text!, andRePass: lblReDrowssap.text!){
                        if self.swImOk.isOn
                        {
                            self.showAlert(withTitle: "Succes!", withMessage: "Listo! el usuario se ah agregado!.")
                            self.dismiss(animated: true, completion: nil)
                        }else{
                            self.showAlert(withTitle: "Oops!", withMessage: "Debes aceptar las politicas para continuar.")
                        }
                    }else{
                        self.showAlert(withTitle: "Oops!", withMessage: "Las contraseñas no coinciden.")
                    }
                }else{
                    self.showAlert(withTitle: "Oops!", withMessage: "El telefono no es correcto.")
                }
            }else{
                self.showAlert(withTitle: "Oops!", withMessage: "El mail no es valido, verificalo.")
            }
        }
    }
    
    @IBAction func txtFechaNac(_ sender: UITextField) {
        self.showDatePicker()
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

