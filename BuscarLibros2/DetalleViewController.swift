//
//  DetalleViewController.swift
//  BuscarLibros2
//
//  Created by Juan  Sanchez on 29/2/16.
//  Copyright © 2016 Juan  Sanchez. All rights reserved.
//

import UIKit

class DetalleViewController: UIViewController {
    
    var titulo = ""
    var autor = ""
    var portada : UIImage?
    
    
    @IBOutlet weak var tituloLibro: UILabel!
    
    @IBOutlet weak var portadaLibro: UIImageView!
    
    @IBOutlet weak var autorLibro: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tituloLibro.text = self.titulo
        autorLibro.text = self.autor
        portadaLibro.image = self.portada!

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
