//
//  TableViewController.swift
//  BuscarLibros2
//
//  Created by Juan  Sanchez on 29/2/16.
//  Copyright © 2016 Juan  Sanchez. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    var detalleLibro = Libro()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        print(libros.count)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return libros.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = libros[indexPath.row].titulo
        cell.imageView?.image = libros[indexPath.row].portada
        cell.detailTextLabel?.text = libros[indexPath.row].autores[0] as String
        
        // Configure the cell...

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
        
        if segue.identifier == "Detalle" {
           print("Detalle")
           if let indexPath = self.tableView.indexPathForSelectedRow {
              self.detalleLibro = libros[indexPath.row]
              let controller = segue.destinationViewController as! DetalleViewController
              controller.titulo = "Titulo : " + detalleLibro.titulo
              controller.portada = detalleLibro.portada
              var autores : String = ""
              if detalleLibro.autores.count > 1 {
                 autores = "Autores : "
              } else {
                autores = "Autor : "
              }
             for a in 0..<detalleLibro.autores.count {
                autores = autores + detalleLibro.autores[a] + "\n"
             }
             controller.autor = autores
            }
          } else {
          print("ISBN")
        }
        
        
    }
    

}
