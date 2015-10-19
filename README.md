# node-basic-secrets
Using secrets within an application checked into source control

## Overview
The purpose of this demo is to demonstrate the usage of a secret within a basic Node.js application. The secret is obtained from Conjur and loaded into the process environment as a variable. This allows for sensitive information to be checked into to source control because they're accessed by reference, **not by value**, keeping your secrets hidden and secure within Conjur.

## Running the Demo
1. Install the node modules:

    ```
    $ npm update
    ``` 
2. Run the `policy.sh` shell script. This will load our policy into Conjur, creating a layer named "app", which is essentially a group of hosts which will all be running our web application. It will also create a Conjur variable to hold a secret, which all hosts in the new layer "app" will require, so read access is granted to the entire layer. In a real setting, this variable may store something such as a database password. Finally, a new host ("host-01.node-basic-secrets.demo") is created, and added to the "app" layer. You should now have a file named host.json which contains information regarding this host.

    ```
    $ ./policy.sh
    ```
3. Run the application using the `run.sh` shell script. It will prompt you for an API key, which was generated during the previous step and can be located in the host.json file. It will then authenticate as the host we've created to request the secret and run our node application.

    ```
    $ conjur env run node app
    ```
4. Navigate to [http://localhost:8080](http://localhost:8080) with your browser. 

If the application is running, it will serve a webpage containing a black box you can click on to view your secret. Keep in mind that this is for demo purposes only, and exposing a real secret as demonstrated here is never recommended in actual daily practice.
