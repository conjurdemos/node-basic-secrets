# node-basic-secrets
Using secrets within an application checked into source control

## Overview
The purpose of this demo is to demonstrate the usage of a secret within a basic Node.js application. The secret is obtained from Conjur and loaded into the process environment as a variable. This allows for sensitive information to be checked into to source control because they're accessed by reference, **not by value**, keeping your secrets hidden and secure within Conjur.

## Running the Demo
1. Install the node modules:

    ```
    $ npm update
    ``` 
2. Run the initialize script. This will prompt you to log in to Conjur if you're not already logged in, then create a variable (named "demo/secret_key") to store a secret value for use in our web application. In a real setting, this secret could be anything from an API key to a database password.

    ```
    $ ./init.sh
    ```
3. Run the application using `conjur env` to load our secret into the process environment. Our secret is defined by it's declaration in the .conjurenv file. [Further information regarding conjur env can be found here](https://developer.conjur.net/reference/tools/utilities/conjurenv).

    ```
    $ conjur env run node app
    ```
4. Navigate to [http://localhost:8080](http://localhost:8080) with your browser. 

If the application is running, it will serve a webpage containing a black box you can click on to view your secret. Keep in mind that this is for demo purposes only, and exposing a real secret as demonstrated here is never recommended in actual daily practice.
