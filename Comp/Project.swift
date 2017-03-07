//
//  Project.swift
//  Comp
//
//  Created by Juho Heinonen on 13/02/17.
//  Copyright © 2017 Pekka Pöyry. All rights reserved.
//

import Foundation

struct Project {
    var id: String
    var pname: String?
    var mid: String?
    var fname: String?
    var lname: String?
    var image: String?
}

extension Project {
    init(){
        self.id = ""
        self.pname = ""
        self.mid = ""
        self.fname = ""
        self.lname = ""
        self.image = ""
    }
}

extension Project {
    init?(json: [String:Any]){
        self.id = (json["id"] as? String)!
        self.pname = (json["pname"] as? String)!
        self.mid = (json["mid"] as? String)!
        self.fname = (json["fname"] as? String)!
        self.lname = (json["lname"] as? String)!
        self.image = (json["image"] as? String)!
    }
}

extension Project {
    
    static func getProjects(completion: @escaping ([Project]) -> Void) {
        var projects: [Project] = []
        let getUrl = "projects"
        
        Api.read(getUrl: getUrl) { (data, succeeded, error)
            in
            
            if !succeeded {
                print(error as Any)
            } else {
                do {
                    
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                    let projectsData = parsedData["data"] as! [[String:Any]]
                    
                    for case let result in projectsData {
                        if let project = Project(json: result) {
                            projects.append(project)
                        }
                    }
                    
                } catch let error as NSError {
                    print(error)
                }
            }
            completion(projects)
        }
        
    }
    
    static func createProject(proj:Project, postCompleted : @escaping(Bool,String)->Void){
        let createUrl = "project"
        Api.write(method: "POST",
                  body: ["pname":proj.pname!,
                         "mid":proj.mid!]
            , postUrl: createUrl, postCompleted:
            {(succeeded:Bool,msg:String)->()in
                if(succeeded){
                    print("Success!")
                }else{
                    print("Failed")
                }
                postCompleted(succeeded,msg)
        })
    }
    
    static func deleteProject(proj:Project, postCompleted : @escaping(Bool,String)->Void){
        let deleteUrl = "project/" + proj.id
        Api.write(method:"DELETE",body:[:],postUrl: deleteUrl, postCompleted: {(succeeded:Bool,msg:String)->()in
            
            if(succeeded){
                print("Success!")
            }
            else{
                print("Failed!")
            }
            postCompleted(succeeded,msg)
        })
    }

}
