//
//  ApolloNetworkHelper.swift
//  GraphQLSample
//
//  Created by Nitin Bhatt on 22/01/25.
//

import Foundation
import Apollo
import GraphQLSampleAPI

class ApolloNetworkHelper {
    static let shared = ApolloNetworkHelper()
    private(set) lazy var apollo: ApolloClient = {
        let url = URL(string: "https://countries.trevorblades.com/")!
        return ApolloClient(url: url)
    }()
}
