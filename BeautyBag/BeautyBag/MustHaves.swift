//
//  MustHaves.swift
//  BeautyBag
//
//  Created by Sana Tahir on 11/16/24.
//

import SwiftUI

//going to have to use sample data
struct MustHaves: View {
    let products = [
        ("Hourglass Vanish Concealer", ""),
        ("Anastasia Brow Wiz", ""),
        ("Tatcha Water Cream", ""),
        ("Clarins Lip Comfort Oil", ""),
        ("Kiehls Ultra Face", ""),
        ("Benefit Roller", "")
    ]
    
    var body: some View {
        VStack {
            HStack{
                Button(action: {
                    //back navigation
                }) {
                    Label("Back", systemImage: "chevron.left")
                }
                .padding(.leading, 10)
                Spacer()
                
                Text("Must Haves")
                    .font(.headline)
                
                Spacer()
                
                Button(action: {
                    //share functionality
                }) {
                    Image(systemName: "square.and.arrow.up")
                }
                .padding(.trailing, 10)
            }
            .padding(.trailing, 10)
            
            HStack {
                TextField("Search", text: .constant(""))
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal, 10)
                
                Button(action: {
                    //I don't know how to implement voice search functions
                }) {
                    Image(systemName: "mic")
                        .padding(10)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                .padding(.trailing, 10)
            }
            
            ScrollView {
                LazyVGrid (columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20)
                {
                    ForEach(products, id: \.0) {
                        product in
                        VStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 120)
                                .overlay(
                                    Text("Image")
                                        .foregroundColor(.pink) //just until we have images
                                )
                            Text(product.0)
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding(.horizontal, 15)
            }
        }
     //   .navigationBarTitle(true)
    }
}

struct MustHaves_Previews: PreviewProvider {
    static var previews: some View {
        MustHaves()
    }
}

