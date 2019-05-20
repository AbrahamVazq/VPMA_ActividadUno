//
//  Empleados.swift
//  VPMA_ActividadUno
//
//  Created by MACBOOK on 20/05/19.
//  Copyright © 2019 MACBOOK. All rights reserved.
//

import Foundation

public class Empleados
{
    public var nombre: String = ""
    public var email:  String = ""
    public var telefono: Int = 0
    public var fechaNac: String = ""
    public var drowssap: String = ""
    public var reDrowssap: String = ""
    
    public var Empleados: [Empleados] = []
    
    init(nombre: String, email: String, telefono: Int, fechaNac: String, drowssap: String, reDrowssap: String) {
        self.nombre     = nombre
        self.email      = email
        self.telefono   = telefono
        self.fechaNac   = fechaNac
        self.drowssap   = drowssap
        self.reDrowssap = reDrowssap
    }
}
