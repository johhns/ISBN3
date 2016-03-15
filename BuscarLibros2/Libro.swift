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
    var isbn : String
    
    init ( isbn: String, titulo: String){
        self.isbn = isbn
        self.titulo = titulo
    }
    
    init () {
        isbn = ""
        titulo = ""
    }
}


public var libros = [Libro]()


