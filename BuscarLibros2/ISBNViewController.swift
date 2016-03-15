//
//  ISBNViewController.swift
//  BuscarLibros2
//
//  Created by Juan  Sanchez on 29/2/16.
//  Copyright © 2016 Juan  Sanchez. All rights reserved.
//

import UIKit
import CoreData

class ISBNViewController: UIViewController {
    
    var contexto : NSManagedObjectContext? = nil
    
    @IBOutlet weak var tituloISBN: UILabel!
    @IBOutlet weak var imagenISBN: UIImageView!
    @IBOutlet weak var autorISBN: UITextView!
    let portadaVacia = UIImage(named: "portada")
    var autoresArray = [String]()
    
    @IBAction func btnBuscar(sender: UITextField) {
        
        self.contexto = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        
        let lecturaISBN = sender.text
        let libroEntidad = NSEntityDescription.entityForName("Libros", inManagedObjectContext: self.contexto!)
        let peticion = libroEntidad?.managedObjectModel.fetchRequestFromTemplateWithName("buscarLibro", substitutionVariables: ["isbn" : lecturaISBN!])
        do {
            let registros = try self.contexto?.executeFetchRequest(peticion!)
            
            if registros?.count > 0 {
                self.tituloISBN.text = "Este libro ya existe en la base"
                return
            }
        }
        catch {
        }
        
        if Internet.conectado() == true {
            
            let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + lecturaISBN!
            let url = NSURL(string: urls)
            let datos = NSData(contentsOfURL: url!)
            do {
                let json = try   NSJSONSerialization.JSONObjectWithData(datos!, options: NSJSONReadingOptions.MutableLeaves)
                let objeto1 = json as! NSDictionary
                let lecturaSinGuiones = lecturaISBN!
                let nombreLlave:String = "ISBN:" + lecturaSinGuiones
                if objeto1.count > 0 {
                    let objeto2 = objeto1[nombreLlave] as! NSDictionary
                    // obtener el titulo
                    let titulo = objeto2["title"] as! NSString as String
                    self.tituloISBN.text = titulo
                    var autoresTxt = ""
                    // obtener el o los autores
                    let autores = objeto2["authors"] as! NSArray as Array
                    if autores.count > 1 {
                        autoresTxt = "Autores : "
                    } else {
                        autoresTxt = "Autor : "
                    }
                    
                    for a in 0..<autores.count {
                        let objeto3 = autores[a] as! NSDictionary
                        let nombre = objeto3["name"] as! NSString as String
                        autoresTxt = autoresTxt + nombre + "\n"
                        autoresArray.append(nombre)
                    }
                    autorISBN.text = autoresTxt
                    self.imagenISBN.image =  self.portadaVacia
                    // obtener la portada
                    if objeto2["cover"] != nil {
                        let objeto4 = objeto2["cover"] as! NSDictionary
                        if objeto4.count > 0 {
                            let imagenMediana = objeto4["medium"] as! NSString as String
                            let urlImagen = NSURL(string: imagenMediana)
                            if let imagenData = NSData(contentsOfURL: urlImagen!) {
                                print("hay imagen")
                                self.imagenISBN.image = UIImage(data: imagenData )
                            }
                        }
                    }
                    
                    

                    
                    let libroNuevo = NSEntityDescription.insertNewObjectForEntityForName("Libros", inManagedObjectContext: self.contexto!)
                    
                    libroNuevo.setValue(lecturaISBN!, forKey: "isbn")
                    libroNuevo.setValue(self.tituloISBN.text!, forKey: "titulo")
                    libroNuevo.setValue(autoresTxt, forKey: "autor")
                    libroNuevo.setValue(UIImagePNGRepresentation(self.imagenISBN.image!) , forKey: "portada")
                    
                    do {
                          try self.contexto?.save()
                       }
                    catch {
                    
                    }
                    
                    libros.append(Libro(isbn: lecturaISBN!,titulo:self.tituloISBN.text!) )
                    
                    
                    
                } else {
                    self.tituloISBN.text = "codigo no encontrado"
                }
            }
            catch _ {
                
            }
            
        } else {
            self.tituloISBN.text = "Verifica tu coneccion de internet"
        }
        
        
        
        
        
        
        sender.resignFirstResponder()
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
/*
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let controller = segue.destinationViewController as! TableViewController
        
        //controller.libros.append(libro)
    }
    */
    

}
