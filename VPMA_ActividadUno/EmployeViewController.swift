//
//  EmployeViewController.swift
//  VPMA_ActividadUno
//
//  Created by MACBOOK on 20/05/19.
//  Copyright © 2019 MACBOOK. All rights reserved.
//

import UIKit

class EmployeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - O U T L E T S
    @IBOutlet weak var tblEmployeTableView: UITableView!
    
    //MARK: - V A R I A B L E S
    var wsstruct: WSStruct?
    var numberEmployes: Int = 0
    var objEmploye = EmployeeStruct()
    
    //MARK: - L I F E C Y C L E
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //Registro del Nib para las celdas
        let nib = UINib.init(nibName: "EmployeTableViewCell", bundle: nil)
        self.tblEmployeTableView.register(nib, forCellReuseIdentifier: "employeCell")
        
        self.showInfo()
        
    }
    
    //MARK: - T A B L E · D E L E G A T E S
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
        cell.imgImageCumpleaños.image = #imageLiteral(resourceName: "cake")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier:"tblEmployeToEmployeEditData", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "tblEmployeToEmployeEditData"
        {
            if let indexPath = self.tblEmployeTableView.indexPathForSelectedRow {
                print(indexPath)
                
                let vcObj = segue.destination as! EditDataEmployesViewController
                vcObj.iNoEmploye           = (wsstruct?.data![indexPath.row].idEmployee)!
                vcObj.strFullName          = (wsstruct?.data![indexPath.row].fullName)!
                vcObj.streMail             = (wsstruct?.data![indexPath.row].email)!
                vcObj.strPhoto             = (wsstruct?.data![indexPath.row].photo)!
                vcObj.strAddress           = (wsstruct?.data![indexPath.row].address)!
                vcObj.strCompany           = (wsstruct?.data![indexPath.row].company)!
                vcObj.strArea              = (wsstruct?.data![indexPath.row].area)!
                vcObj.strSeniority         = (wsstruct?.data![indexPath.row].seniority)!
                vcObj.strDateInPayRoll     = (wsstruct?.data![indexPath.row].dateInPayRoll ?? "")!
                vcObj.strBirthday          = (wsstruct?.data![indexPath.row].birthday ?? "")!
                vcObj.strAge               = (wsstruct?.data![indexPath.row].age ?? "")!
                vcObj.strMaritalStatus     = (wsstruct?.data![indexPath.row].maritalStatus ?? "")!
                vcObj.strRole              = (wsstruct?.data![indexPath.row].role ?? "")!
                vcObj.strProductsPurchased = (wsstruct?.data![indexPath.row].productsPurchased ?? "")!
            }
        }
    }
    
    
    // V A L I D A T I O N S
    
    
    
    
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
                            self.tblEmployeTableView.reloadData()
                        })
                        
                    }catch{
                        print("error \(error)")
                    }
                }
            }
        }
        task.resume()
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
