//
//  Search.swift
//  BeautyBag
//
//  Created by Sana Tahir on 11/16/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @State private var selectedTab: String = "Products" //This will be made the default tab
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    //go back
                }) {
                    Label("Back", systemImage: "chevron.left")
                }
                .padding(.leading, 10)
                Spacer()
                Text("Search")
                    .font(.headline)
                
                Spacer()
                Button(action: {
                    //share
                }) {
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
                Button(action: {
                    //voice search
                }) {
                    Image(systemName: "mic")
                        .padding(10)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                .padding(.trailing, 10)
            }
            
            HStack{
                Button(action: {
                    selectedTab = "People"
                }) {
                    Text("People")
                        .font(.subheadline)
                        .foregroundColor(selectedTab == "People" ? .white : .black)
                        .padding()
                        .background(
                            selectedTab == "People" ? Color.black :
                                Color.gray.opacity(0.2)
                        )
                        .cornerRadius(8)
                }
                Button(action: {
                    selectedTab = "Products"
                }) {
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
            
            //Filing out the content based on the selected tab
            ScrollView {
                if selectedTab == "Products" {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(1..<9) {
                            index in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 120)
                                .overlay(Text("Product\(index)")
                                    .foregroundColor(.black))
                        }
                    }
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(1..<7) {
                            index in
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 100, height: 100)
                                .overlay(Text("Person\(index)") .foregroundColor(.black))
                        }
                    }
                    .padding(.horizontal, 15)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
