//
//  EmployeeStruct.swift
//  VPMA_ActividadUno
//
//  Created by Abraham Vazquez on 5/21/19.
//  Copyright © 2019 MACBOOK. All rights reserved.
//

import Foundation

class EmployeeStruct: Decodable {
    
    var idEmployee: Int?
    var fullName:   String?
    var email:      String?
    var photo:      String?
    var adress:     String?
    var company:    String?
    var area:       String?
    var seniority:  String?
    var dateInPayRoll:  String?
    var birthday:       String?
    var age:            String?
    var maritalStatus:  String?
    var role:           String?
    var productsPurchased:String?
    
    init?(){ return nil}
    
}
