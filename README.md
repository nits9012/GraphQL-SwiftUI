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

`.query GetAllCountries {
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
}`


**Step 4 :** Initialize the code generation configuration
From your project’s root directory, execute the following command with your customized values:

`./apollo-ios-cli init --schema-namespace GraphQLSampleAPI --module-type swiftPackageManager`
