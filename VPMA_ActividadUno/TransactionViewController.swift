//
//  TransactionViewController.swift
//  VPMA_ActividadUno
//
//  Created by Abraham Vazquez on 5/23/19.
//  Copyright © 2019 MACBOOK. All rights reserved.
//

import UIKit

class TransactionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tblTransaction: UITableView!
    
    //MARK: - V A R I A B L E S
    var wsstruct: WSStruct?
    var numberEmployes: Int = 0
    var objEmploye = EmployeeStruct()

    //MARK: - L I F E C Y C L E
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib.init(nibName: "EmployeTableViewCell", bundle: nil)
        self.tblTransaction.register(nib, forCellReuseIdentifier: "employeCell")
        self.showInfo()
    }
    
    //MARK: - T A B L E · V I E W ··· D E L E G A T E S
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if wsstruct != nil
        {
            return (self.wsstruct?.data!.count)!
        }
        
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeCell", for: indexPath) as! EmployeTableViewCell
        
        cell.lblNombre.text = wsstruct?.data![indexPath.row].fullName
//        cell.imgImageCumpleaños.image = #imageLiteral(resourceName: "cake")
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier:"TransactionVCToMapTransactionVC", sender: self)
    }
    
    // F U N C T I O N S
    func showInfo()
    {
        let urlToGo: String = "http://www.develogeeks.com/netec/capitulo4/consumoApi/Empleados/getList.php"
        let request = URLRequest(url: URL(string: urlToGo)!)
        let task    = URLSession.shared.dataTask(with: request){(data , response , error) in
            
            if error != nil{
                print("Error: \(String(describing: error))")
            }else{
                if let resp = data{
                    do{
                        self.wsstruct = try JSONDecoder().decode(WSStruct.self, from: resp)
                        print(self.wsstruct?.data?.count as Any)
                        print(self.wsstruct?.status as Any)
                        
                        self.numberEmployes = (self.wsstruct?.data?.count)! as Int
                        
                        //                        let primerReg = self.wsstruct?.data?[((self.wsstruct?.data!.count)!) - 1]
                        //                        print(primerReg!.fullName as Any)
                        //                        print(primerReg!.address as Any)
                        //                        print(primerReg!.birthday as Any)
                        DispatchQueue.main.async(execute: {
                            self.tblTransaction.reloadData()
                        })
                        
                    }catch{
                        print("error \(error)")
                    }
                }
            }
        }
        task.resume()
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "TransactionVCToMapTransactionVC"
        {
            if let indexPath = self.tblTransaction.indexPathForSelectedRow {
                print(indexPath)
                
                let vcObj = segue.destination as! MapTransactionsViewController
                //                vcObj.iNoEmploye           = (wsstruct?.data![indexPath.row].idEmployee)!
                //                vcObj.strFullName          = (wsstruct?.data![indexPath.row].fullName)!
                //                vcObj.streMail             = (wsstruct?.data![indexPath.row].email)!
                //                vcObj.strPhoto             = (wsstruct?.data![indexPath.row].photo)!
                //                vcObj.strAddress           = (wsstruct?.data![indexPath.row].address)!
                //                vcObj.strCompany           = (wsstruct?.data![indexPath.row].company)!
                //                vcObj.strArea              = (wsstruct?.data![indexPath.row].area)!
                //                vcObj.strSeniority         = (wsstruct?.data![indexPath.row].seniority)!
                //                vcObj.strDateInPayRoll     = (wsstruct?.data![indexPath.row].dateInPayRoll ?? "")!
                //                vcObj.strBirthday          = (wsstruct?.data![indexPath.row].birthday ?? "")!
                //                vcObj.strAge               = (wsstruct?.data![indexPath.row].age ?? "")!
                //                vcObj.strMaritalStatus     = (wsstruct?.data![indexPath.row].maritalStatus ?? "")!
                //                vcObj.strRole              = (wsstruct?.data![indexPath.row].role ?? "")!
                //                vcObj.strProductsPurchased = (wsstruct?.data![indexPath.row].productsPurchased ?? "")!
            }
        }
    }


    //MARK: - A C T I O N S
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
