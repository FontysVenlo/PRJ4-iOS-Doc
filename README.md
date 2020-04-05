
<!-- START doctoc -->
<!-- END doctoc -->

# PRJ4-iOS-Doc
Documentation and tutorial for iOS/Swift.

# HTTP Requests
The example consists of a locally running Loopback backend providing a REST API to a simple table and a Swift application utilizing it.

## Employee REST API
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


Be careful to add the file *./data/db.json* seen from root level. The file provides 4 employees, which will initialize the database.

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



