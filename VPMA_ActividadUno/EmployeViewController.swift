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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //Registro del Nib para las celdas
        let nib = UINib.init(nibName: "EmployeTableViewCell", bundle: nil)
        self.tblEmployeTableView.register(nib, forCellReuseIdentifier: "employeCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeCell", for: indexPath) as! EmployeTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
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
