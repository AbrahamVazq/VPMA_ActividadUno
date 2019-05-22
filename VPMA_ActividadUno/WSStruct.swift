//
//  WSStruct.swift
//  VPMA_ActividadUno
//
//  Created by Abraham Vazquez on 5/22/19.
//  Copyright © 2019 MACBOOK. All rights reserved.
//

import Foundation

class WSStruct: Decodable {
    var status: Bool?
    var data:   [EmployeeStruct]?
    
    init?() {
        return nil
    }
    
}
