//
//  Libro.swift
//  BuscarLibros2
//
//  Created by Juan  Sanchez on 29/2/16.
//  Copyright © 2016 Juan  Sanchez. All rights reserved.
//

import UIKit


public class Libro {
    var titulo : String
    var autores : [String]
    var portada : UIImage
    
    init ( titulo: String, autores: [String], portada: UIImage){
        self.titulo = titulo
        self.autores = autores
        self.portada = portada
        
    }
    
    init () {
        titulo = ""
        autores = []
        portada = UIImage(named: "portada")!
    }
}


public var libros = [Libro]()


