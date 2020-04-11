//
//  ViewController.swift
//  EmployeeExample
//
//  Created by Gregor Schwake on 07/04/2020.
//  Copyright © 2020 Gregor Schwake. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func getEmployees(_ sender: UIButton) {
        testGetEmployees()
    }
    
    // Simple GET request
    func testGetEmployees() {
        let defaultSession = URLSession(configuration: .default)
        let url = URL(string: "http://[::1]:3000/employees?")
        
        // Forced unwrap of url - we set it ourselves
        let task = defaultSession.dataTask(with: url!) { data, response, error in

            // Print Error
            if let error = error  {
                print ("error: \(error)")
            }
            
            // Print Data
            if let data = data  {
                print ("data: \(data)")
                
                // Print and decode JSON
                do {
                    // Print JSON
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    
                    // Decode JSON
                    let employees = try JSONDecoder().decode([Employee].self, from: data)
                    print("Employees:")
                    for employee in employees {
                        print("id: \(employee.id)")
                        print("firstName: \(employee.firstName)")
                        print("lastName: \(employee.lastName)")
                    }
                } catch {
                    print("JSON error: \(error.localizedDescription)")
                }
            }
            
            // Print Response
            if let response = response  {
                print ("response: \(response)")
            }
            
        }

        // Now do the work
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

