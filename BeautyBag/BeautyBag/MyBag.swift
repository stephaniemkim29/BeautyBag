//
//  MyBag.swift
//  BeautyBag
//
//  Created by Stephanie Kim on 11/16/24.
//

//import SwiftUI
//
//struct Product: Identifiable, Codable {
//    let id: Int
//    let name: String
//    let brand: String
//    let type: String
//    var imageName: String
//    var image: Image {
//        Image(imageName)
//    }
//
//}
//
//    
//struct MyBag: View {
//    
//    let products = [
//        Product(id: 1, name: "Vanish Airbrush Concealer", brand: "Hourglass", type: "Face", imageName: "hourglass-vanish-concealer"),
//        Product(id: 2, name: "Banana Bright Eye Cream", brand: "Olehenriksen", type: "Skin", imageName: "olehenriksen-bananabright-eye"),
//        Product(id: 3, name: "Lip Butter Balm", brand: "Summer Fridays", type: "Lip", imageName: "summerfridays-butterbalm"),
//        Product(id: 4, name: "Water Cream", brand: "Tatcha", type: "Skin", imageName: "tatcha-watercream")
//    ]
//    @State private var searchText : String = ""
//    @State private var selectedType: String? = nil
//    @State private var navigateToRate = false
//    @State private var navigateToRoutine = false
//    @State private var selectedProduct: Product? = nil
//    
//    var filteredProducts: [Product] {
//        products.filter { product in
//            (selectedType == nil || product.type == selectedType) &&
//            (searchText.isEmpty || product.name.localizedCaseInsensitiveContains(searchText) || product.brand.localizedCaseInsensitiveContains(searchText))
//        }
//    }
//    var body: some View {
//        NavigationView {
//            VStack{
//                VStack{
//                    TextField("Search products...", text: $searchText)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.horizontal)
//
//                    // Filter Buttons
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack {
//                            Button("All") {
//                                selectedType = nil
//                            }
//                            .padding()
//                            .background(selectedType == nil ? Color.gray.opacity(0.3) : Color.clear)
//                            .cornerRadius(8)
//
//                            ForEach(["Face", "Eye", "Lip", "Cheek", "Skin"], id: \.self) { type in
//                                Button(type) {
//                                    selectedType = type
//                                }
//                                .padding()
//                                .background(selectedType == type ? Color.gray.opacity(0.3) : Color.clear)
//                                .cornerRadius(8)
//                            }
//                        }
//                        .padding(.horizontal)
//                    }
//                }
//                
//                List(filteredProducts) { products in
//                    HStack {
//                        products.image
//                            .resizable()
//                            .frame(width: 50, height: 50)
//                            
//                            .padding(.trailing, 8)
//                        
//                        VStack(alignment: .leading) {
//                            Text(products.name)
//                                .font(.headline)
//                            
//                            Text(products.brand)
//                                .font(.subheadline)
//                                .foregroundColor(.gray)
//                        }
//                        .contextMenu {
//                            Button("Rate Now") {
//                                selectedProduct = products
//                                navigateToRate = true
//                            }
//                            Button("Add to Routine") {
//                                selectedProduct = products
//                                navigateToRoutine = true
//                            }
//                        }
//                    
//                    }
//                }
//                .background(
//                    NavigationLink(
//                        destination: RateNow(product: selectedProduct ?? products[0]),
//                        isActive: $navigateToRate,
//                        label: { EmptyView() }
//                    )
//                )
//        
//                .toolbar {
//                    ToolbarItem(placement: .principal) {
//                        Text("My Bag")
//                            .font(.system(size: 24))
//                            .foregroundColor(.primary)
//                    }
//                }
//            }
//        }
//    }
//}
import SwiftUI
struct Product: Identifiable, Codable {
    let id: Int
    let name: String
    let brand: String
    let type: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
}
    
struct MyBag: View {
    
    let products = [
        Product(id: 1, name: "Vanish Airbrush Concealer", brand: "Hourglass", type: "Face", imageName: "hourglass-vanish-concealer"),
        Product(id: 2, name: "Banana Bright Eye Cream", brand: "Olehenriksen", type: "Skin", imageName: "olehenriksen-bananabright-eye"),
        Product(id: 3, name: "Lip Butter Balm", brand: "Summer Fridays", type: "Lip", imageName: "summerfridays-butterbalm"),
        Product(id: 4, name: "Water Cream", brand: "Tatcha", type: "Skin", imageName: "tatcha-watercream")
    ]
    @State private var searchText : String = ""
    @State private var selectedType: String? = nil
    @State private var navigateToRate = false
    @State private var navigateToRoutine = false
    @State private var selectedProduct: Product? = nil
    
    var filteredProducts: [Product] {
        products.filter { product in
            (selectedType == nil || product.type == selectedType) &&
            (searchText.isEmpty || product.name.localizedCaseInsensitiveContains(searchText) || product.brand.localizedCaseInsensitiveContains(searchText))
        }
    }
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    TextField("Search products...", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    // Filter Buttons
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Button("All") {
                                selectedType = nil
                            }
                            .padding()
                            .background(selectedType == nil ? Color.gray.opacity(0.3) : Color.clear)
                            .cornerRadius(8)
                            ForEach(["Face", "Eye", "Lip", "Cheek", "Skin"], id: \.self) { type in
                                Button(type) {
                                    selectedType = type
                                }
                                .padding()
                                .background(selectedType == type ? Color.gray.opacity(0.3) : Color.clear)
                                .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                List(filteredProducts) { products in
                    HStack {
                        products.image
                            .resizable()
                            .frame(width: 50, height: 50)
                            
                            .padding(.trailing, 8)
                        
                        VStack(alignment: .leading) {
                            Text(products.name)
                                .font(.headline)
                            
                            Text(products.brand)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .contextMenu {
                            Button("Rate Now") {
                                selectedProduct = products
                                navigateToRate = true
                            }
                            Button("Add to Routine") {
                                selectedProduct = products
                                navigateToRoutine = true
                            }
                        }
                    
                    }
                }
                .background(
                    NavigationLink(
                        destination: RateNow(product: selectedProduct ?? products[0]),
                        isActive: $navigateToRate,
                        label: { EmptyView() }
                    )
                )
        
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("My Bag")
                            .font(.system(size: 24))
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}
struct MyBag_Previews: PreviewProvider {
    static var previews: some View {
        MyBag()
    }
}
