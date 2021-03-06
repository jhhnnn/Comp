//
//  ProjectsViewController.swift
//  Comp
//
//  Created by Juho Heinonen on 13/02/17.
//  Copyright © 2017 Pekka Pöyry. All rights reserved.
//

import UIKit

class ProjectsViewController: UITableViewController {
    var projects: [Project] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl?.addTarget(self, action: #selector(ProjectsViewController.handleRefresh(_:)), for: UIControlEvents.valueChanged)
        self.loadData()
        
    }
    
    func handleRefresh(_ sender:AnyObject){
        loadData()
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return projects.count
    }
    
    func loadData()->Void{
        Project.getProjects{(projects)in
            self.projects = projects
            print("proj: ")
            print(self.projects)
            
            DispatchQueue.main.async (execute:{
                print("proj: ")
                print(self.projects.count)
                self.tableView.reloadData()
            })
        }}
      
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath) as! ProjectCell
        
        let project = projects[indexPath.row] as Project
        cell.project = project
        
        // Configure the cell...
        
        return cell;
    }

    
    @IBAction func saveToProjects(_ segue:UIStoryboardSegue){
        if let projectController = segue.source as? NewProjectViewController{
            Project.createProject(proj: projectController.project, postCompleted: {(succeeded,msg)->()in
                if succeeded{
                    self.loadData()
                }
            })
        }
    }
    @IBAction func cancelToProjects(_ segue:UIStoryboardSegue){
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let proj = self.projects[indexPath.row]
            Project.deleteProject(proj: proj, postCompleted: {(succeeded,msg)->()in
                print("delete proj "+msg)
                if(succeeded){
                    self.projects.remove(at: indexPath.row)
                }
                
                DispatchQueue.main.async(execute:{
                    if (succeeded){
                        self.tableView.deleteRows(at:[indexPath],with: .fade)
                    }
                })
            })
        }
        
        /*
        else if editingStyle == .insert {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }*/
    }
    

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
