//
//  LoadingView.swift
//  GraphQLSample
//
//  Created by Nitin Bhatt on 22/01/25.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))  // Circular style with blue color
                .font(.headline)  // Adjust font size and weight
                .foregroundColor(.gray)  // Text color
                .padding()
                .background(Color.gray.opacity(0.2))  // Light background color
                .cornerRadius(10)  // Rounded corners for the background
                .shadow(radius: 5)  // Optional: Add shadow for depth
        }
    }
}
