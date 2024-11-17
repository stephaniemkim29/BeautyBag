//
//  MustHaves.swift
//  BeautyBag
//
//  Created by Sana Tahir on 11/16/24.
//

//import SwiftUI
//
////going to have to use sample data
//struct MustHaves: View {
//    let products = [
//        ("Hourglass Vanish Concealer", ""),
//        ("Anastasia Brow Wiz", ""),
//        ("Tatcha Water Cream", ""),
//        ("Clarins Lip Comfort Oil", ""),
//        ("Kiehls Ultra Face", ""),
//        ("Benefit Roller", "")
//    ]
//    
//    var body: some View {
//        VStack {
//            HStack{
//                Button(action: {
//                    //back navigation
//                }) {
//                    Label("Back", systemImage: "chevron.left")
//                }
//                .padding(.leading, 10)
//                Spacer()
//                
//                Text("Must Haves")
//                    .font(.headline)
//                
//                Spacer()
//                
//                Button(action: {
//                    //share functionality
//                }) {
//                    Image(systemName: "square.and.arrow.up")
//                }
//                .padding(.trailing, 10)
//            }
//            .padding(.trailing, 10)
//            
//            HStack {
//                TextField("Search", text: .constant(""))
//                    .padding(10)
//                    .background(Color.gray.opacity(0.2))
//                    .cornerRadius(8)
//                    .padding(.horizontal, 10)
//                
//                Button(action: {
//                    //I don't know how to implement voice search functions
//                }) {
//                    Image(systemName: "mic")
//                        .padding(10)
//                        .background(Color.gray.opacity(0.2))
//                        .cornerRadius(8)
//                }
//                .padding(.trailing, 10)
//            }
//            
//            ScrollView {
//                LazyVGrid (columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20)
//                {
//                    ForEach(products, id: \.0) {
//                        product in
//                        VStack {
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color.gray.opacity(0.3))
//                                .frame(height: 120)
//                                .overlay(
//                                    Text("Image")
//                                        .foregroundColor(.pink) //just until we have images
//                                )
//                            Text(product.0)
//                                .font(.subheadline)
//                                .multilineTextAlignment(.center)
//                                .foregroundColor(.black)
//                        }
//                    }
//                }
//                .padding(.horizontal, 15)
//            }
//        }
//     //   .navigationBarTitle(true)
//    }
//}
//
//struct MustHaves_Previews: PreviewProvider {
//    static var previews: some View {
//        MustHaves()
//    }
//}
//
import SwiftUI

struct MustHaves: View {
    // Sample data for products
    let products = [
        ("Hourglass Vanish Concealer", ""),
        ("Anastasia Brow Wiz", ""),
        ("Tatcha Water Cream", ""),
        ("Clarins Lip Comfort Oil", ""),
        ("Kiehl's Ultra Facial Cream", ""),
        ("Benefit Roller Lash Mascara", ""),
        ("Fenty Beauty Lip Gloss", ""),
        ("Charlotte Tilbury Setting Spray", "")
    ]
    
    @State private var searchText: String = "" // State to manage the search text
    
    // Define grid layout
    private let gridColumns = [
        GridItem(.fixed(160), spacing: 20), // Fixed width for each column
        GridItem(.fixed(160), spacing: 20)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Button(action: {
                    // Back navigation logic
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .font(.body)
                    .foregroundColor(.blue)
                }
                
                Spacer()
                
                Text("Must Haves")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {
                    // Share functionality
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.body)
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
            
            // Search Bar
            HStack(spacing: 10) {
                TextField("Search", text: $searchText)
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Button(action: {
                    // Implement voice search logic here
                }) {
                    Image(systemName: "mic")
                        .padding(10)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
            
            // Product Grid
            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: 20) {
                    ForEach(filteredProducts, id: \.0) { product in
                        VStack(spacing: 10) {
                            // Placeholder for product image
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 160, height: 120) // Fixed size for images
                                .overlay(
                                    Text("Image")
                                        .foregroundColor(.pink)
                                )
                            
                            // Product name
                            Text(product.0)
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .lineLimit(2)
                                .frame(width: 160) // Ensure text doesn't overflow
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
            }
            .background(Color.gray.opacity(0.1))
        }
        .background(Color.gray.opacity(0.1)) // Background for the entire view
        .edgesIgnoringSafeArea(.top) // Extend background to the top
    }
    
    // Filter products based on the search text
    private var filteredProducts: [(String, String)] {
        if searchText.isEmpty {
            return products
        } else {
            return products.filter { $0.0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct MustHaves_Previews: PreviewProvider {
    static var previews: some View {
        MustHaves()
    }
}
