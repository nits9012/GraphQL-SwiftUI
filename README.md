# GraphQL-SwiftUI

I am using the GraphQL API provided by https://countries.trevorblades.com/ to fetch country-related data. This API allows you to query information such as country names, codes, languages, and more. It's a great resource for exploring GraphQL queries in action, as it provides an easy-to-use interface for making requests and getting responses in real-time.

**Steps to Set Up GraphQL with Apollo in Xcode Using Swift Package Manager**


**Step 1 :** Open Xcode and create a new project by selecting File > New > Project.

**Step 2 :** Open your Xcode Project.
- Go to File > Add Packages Dependencies.
- In the search bar, enter the following URL for Apollo GraphQL:
  
[https://github.com/apollographql/apollo-ios](https://github.com/apollographql/apollo-ios)

This will fetch the latest version of Apollo from GitHub. Click Add Package to integrate Apollo into your project.

**Step 3 :** Create GraphQL Queries
- Create .graphql files in your project for the queries you want to use and name the file <file_name>.graphql and add your GraphQL query inside it. For example:
```
 query GetAllCountries {
      countries {
            name,
            code,
            capital,
            currencies,
            continent {
              name
            },
            native,
            states {
                name
              code
            },
            languages {
              name
            },
            awsRegion,
            subdivisions {
              name
            },
            phone,
            emoji
      } 
}
````
**Step 4 :** Setup Codegen CLI
- In your Xcode project, locate the project file in the file explorer. Right-click on the project file to reveal a context menu.
- From the context menu, select the Install CLI plugin command. This will initiate the installation process for the Codegen CLI.

**Step 5 :** Initialize the code generation configuration
From your project’s root directory, execute the following command with your customized values:

`./apollo-ios-cli init --schema-namespace GraphQLSampleAPI --module-type swiftPackageManager`

**Step 6 :** 
- Next, we need to download the schema for our project. To do this, we’ll update the apollo-codegen-config.json file to include a schemaDownloadConfiguration. Follow the steps below:

- Open the apollo-codegen-config.json file in a text editor. Locate the output object within the file. After the output object, add the following JSON code:

 ```
    "schemaDownloadConfiguration": {
        "downloadMethod": {
            "introspection": {
                "endpointURL": "https://countries.trevorblades.com/",
                "httpMethod": {
                    "POST": {}
                },
                "includeDeprecatedInputValues": false,
                "outputFormat": "SDL"
            }
        },
        "downloadTimeout": 60,
        "headers": [],
        "outputPath": "./graphql/schema.graphqls"
    }
 ```

**Step 7 :** 
Now that we’ve updated the configuration file, we can proceed to download the schema. In the Terminal, run the following command from your project directory
`./apollo-ios-cli fetch-schema`

This command will initiate the schema download process using the configured settings. After running the command, you should see a graphql folder in your project directory. Inside this folder, you'll find a schema.graphqls file, which contains the downloaded schema from your server.


**Running Code Generation : ** 
Now that we have both the schema and query files in place, we can initiate the code generation process.

- Open the Terminal and navigate to your project directory.
- Run the following command in the Terminal:
`./apollo-ios-cli generate`

This command will trigger the code generation process using the downloaded schema and query files. Once the process is complete, you will see a new folder named GraphQLSampleAPI in your project directory. This folder contains the Swift package with the generated source code.

**Step 8 :**  To add the generated Swift Package Manager (SPM) package(GraphQLSampleAPI) to your project for GraphQL integration, follow these steps:

- Locate the Generated SPM Package
After running the code generation process with Apollo, a new folder named GraphQLSampleAPI (or whatever you named your generated folder) will be created in your project directory. This folder contains the generated Swift package.

- Open your Xcode project (or workspace) where you want to add the generated package.
  
### Add the Generated Package as a Local SPM Dependency
- In Xcode, go to File in the top menu and select Add Packages....
- In the Add Package Dependency window, instead of entering a GitHub URL or a package repository URL, select Add Local.
- A file picker will appear. Navigate to the folder where the generated ChargeTripAPI folder is located. Select the Package.swift file inside the ChargeTripAPI folder.
- Click Add Package. Xcode will now treat the generated code as an SPM dependency.

- Import the Generated Package in Your Code
Now that the package is added to your project, you can import it into any file that needs access to the generated GraphQL code.




