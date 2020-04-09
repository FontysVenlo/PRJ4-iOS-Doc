
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**PRJ4 iOS/Swift Documentation**

- [HTTP Requests](#http-requests)
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
    - [Simple GET - error/response/data](#simple-get---errorresponsedata)
    - [JSON](#json)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

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

## Frontend

### URLSession and Alamofire
The simple frontend app is to show how https request are done with *URLSession*. Besides what Swift offers, there is also the option to use a framework wrapping the URLSession functionality. One of the most widely used frameworks in this area is *Alamofire* for which there also is [elaborated documentation](https://github.com/Alamofire/Alamofire). Groups are allowed to use this *Alamofire* instead of *URLSession*. The focus of this example is on *URLSession*.

For an introduction into iOS networking and an introduction of *URLSession*, *URLSessionConfiguration* and *URLSessionDataTask* as well as the *completion handler* we refer to a well done blog entry by Reinder [Networking In Swift With URLSession](https://learnappmaking.com/urlsession-swift-networking-how-to/). 


### Create the simple GUI
The first step is to create a new iOS single view app. Select the *Most ain.storyboard* and add a button labelled *Get/Employees*. Do this via the *+* sign which is located at the top right of the window.
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

For details you are referred to the Swift documentation by Apple as well as the good introduction by Wenderlich [Codalbe and JSON in Swift](https://learnappmaking.com/codable-json-swift-how-to/#working-with-nested-arrays-and-codable).

```
struct Employee: Codable  {
    
    var id: Int
    var firstName: String
    var lastName: String
}
```

The next step is to decode the received JSON into employees. Our example is pretty simple. We decode from data into an Array *[]*. The elements of that array will be employees, hence *[Employee]*. The result will then be an array of *Employees*

```
let employees = try JSONDecoder().decode([Employee].self, from: data)
```

Be reminded that this is a simplified example. We have to use try because it could be, that something goes wrong during the decoding process, e.g. the struct *Employee* does not correspond the received data. 
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
                    print("Employee")
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

# Sensors 
## Camera
## GPS
## Map
## Push Notification - Frontend
## Push Notification - Backend

# Links




