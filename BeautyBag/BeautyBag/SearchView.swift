//
//  Search.swift
//  BeautyBag
//
//  Created by Sana Tahir on 11/16/24.
//

//
//import SwiftUI
//
//struct SearchProduct: Identifiable, Decodable {
//    let id: String
//    let name: String
//    let brand: String
//    let price: String
//    let imageUrl: String
//}
//
//struct SearchView: View {
//    @State private var searchText: String = ""
//    @State private var selectedTab: String = "Products"
//    @State private var products: [SearchProduct] = []
//    @State private var isLoading: Bool = true
//    @State private var errorMessage: String?
//
//    var body: some View {
//        VStack {
//            HStack {
//                Button(action: {
//                }) {
//                    Label("Back", systemImage: "chevron.left")
//                }
//                .padding(.leading, 10)
//                Spacer()
//                Text("Search")
//                    .font(.headline)
//                Spacer()
//                Button(action: {
//                }) {
//                    Image(systemName: "square.and.arrow.up")
//                }
//                .padding(.trailing, 10)
//            }
//            .padding(.vertical, 10)
//
//            HStack {
//                TextField("Search", text: $searchText)
//                    .padding(10)
//                    .background(Color.gray.opacity(0.2))
//                    .cornerRadius(8)
//                    .padding(.horizontal, 10)
//
//                Button(action: {
//                }) {
//                    Image(systemName: "mic")
//                        .padding(10)
//                        .background(Color.gray.opacity(0.2))
//                        .cornerRadius(8)
//                }
//                .padding(.trailing, 10)
//            }
//
//            HStack {
//                Button(action: {
//                    selectedTab = "People"
//                }) {
//                    Text("People")
//                        .font(.subheadline)
//                        .foregroundColor(selectedTab == "People" ? .white : .black)
//                        .padding()
//                        .background(selectedTab == "People" ? Color.black : Color.gray.opacity(0.2))
//                        .cornerRadius(8)
//                }
//                Button(action: {
//                    selectedTab = "Products"
//                }) {
//                    Text("Products")
//                        .font(.subheadline)
//                        .foregroundColor(selectedTab == "Products" ? .white : .black)
//                        .padding()
//                        .background(selectedTab == "Products" ? Color.black : Color.gray.opacity(0.2))
//                        .cornerRadius(8)
//                }
//            }
//            .padding(.horizontal, 15)
//            .padding(.vertical, 5)
//
//            // Content
//            ScrollView {
//                if selectedTab == "Products" {
//                    if isLoading {
//                        ProgressView("Loading Products...")
//                            .padding()
//                    } else if let errorMessage = errorMessage {
//                        Text("Error: \(errorMessage)")
//                            .foregroundColor(.red)
//                            .padding()
//                    } else {
//                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
//                            ForEach(products) { product in
//                                VStack {
//                                    AsyncImage(url: URL(string: product.imageUrl)) { image in
//                                        image
//                                            .resizable()
//                                            .scaledToFit()
//                                            .frame(height: 100)
//                                    } placeholder: {
//                                        ProgressView()
//                                    }
//                                    Text(product.name)
//                                        .font(.subheadline)
//                                        .multilineTextAlignment(.center)
//                                    Text(product.brand)
//                                        .font(.caption)
//                                        .foregroundColor(.gray)
//                                    Text("$\(product.price)")
//                                        .font(.subheadline)
//                                        .fontWeight(.bold)
//                                }
//                                .padding()
//                                .background(Color.white)
//                                .cornerRadius(10)
//                                .shadow(color: Color.gray.opacity(0.3), radius: 5)
//                            }
//                        }
//                        .padding(.horizontal, 15)
//                    }
//                } else if selectedTab == "People" {
//                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
//                        ForEach(1..<5) { index in
//                            Circle()
//                                .fill(Color.gray.opacity(0.3))
//                                .frame(width: 100, height: 100)
//                                .overlay(
//                                    Text("Person \(index)")
//                                        .foregroundColor(.black)
//                                )
//                        }
//                    }
//                    .padding(.horizontal, 15)
//                }
//            }
//        }
//        .navigationBarHidden(true)
//        .onAppear(perform: fetchProducts)
//    }
//
//    func fetchProducts() {
//        guard let url = URL(string: "https://sephora.p.rapidapi.com/us/products/v2/detail") else {
//            errorMessage = "Invalid URL"
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = [
//            "x-rapidapi-key": "6de6ac746amsh8d043de1b2046a2p10b11ajsn1536fbcfd772",
//            "x-rapidapi-host": "sephora.p.rapidapi.com"
//        ]
//
//        let session = URLSession.shared
//        session.dataTask(with: request) { data, response, error in
//            if let error = error {
//                DispatchQueue.main.async {
//                    errorMessage = error.localizedDescription
//                    isLoading = false
//                }
//                return
//            }
//
//            guard let data = data else {
//                DispatchQueue.main.async {
//                    errorMessage = "No data received"
//                    isLoading = false
//                }
//                return
//            }
//
//            do {
//                // Assuming the API returns an array of products
//                let displayproducts = try JSONDecoder().decode([Product].self, from: data)
//                DispatchQueue.main.async {
//                    self.products = products
//                    self.isLoading = false
//                }
//            } catch {
//                DispatchQueue.main.async {
//                    errorMessage = "Failed to decode response"
//                    isLoading = false
//                }
//            }
//        }.resume()
//    }
//}
//
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
//

import SwiftUI

struct SearchProduct: Identifiable, Decodable {
    let id: String
    let name: String
    let brand: String
    let imageUrl: String
}

struct SearchView: View {
    @State private var searchText: String = ""
    @State private var selectedTab: String = "Products"
    @State private var products: [SearchProduct] = []
    @State private var isLoading: Bool = true
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            HStack {
                Button(action: {}) {
                    Label("Back", systemImage: "chevron.left")
                }
                .padding(.leading, 10)
                Spacer()
                Text("Search")
                    .font(.headline)
                Spacer()
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                }
                .padding(.trailing, 10)
            }
            .padding(.vertical, 10)

            HStack {
                TextField("Search", text: $searchText)
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal, 10)

                Button(action: {}) {
                    Image(systemName: "mic")
                        .padding(10)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                .padding(.trailing, 10)
            }

            HStack {
                Button(action: { selectedTab = "People" }) {
                    Text("People")
                        .font(.subheadline)
                        .foregroundColor(selectedTab == "People" ? .white : .black)
                        .padding()
                        .background(selectedTab == "People" ? Color.black : Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                Button(action: { selectedTab = "Products" }) {
                    Text("Products")
                        .font(.subheadline)
                        .foregroundColor(selectedTab == "Products" ? .white : .black)
                        .padding()
                        .background(selectedTab == "Products" ? Color.black : Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 5)

            // Content
            ScrollView {
                if selectedTab == "Products" {
                    if isLoading {
                        ProgressView("Loading Products...")
                            .padding()
                    } else if let errorMessage = errorMessage {
                        Text("Error: \(errorMessage)")
                            .foregroundColor(.red)
                            .padding()
                    } else {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                            ForEach(products) { product in
                                VStack {
                                    AsyncImage(url: URL(string: product.imageUrl)) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 150)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    Text(product.name)
                                        .font(.subheadline)
                                        .multilineTextAlignment(.center)
                                    Text(product.brand)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: Color.gray.opacity(0.3), radius: 5)
                            }
                        }
                        .padding(.horizontal, 15)
                    }
                } else if selectedTab == "People" {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(1..<5) { index in
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 100, height: 100)
                                .overlay(
                                    Text("Person \(index)")
                                        .foregroundColor(.black)
                                )
                        }
                    }
                    .padding(.horizontal, 15)
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear(perform: fetchProducts)
    }

    func fetchProducts() {
        guard let url = URL(string: "https://sephora.p.rapidapi.com/auto-complete?q=lip") else {
            errorMessage = "Invalid URL"
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "x-rapidapi-key": "6de6ac746amsh8d043de1b2046a2p10b11ajsn1536fbcfd772",
            "x-rapidapi-host": "sephora.p.rapidapi.com"
        ]

        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    errorMessage = error.localizedDescription
                    isLoading = false
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    errorMessage = "No data received"
                    isLoading = false
                }
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                let terms = json?["typeAheadTerms"] as? [[String: Any]] ?? []
                let displayProducts = terms.compactMap { term -> SearchProduct? in
                    guard let id = term["productId"] as? String,
                          let name = term["productName"] as? String,
                          let brand = term["brandName"] as? String,
                          let imageUrl = (term["defaultSku"] as? [String: Any])?["skuImages"] as? [String: String],
                          let image = imageUrl["image50"] else {
                        return nil
                    }
                    return SearchProduct(id: id, name: name, brand: brand, imageUrl: image)
                }
                DispatchQueue.main.async {
                    self.products = displayProducts
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    errorMessage = "Failed to decode response"
                    isLoading = false
                }
            }
        }.resume()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
