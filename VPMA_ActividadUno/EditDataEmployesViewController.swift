//
//  EditDataEmployesViewController.swift
//  VPMA_ActividadUno
//
//  Created by Abraham Vazquez on 5/22/19.
//  Copyright © 2019 MACBOOK. All rights reserved.
//

import UIKit

class EditDataEmployesViewController: UIViewController {

    //MARK: - O U T L E T S
    @IBOutlet weak var txfidEmploye:         UITextField!
    @IBOutlet weak var txfFullName:          UITextField!
    @IBOutlet weak var txfeMail:             UITextField!
    @IBOutlet weak var txfPhoto:             UITextField!
    @IBOutlet weak var txfAddress:           UITextField!
    @IBOutlet weak var txfCompany:           UITextField!
    @IBOutlet weak var txfArea:              UITextField!
    @IBOutlet weak var txfSeniority:         UITextField!
    @IBOutlet weak var txfDateInPayRoll:     UITextField!
    @IBOutlet weak var txfBirthday:          UITextField!
    @IBOutlet weak var txfAge:               UITextField!
    @IBOutlet weak var txfMaritalStatus:     UITextField!
    @IBOutlet weak var txfRole:              UITextField!
    @IBOutlet weak var txfProductsPurchased: UITextField!
    @IBOutlet weak var btnSave:              UIButton!
    
    //MARK: - V A R I A B L E S
    var iNoEmploye:           Int = 0
    var strFullName:          String = ""
    var streMail:             String = ""
    var strPhoto:             String = ""
    var strAddress:           String = ""
    var strCompany:           String = ""
    var strArea:              String = ""
    var strSeniority:         String = ""
    var strDateInPayRoll:     String = ""
    var strBirthday:          String = ""
    var strAge:               String = ""
    var strMaritalStatus:     String = ""
    var strRole:              String = ""
    var strProductsPurchased: String = ""
    
    //MARK: - L I F E C Y C L E
    override func viewDidLoad() {
        super.viewDidLoad()
        txfidEmploye.text         = String(iNoEmploye)
        txfFullName.text          = strFullName
        txfeMail.text             = streMail
        txfPhoto.text             = strPhoto
        txfAddress.text           = strAddress
        txfCompany.text           = strCompany
        txfArea.text              = strArea
        txfSeniority.text         = strSeniority
        txfDateInPayRoll.text     = strDateInPayRoll
        txfBirthday.text          = strBirthday
        txfAge.text               = strAge
        txfMaritalStatus.text     = strMaritalStatus
        txfRole.text              = strRole
        txfProductsPurchased.text = strProductsPurchased
    }
    
    @IBAction func btnDone(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
