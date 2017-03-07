//
//  DateViewController.swift
//  Comp
//
//  Created by Juho Heinonen on 13/02/17.
//  Copyright © 2017 Pekka Pöyry. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {
    var employee: Employee!
    var empIndex: IndexPath!
    
    let dateFormatter = DateFormatter()
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: self.employee.bdate!){
            datePicker.date = date
        }else{
            let date = "1970-01-01"
            datePicker.date = dateFormatter.date(from: date)!
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        self.employee.bdate = dateFormatter.string(from: datePicker.date)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
