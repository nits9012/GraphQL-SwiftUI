//
//  CountryListRows.swift
//  GraphQLSample
//
//  Created by Nitin Bhatt on 22/01/25.
//

import Foundation
import SwiftUI

// Country List Rows
struct CountryListRows: View {
    var viewModel: CountriesViewModel
    
    var body: some View {
        List(viewModel.countries, id: \.code) { country in
            HStack {
                // Emoji: Increase size and add padding for clarity
                Text(country.emoji)
                    .font(.largeTitle)
                    .padding([.leading,.trailing], 10)
                
                Text(country.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Spacer() // Pushes the phone number to the far right
                
                // Phone: Smaller font with some padding
                Text("(+\(country.phone))")
                    .font(.subheadline)
                    .foregroundColor(.secondary) // Lighter color for phone number
                    .padding([.leading,.trailing], 10)
            }
            .padding(.vertical, 8) // Add vertical padding to each row for better spacing
            .background(Color.white) // White background for each row
            .cornerRadius(8)
            .shadow(radius: 5)
        }
    }
}
