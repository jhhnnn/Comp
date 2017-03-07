//
//  HomeViewController.swift
//  Comp
//
//  Created by Juho Heinonen on 30/01/17.
//  Copyright © 2017 Pekka Pöyry. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBAction func ResetDB(_ sender: Any) {
        Api.resetDb(){ (response) in
            print(response)
    }
        DispatchQueue.main.async(execute: {
            let alertController = UIAlertController(title:"Reset DB", message: "Done!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title:"Dismiss",style:UIAlertActionStyle.default,handler:nil))
            
            self.present(alertController, animated: true, completion: nil)
        })
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
