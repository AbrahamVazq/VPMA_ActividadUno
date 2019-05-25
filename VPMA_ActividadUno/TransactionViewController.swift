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
    var cell: EmployeTableViewCell = EmployeTableViewCell()

    //MARK: - L I F E C Y C L E
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib.init(nibName: "EmployeTableViewCell", bundle: nil)
        self.tblTransaction.register(nib, forCellReuseIdentifier: "employeCell")
        self.showInfo()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        cell.tag = 0
    }
    
    //MARK: - T A B L E · V I E W ··· D E L E G A T E S
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if wsstruct != nil{
            return (self.wsstruct?.data!.count)!
        }
        return 0
    }
    func harcode(){
        
        for item :EmployeeStruct in  wsstruct!.data! {
            var id = item.idEmployee
            
            if (id! % 5 == 0) {
                
                item.role = "gerente"
                
            }else {
                item.role = "obrero"
                
            }
            
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell = tableView.dequeueReusableCell(withIdentifier: "employeCell", for: indexPath) as! EmployeTableViewCell
        let id = wsstruct?.data![indexPath.row].idEmployee
        
        cell.lblNombre.text = wsstruct?.data![indexPath.row].fullName
        
     var employe =  wsstruct?.data?[indexPath.row]
        
        if (employe?.role != "gerente") {
          
            cell.lblSeeRute.isHidden = false
          
      
        }else {
             cell.backgroundColor? = UIColor.green
            cell.lblSeeRute.isHidden = true
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var employe =  wsstruct?.data?[indexPath.row]
        if employe?.role != "gerente"{
             performSegue(withIdentifier:"TransactionVCToMapTransactionVC", sender: self)
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100.0
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
                        self.harcode()
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
               
            }
        }
    }

    //MARK: - A C T I O N S
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
