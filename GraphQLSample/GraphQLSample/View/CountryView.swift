//
//  CountryView.swift
//  GraphQLSample
//
//  Created by Nitin Bhatt on 22/01/25.
//

import Foundation
import SwiftUI

struct CountryView: View {
    @State var viewModel = CountriesViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.loading {
                    LoadingView()
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                }else {
                    CountryListRows(viewModel: viewModel)
                }
            }
            .task {
                viewModel.fetchCountries()
            }
            .navigationTitle("Country List")
        }
    }
}
