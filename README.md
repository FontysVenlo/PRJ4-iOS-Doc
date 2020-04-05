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
To create the model *Employee* use the command *lb4 model*:

![ScreenShot](/loopback4/lb4model.png) 

### Create the datasource
Once the model is created we need to add the datasource. In this example it will be a relational in memory database. We will populate that datasource by defining a file *./data/db.json* providing initial values.

![ScreenShot](/loopback4/lb4datasource.png)

