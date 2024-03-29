
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**PRJ4 iOS/Swift Documentation**

- [Intro Swift / Basic GUI](#intro-swift--basic-gui)
- [Backend: Loopback 4 - IBM Cloud](#backend-loopback-4---ibm-cloud)
  - [Loopback 4 - Basics](#loopback-4---basics)
  - [Push Notification - Backend](#push-notification---backend)
  - [Authentication - Backend](#authentication---backend)
  - [Deploying to IBM Cloud](#deploying-to-ibm-cloud)
- [Camera](#camera)
- [GPS](#gps)
- [Map](#map)
- [Push Notification](#push-notification)
  - [Push Notification - APN](#push-notification---apn)
  - [Push Notification - Frontend](#push-notification---frontend)
- [Backend/Frontend Example](#backendfrontend-example)
  - [Backend: Employee REST API](#backend-employee-rest-api)
    - [Create the app](#create-the-app)
    - [Create the model](#create-the-model)
    - [Create the datasource](#create-the-datasource)
    - [Create the repository](#create-the-repository)
    - [Create the controller](#create-the-controller)
    - [Test the app](#test-the-app)
  - [Frontend](#frontend)
    - [URLSession and Alamofire](#urlsession-and-alamofire)
    - [Create the simple GUI](#create-the-simple-gui)
    - [HTTP Request - error/response/data](#http-request---errorresponsedata)
    - [Print JSON](#print-json)
    - [Decode JSON](#decode-json)
    - [Async Unit Testing](#async-unit-testing)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

This is a starting point to familiarize with the different PRJ4 topics (iOS group). Please be reminded that during the groups based app development phase, students are expected to elaborate on these topics.   

# Intro Swift / Basic GUI
Do tutorials on the following topics. Either use the given tutorials or use tutorials that you come across and think useful.

1. Do in your own playground: [A Swift Tour and LANGUAGE GUIDE (The Basics)](https://docs.swift.org/swift-book/)
1. Swift Tutorial Part 1: [Expressions, Variables & Constants](https://www.raywenderlich.com/6338-swift-tutorial-part-1-expressions-variables-and-constants)
1. Swift Tutorial Part 2: [Types and Operations](https://www.raywenderlich.com/6364-swift-tutorial-part-2-types-and-operations)
1. Swift Tutorial Part 3: [Flow Control](https://www.raywenderlich.com/6366-swift-tutorial-part-3-flow-control)
1. Do the iOS Intro: [Your first iOS App](https://www.raywenderlich.com/5993-your-first-ios-and-uikit-app)
1. Check the tutorial on [XCode and Github](https://medium.com/swlh/how-to-use-github-with-xcode11-8a93b64ff1bc)

**Deliverables:**
1. Being able to explain the basic Swift components
1. Being able to explain Swift specific constructs like Optionals, Tuples, Protocols, Extensions, Closures and Error Handling.
1. Being able to explain the basic concepts of an iOS app.
1. Being able to use Github with your project(s).

# Backend: Loopback 4 - IBM Cloud
 
## Loopback 4 - Basics
Familiarize yourself with Loopback 4. Standard Loopback directories are 

* Controllers: ./src/controllers
* Datasources: ./src/datasources
* Models: ./src/models
* Repositories: ./src/repositories

Be careful, in the *Todo* and *TodoList* tutorials some paths are named wrongly. 

1. Do [TypeScript in 5 minutes](https://www.typescriptlang.org/docs/home.html)
1. Have a look at the first page of [Loopback key concepts](https://loopback.io/doc/en/lb4/Getting-started.html)
1. Do the [Getting started tutorial](https://loopback.io/doc/en/lb4/Getting-started.html)
1. Do the [Todo tutorial](https://loopback.io/doc/en/lb4/todo-tutorial.html)
1. Do the [TodoList tutorial](https://loopback.io/doc/en/lb4/todo-list-tutorial.html)

**Deliverables:**
1. Being able to explain the basic Loopback components.
1. Being able to build a CRUD app witj Loopback.

## Push Notification - Backend
A node.js module for interfacing with the Apple Push Notification Service is *apn*. Tutorials and documentation can be found on the website.

1. Walk through the documentation given by the [*apn* framework](https://www.npmjs.com/package/apn).

**Deliverables:**
1. Being able to explain how push notifications are implemented/used with the *apn* framework.



## Authentication - Backend

1. Do the authentication tutorial [Loopback Authentication](https://connect.fontys.nl/instituten/fhtenl_studies/studies/INF/APPS/StudyMaterial/Loopback_Authentication.pdf)

Since the setup of the authentication example there have been dependency changes, such that there are some update signatures, parameters and return values for methods related to authentication. This can be helped with the package.json from the example, which you can find at [loopback/authentication_package.json](loopback4/authentication_package.json).

**Deliverables:**
1. Being able to explain how authentication works and is implemented. 



## Deploying to IBM Cloud

Clone the example and work on that (*lb4 example todo*):

**Prepare the Push to IBM Cloud**
* Do not work on your own tutorial
* Rename the directory *loopback4-example-todo* and give it a unique name. This is important. When the app is later pushed to the IBM Cloud it has to have a unique route (api endpoint + app name).
* In *.src/index.ts* add *await app.migrateSchema();* between *await app.boot();* and *await app.start();* to have todo created on the database.
* Provisioning a Cloudant database service on IBM Cloud – Stay with the standard region, which is *London*
* Always (!) run* npm run build* before deploying
* Mandatory: Create the *.cfignore* file with corresponding content
* To show hidden files in Finder (Mac) press *Cmd + Shift + *.
* Update url or (password, username and port) in *db.datasource.config.json* with the values from the Cloudant database credentials. On *cloud.ibm.com* manage the Cloudant service, select *Service Credentials* on the left. If necessary, create new credentials.

**Push to IBM Cloud**
* Make sure you have got the right endpoint: *cf api https://api.eu-gb.bluemix.net*
* Login, have IBM Cloud login credentials ready: *cf login*
* Push the application to the cloud, set memory constraints to 256 MB or 512 MB: *cf push <<your-app-name>> -m256MB*

**Push to IBM Cloud - Errors**
* Errors about Org and Space – Check on endpoint and region
* Errors about Route – Check on unique route (api endpoint + app name)
* App does not start in IBM Cloud / memory errors / TCP connection error
  – Didyoudonpmrunbuildbeforethepushtothecloud?
  – Did you restrict memory?,e.g. push<app-name> -m256M
  – There ar ememory restrictions withyour IBM Cloud account,check that you have not already pushed several apps to the cloud
* 500 Error: Internal Server Error – Probably a database error. Is the application connected to the Cloudant DB? Is *db.datasource.configuration.json* correctly updated? Is migrate added to *index.ts*?

1. Do the tutorial [Deploying to IBM Cloud](https://loopback.io/doc/en/lb4/Deploying-to-IBM-Cloud.html)

**Deliverables:**
1. Being able to push an app to own IBM Cloud account. 


# Camera
1. Camera - [Take a photo](https://www.ioscreator.com/tutorials/take-photo-ios-tutorial)
1. For details have a look at the [Apple Developer Documentation](https://developer.apple.com/documentation/avfoundation/cameras_and_media_capture)

**Deliverables:**
1. Being able to take a photo and store it locally.

# GPS
1. GPS: Familiarize yourself with *CoreLocation* and *CLLocationManager*.

**Deliverables:**
1. GPS: Being able to get the current position
1. GPS: Being able to get longitude/latitude from address and vice versa

# Map

1. Show position on map. See [MapKit_Example.playground](https://connect.fontys.nl/instituten/fhtenl_studies/studies/INF/APPS/StudyMaterial/MapKit_Example.playground.zip) on the portal.

**Deliverable:s**
1. Being able to show a given position on a map

# Push Notification

## Push Notification - APN

Push notifications are routed via the *Apple Push Notification* (APN). For usage of APN a certificate or a key is required. 

There is a Push Notification Key available *MVJHJ8K8MU* which can be used instead of the certificate: [MVJHJ8K8MU.p8](https://connect.fontys.nl/instituten/fhtenl_studies/studies/INF/APPS/StudyMaterial/AuthKey_MVJHJ8K8MU.p8)

In order to be provided with a certificate send the name of your app *G<group number><app name>* to the PRJ4 coordinator. Example for group 8 is: *G8ProductPriceAlert*.
The APP Identifier *nl.fontys.apps20.<group app name> with the corresponding certificate will be created. For the example with group 8 this would be the APP ID *nl.fontys.apps20.G8ProductPriceAlert*.
When you receive the certificate it has to be double clicked in order to have it added to your keychain.
 
For further information on Push Notification - Frontend and/or Push Notification - Backend have a look at the corresponding Assignment.

## Push Notification - Frontend
Walk through the given example tutorials. 

1. Use the [Pusher Notification binary](https://github.com/onmyway133/PushNotifications) to send push notifications to your app. Follow the documentation and export the certificate as .p12 file from your keychain.
1. Use the [Wenderlich tutorial](https://www.raywenderlich.com/156966/push-notifications-tutorial-getting-started) but be advised to **use your own app**.


**Deliverables:**
1. Being able to use the Pusher Notification app to send a push notification and receive/process that notification on the frontend.


# Backend/Frontend Example
The example consists of a locally running Loopback backend providing a REST API to a simple table and a Swift application utilizing it. 


## Backend: Employee REST API
The backend consists of a REST API providing CRUD access to table *Employee* and is created via Loopback 4. If you do not have any Loopback 4 background, you are advised to first have a look at [Loopback 4 Getting started](http://loopback.io/doc/en/lb4/Getting-started.html) for setting up the environment as well as the [Loopback 4 Todo tutorial](https://loopback.io/doc/en/lb4/todo-tutorial.html) for an overview of the steps necessary to build an app using Loopback4.
The backend will be developed step by step by creating the app, adding the module, the datasource, the repository and finally the controller.


### Create the app
Use *lb4 app* to create the backend application:

![ScreenShot](/loopback4/lb4app.png) 


### Create the model
To create the model *Employee* with unique id *id*, *firstName* and *lastName* use the command *lb4 model*:

![ScreenShot](/loopback4/lb4model.png) 


### Create the datasource
Once the model is created we need to add the datasource defining where data resides. In this example it will be a relational in memory database. We will populate that datasource by defining a file *./data/db.json* providing initial values.

![ScreenShot](/loopback4/lb4datasource.png)


Be careful to add the file *./data/db.json* seen from root level. The file provides 4 employees, with which the database will be initialized. The file can be found in the repository (/loopback4/db.json).

```{
  "ids": {
    "Employees": 4
  },
  "models": {
    "Employees": {
      "1": "{\"firstname\":\"Dark\",\"lastname\":\"Vader\",\"id\":1}",
      "2": "{\"firstname\":\"Jan\",\"lastname\":\"Willem\",\"id\":2}",
      "3": "{\"firstname\":\"Marilyn\",\"lastname\":\"Monroe\",\"id\":3}",
      "4": "{\"firstname\":\"Clint\",\"lastname\":\"Eastwood\",\"id\":4}"
    }
  }
}
```

### Create the repository
The repository links model and datasource. It is created via *lb4 repository*:

![ScreenShot](/loopback4/lb4repository.png)


### Create the controller
The controller provides the endpoint(s) of our CRUD REST API. For that it links to the repository. 

![ScreenShot](/loopback4/lb4controller.png)


### Test the app
Assuming that you are already in the correct directory *employee* the app can be started using ```npm start```.
Use the API Explorer at *http://[::1]:3000* to get a feeling for the API. With POST/employee and the Request Body 

```{
  "firstName": "Jan",
  "lastName": "Holland"
}
```

an employee is added. The test is done via GET/employees and shows the new employee.
![ScreenShot](/loopback4/apiExplorerGetEmployees.png)

Try the app and test teh *API Explorer*. Be carefule with the *Parameters* as especially 

```
  "order": [
    "string"
  ]
```  
can sometimes lead to errors. In that case remove this code from *filter* (including the preceding *,*).  

## Frontend

### URLSession and Alamofire
The simple frontend app is to show how https request are done with *URLSession*. Besides what Swift offers, there is also the option to use a framework wrapping the URLSession functionality. One of the most widely used frameworks in this area is *Alamofire* for which there also is [elaborated documentation](https://github.com/Alamofire/Alamofire). Groups are allowed to use this *Alamofire* instead of *URLSession*. The focus of this example is on *URLSession*.

For an introduction into iOS networking and an introduction of *URLSession*, *URLSessionConfiguration* and *URLSessionDataTask* as well as the *completion handler* we refer to a well done blog entry by Reinder [Networking In Swift With URLSession](https://learnappmaking.com/urlsession-swift-networking-how-to/). 


### Create the simple GUI
The first step is to create a new iOS single view app. Be sure to select *Include Unit Tests*.
Select the *Main.storyboard* and add a button labelled *Get/Employees*. Do this via the *+* sign which is located at the top right of the window.
Open the assistant editor via the menu *Editor -> Assistant*. Control drag the button to the *ViewController.swift* file just beneath the class declaration. Configure *Connection: Action, name: getEmployees, type: UIButton*. This defines the *IBAction getEmployees()* which will be called whenever the button is pressed. Inside the function body add *testGetEmployees()*.
The only thing *getEmployees()* does is call the yet to be defined function *testGetEmployees()*. 

```
@IBAction func getEmployees(_ sender: UIButton) {
        testGetEmployees()
}
```

### HTTP Request - error/response/data
With *testGetEmployees* we will use the default *URLSession*. The url is the one we used with the API explorer. Whenever you are not sure about urls and parameters use the API explorer to test things.
With the session and url defined a so called dataTask is used to combine these two and to define a unit of work. The dataTask is called with the url. The completion handler defines data, error and response which are the variables delivering the result. 
The call to the url is made when *resume()* is called on the task (dataTask). At this time the completion handler (closure) is used to process the received data, i.e. data, error and response. Here we do a simple print of returned values.

```
 // Simple GET request
    func testGetEmployees() {
        let defaultSession = URLSession(configuration: .default)
        let url = URL(string: "http://[::1]:3000/employees?")
        
        // Forced unwrap of url - we set it ourselves
        let task = defaultSession.dataTask(with: url!) { data, response, error in

            // Error
            if let error = error  {
                print ("error: \(error)")
            }
            
            // Data
            if let data = data  {
                print ("data: \(data)")
            }
            
            // Response
            if let response = response  {
                print ("response: \(response)")
            }
            
        }

        // Now do the work
        task.resume()
    }
```

**Deliverables:**
1. Being able to make HTTP Requests with URLSession (or Alamofire)

### Print JSON

We use *JSONSerialization* to get JSON from the data. This is a very simple example. It only makes sense to go for JSON content when there is data. Therefore we create our JSON after the check on data existence.

*ViewController.swift* should by now look like this

```
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
                
                // Print JSON
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
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
```

### Decode JSON
Now that we have checked that we receive JSON from the http request, the next step is to convert JSON into an object. For this we use the *Codable* protocol, which covers decoding via the *Decodable* protocol as well as encoding via the *Encodable* protocol. With simple CRUD applications like ours structs are preferred over classes. This is because inheritance does not make much sense and with structs there is much less danger of referring the wrong object. First we define the struct *Employee* as the object structure we want to convert the JSON data into. As for structs the initializer is inferred the *Employee* definition is straightforward.

Regarding JSON De-/Encoding, also have a look at [Working with Codable and JSON in Swift](https://learnappmaking.com/codable-json-swift-how-to/).

```
struct Employee: Codable  {
    
    var id: Int
    var firstName: String
    var lastName: String
}
```

The next step is to decode the received JSON into employees. Our example is pretty simple. We decode from data into an Array *[]*. The elements of that array will be employees, hence *[Employee]*. The result will then be an array of *Employees*. A for loop is used to print the properties of all employees.

```
let employees = try JSONDecoder().decode([Employee].self, from: data)
```

Be reminded that this is a simplified example. We have to use try because something could go wrong during the decoding process, e.g. the struct *Employee* does not correspond to the received data. 

The complete *ViewController.swift* now looks like this:

```
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
```


**Deliverables:**
1. Being able to decode from JSON to an object
1. Being able to encode from an object to JSON


### Async Unit Testing

As you selected *Include Unit Tests* when you created the XCode project, there will be a ddirectory *EmployeeExampleTests* with the file *EmployeeExampleTests.swift* in it. Stubs for standard unit testing methods have been created, e.g. for setup and teardown. Good practice is to create a test class for each implementation class, and have in the test class a test method for each of the implementation's class' methods. In the given simple example that does not make any sense. What we do instead is to create a new test class *EmployeeHTTPTests* with the method *testEmployeeGet()* in it to test the async call to our backend.

In Xcode select *File -> New -> File -> Unit Test Class* and name it *EmployeeHTTPTests*. In the window that then opens accept what is preselected and choose create. You should see the added test class to the left of your XCode window.

![ScreenShot](/loopback4/xcodeTestClass.png)

We then need to import the test module *XCTest*. We also need to state that we want to test *EmployeeExample*.
```
  import XCTest
  @testable import EmployeeExample
```

We add a new method *testEmployeeGet* to the class *EmployeeHTTPTests*. We want to test the GET of a specific employee.

As we want to test an async operation we first need to define a so called *expectation*. This expection is used to have the test informed that it has to wait for the async operation to complete, i.e. the test has at least to wait a given time in case the operation does not complete.

```
  // 1. Define an expectation
  let expect = expectation(description: "Request and run callback closure")
```

Next we define the *URLSession* that we will use for networking, as well as the *URL*. First let's have a look at how the *Curl* of the *API Explorer* looks:

```
  curl -X GET "http://[::1]:3000/employees/1?filter[offset]=0&filter[limit]=100&filter[skip]=0" -H "accept: application/json"
```

We are not interested in the listed filter options, hence our url is *http://[::1]:3000/employees/1?*

```
   // 2. Define session and url
   let defaultSession = URLSession(configuration: .default)
   let url = URL(string: "http://[::1]:3000/employees/1?")
```

Now is the point to define the task in which we cover the HTTP request. We use a default URLSession and a dataTask with our url.

```
  // 3. Define the task
  // Forced unwrap of url - we set it ourselves
  let task = defaultSession.dataTask(with: url!) { data, response, error in
```

First we need to test whether data has been received. If that is not the case we go to the else branch and give an *XCTFAil* with the message that there is no data. If data has been received we decode the JSON to the struct *Employee*. In case that fails we do the catch block with again giving an *XCTFAil* with the corresponding error. 
Now that the decoding worked, we check *employee id*, *firstName* and *lastName* on correctness. If one of them is wrong, an *XCGTFail* will be given.

```
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
```

Still within the task but the last step of it, is to indicate that we test async code and have to wait for the previosly defined expectation.

```
  // 4. Don't forget to fulfill the expectation in the async callback
  expect.fulfill()
```

The second to last step of the test method is to start the task.

```
  // 5. Run the task
  task.resume()
```

And the last step is to wait on the expectation. If there is an error or there is no answer within the given time, in this example it is 4 seconds, an *XCFail* will be given with the corresponding error.

```
  // 6. Wait for the expectation to be fulfilled
  waitForExpectations(timeout: 4) {
      error in if let error = error {
           XCTFail("Error \(error)")
      }
   }
```

Play around with the test. Run it without having the backend app started, try it with a wrong url, try it for non existing data etc.


**Deliverables:**
1. Being able to explain/do unit testing with XCode/Swift
1. Being able to explain/do async unit testing with XCode/Swift
