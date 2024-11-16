//
//  CurrentlyUsing.swift
//  BeautyBag
//
//  Created by Sana Tahir on 11/16/24.
//

import SwiftUI

struct CurrentlyUsing: View {
    var body: some View {
        VStack{
            HStack {
                Button(action: {}) {
                    Label("Back", systemImage: "chevron.left")
                }
                    .padding(.leading, 10)
                
                Spacer()
                Text("Currently Using")
                    .font(.headline)
                Spacer()
                
                Button(action: {
                }) {
                    Image(systemName: "paintbrush")
                }
                .padding(.trailing, 10)
            }
            .padding(.vertical, 10)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(1..<13) {
                        index in
                        Button(action: {
                        }) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 100)
                                .overlay(
                                    Text("Product \(index)")
                                        .foregroundColor(.black)
                                        .font(.subheadline)
                                )
                        }
                    }
                }
                .padding(.horizontal, 15)
            }
            Spacer()
        }
       // .navigationBarHidden(true)
 //       .navigationBarTitle("Currently Using", displayMode: .inline)
        .navigationBarBackButtonHidden(false)
    }
}

struct CurrentlyUsing_Previews: PreviewProvider {
    static var previews: some View {
        CurrentlyUsing()
    }
}
