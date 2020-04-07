
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [HTTP Requests](#http-requests)
  - [Backend: Employee REST API](#backend-employee-rest-api)
    - [Create the app](#create-the-app)
    - [Create the model](#create-the-model)
    - [Create the datasource](#create-the-datasource)
    - [Create the repository](#create-the-repository)
    - [Create the controller](#create-the-controller)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

**Project 4**

Documentation and tutorial for iOS/Swift.

# HTTP Requests
The example consists of a locally running Loopback backend providing a REST API to a simple table and a Swift application utilizing it.

## Backend: Employee REST API
The backend consists of a REST API providing CRUD access to table *Employee* and is created via Loopback 4. If you do not have any Loopback 4 background, you are advised to first have a look at Loopback 4 Getting started (https://loopback.io/doc/en/lb4/Getting-started.html) for setting up the environment as well as the Loopback 4 Todo tutorial (https://loopback.io/doc/en/lb4/todo-tutorial.html) for an overview of the steps necessary to build an app using Loopback4.

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
}```

an employee is added. The test is done via GET/employees and shows 



