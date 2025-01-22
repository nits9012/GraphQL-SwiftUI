//
//  CountriesViewModel.swift
//  GraphQLSample
//
//  Created by Nitin Bhatt on 22/01/25.
//

import Foundation
import Apollo
import GraphQLSampleAPI
import Observation

@Observable
class CountriesViewModel {
    var countries: [GetAllCountriesQuery.Data.Country] = []
    var errorMessage: String?
    var loading = false
    
    @MainActor
    func fetchCountries() {
        loading = true
        errorMessage = nil
        
        ApolloNetworkHelper.shared.apollo.fetch(query: GetAllCountriesQuery()) { [weak self] response in
            self?.loading = false
            
            switch response {
            case .success(let results):
                if let countries = results.data?.countries {
                    self?.countries = countries
                } else if let errors = results.errors {
                    self?.errorMessage = errors.map { $0.localizedDescription }.joined(separator: "\n")
                }
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        }
    }
}
