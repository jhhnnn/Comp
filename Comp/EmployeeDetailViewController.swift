//
//  EmployeeDetailViewController.swift
//  Comp
//
//  Created by Juho Heinonen on 06/02/17.
//  Copyright © 2017 Pekka Pöyry. All rights reserved.
//

import UIKit

class EmployeeDetailViewController: UITableViewController {
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var salary: UITextField!
    @IBOutlet weak var bdate: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var dep: UITextField!
    @IBOutlet weak var phone1: UITextField!
    @IBOutlet weak var phone2: UITextField!
    @IBOutlet weak var image: UIImageView!
    
    var employee: Employee! = Employee()
    var empIndex: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.id.text = self.employee.id
        self.fname.text = self.employee.fname
        self.lname.text = self.employee.lname
        self.bdate.text = self.employee.bdate
        self.dep.text = self.employee.dep
        self.email.text = self.employee.email
        self.salary.text = String(format: "%.2f", self.employee.salary!)
        self.phone1.text = self.employee.phone1
        self.phone2.text = self.employee.phone2
        
        let imgName: String = Api.companyImageUrl + self.employee.image!
        let url = URL(string: imgName)
        let data = try? Data(contentsOf: url!)
        if data != nil {
            self.image.image = UIImage(data: data!)
        }else{
            self.image.image = UIImage(named: "no_image")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source



    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "updateToEmployees"{
            employee.fname = self.fname.text!
            employee.lname = self.lname.text!
            employee.email = self.email.text!
            employee.salary = Double(self.salary.text!) ?? 0.0
            employee.phone1 = self.phone1.text!
            employee.phone2 = self.phone2.text!
            employee.dep = self.dep.text!
            employee.bdate = self.bdate.text!
        }
        if segue.identifier == "bdatePicker"{
            
            employee.fname = self.fname.text!
            employee.lname = self.lname.text!
            employee.email = self.email.text!
            employee.salary = Double(self.salary.text!) ?? 0.0
            employee.phone1 = self.phone1.text!
            employee.phone2 = self.phone2.text!
            employee.dep = self.dep.text!
            employee.bdate = self.bdate.text!
            
            /*
            let cell = sender as! UITableViewCell
            let indexPath = self.tableView.indexPath(for:cell)
            
            let nav = segue.destination as! UINavigationController
            let dateEmployee = nav.topViewController as! DateViewController
            
            
            dateEmployee.empIndex = indexPath
            */
            
            
            
        }
    }
    

}
