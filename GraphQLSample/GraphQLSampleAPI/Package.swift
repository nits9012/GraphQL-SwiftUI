// swift-tools-version:5.9

import PackageDescription

let package = Package(
  name: "GraphQLSampleAPI",
  platforms: [
    .iOS(.v12),
    .macOS(.v10_14),
    .tvOS(.v12),
    .watchOS(.v5),
  ],
  products: [
    .library(name: "GraphQLSampleAPI", targets: ["GraphQLSampleAPI"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apollographql/apollo-ios", exact: "1.16.1"),
  ],
  targets: [
    .target(
      name: "GraphQLSampleAPI",
      dependencies: [
        .product(name: "ApolloAPI", package: "apollo-ios"),
      ],
      path: "./Sources"
    ),
  ]
)
