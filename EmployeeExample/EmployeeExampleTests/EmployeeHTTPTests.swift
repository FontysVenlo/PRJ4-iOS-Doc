//
//  EmployeeHTTPTests.swift
//  EmployeeExampleTests
//
//  Created by Gregor Schwake on 10/04/2020.
//  Copyright © 2020 Gregor Schwake. All rights reserved.
//

import XCTest
@testable import EmployeeExample

class EmployeeHTTPTests: XCTestCase {

    
    // Test HTTP Request GET for specified id
    func testEmployeeGet() {
        
        // 1. Define an expectation
        let expect = expectation(description: "Request and run callback closure")
        
        // 2. Define session and url
        let defaultSession = URLSession(configuration: .default)
        let url = URL(string: "http://[::1]:3000/employees/1?")
        
        // 3. Define the task
        // Forced unwrap of url - we set it ourselves
        let task = defaultSession.dataTask(with: url!) { data, response, error in
            // Check data
            if let data = data  {
                // Decode JSON
                let decoder = JSONDecoder()
                do {
                    let employee = try decoder.decode(Employee.self, from: data)
                    XCTAssert(employee.id == 1, "Wrong employee id")
                    XCTAssert(employee.firstName == "Jan", "Wrong employee firstName")
                    XCTAssert(employee.lastName == "Holland", "Wrong employee lastName")
                } catch {
                    XCTFail(error.localizedDescription)
                }
               
            } else {
                XCTFail("No data")
            }
            
            // 4. Don't forget to fulfill the expectation in the async callback
            expect.fulfill()
          
        }
        // 5. Run the tast
        task.resume()
        
        
        // 6. Wait for the expectation to be fulfilled
        waitForExpectations(timeout: 4) {
            error in if let error = error {
                XCTFail("Error \(error)")
            }
        }
    }
}
