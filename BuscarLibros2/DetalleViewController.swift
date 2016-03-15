//
//  DetalleViewController.swift
//  BuscarLibros2
//
//  Created by Juan  Sanchez on 29/2/16.
//  Copyright © 2016 Juan  Sanchez. All rights reserved.
//

import UIKit
import CoreData

class DetalleViewController: UIViewController {
    
    var isbn = ""
    
    var contexto : NSManagedObjectContext? = nil
    
    @IBOutlet weak var tituloLibro: UILabel!
    
    @IBOutlet weak var portadaLibro: UIImageView!
    
    @IBOutlet weak var autorLibro: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contexto = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let libroEntidad = NSEntityDescription.entityForName("Libros", inManagedObjectContext: self.contexto!)
        let peticion = libroEntidad?.managedObjectModel.fetchRequestFromTemplateWithName("buscarLibro", substitutionVariables: ["isbn" : isbn])
        do {
            let registros = try self.contexto!.executeFetchRequest(peticion!)
            
            if registros.count > 0 {
                //let _isbn = registros[0].valueForKey("isbn") as! String
                let _titulo = registros[0].valueForKey("titulo") as! String
                let _autor = registros[0].valueForKey("autor") as! String
                let _portada = registros[0].valueForKey("portada") as! NSData
                tituloLibro.text = _titulo
                autorLibro.text = _autor
                portadaLibro.image = UIImage(data:  _portada )
            }
        }
        catch {
        }
        
        /*
        tituloLibro.text = self.titulo
        autorLibro.text = self.autor
        portadaLibro.image = self.portada!
        */

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
    }
    */

}
