//
//  CurrentlyUsing.swift
//  BeautyBag
//
//  Created by Sana Tahir on 11/16/24.
//

/*
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
*/

//
//  CurrentlyUsing.swift
//  BeautyBag
//
//  Created by Sana Tahir on 11/16/24.
//

import SwiftUI

struct CurrentlyUsing: View {
    @State private var isEditing: Bool = false
    @State private var items: [String] = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7", "Item 8"]
    
    var body: some View {
        NavigationView{
            VStack{
                HStack {
                    Button(action: {
//                   Label("Back", systemImage: "chevron.left")
                    }) {
                        Label("Back", systemImage: "chevron.left")
                }
                    .padding(.leading, 10)
                Spacer()
                Text("Currently Using")
                    .font(.headline)
                Spacer()
                    
                Button(action: {
                    isEditing.toggle()
                }) {
                    Image(systemName: "paintbrush")
                        .foregroundColor(isEditing ? .red : .blue)
                }
                .padding(.trailing, 10)
            }
            .padding(.vertical, 10)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(items, id: \.self) {
                        item in
                        VStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 100)
                                .overlay(
                                    Text(item)
                                        .foregroundColor(.black)
                                        .font(.subheadline)
                                )
                                .overlay(
                                    Group{
                                        if isEditing {
                                            Button(action: {
                                                deleteItem(item: item)
                                            }) {
                                                Image(systemName: "minus.circle.fill")
                                                    .foregroundColor(.red)
                                                    .offset(x: 40, y: -40)
                                            }
                                        }
                                    }
                                )
                        }
                    }
                    
                    if isEditing {
                        NavigationLink(destination: SearchView()) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue.opacity(0.3))
                                .frame(height: 100)
                                .overlay(
                                    Text("+")
                                        .foregroundColor(.white)
                                        .font(.largeTitle)
                                )
                        }
                    }
                    }
                .padding(.horizontal, 15)
                }
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
    
    private func deleteItem(item: String) {
        if let index = items.firstIndex(of: item){
            items.remove(at: index)
        }
    }
}

struct CurrentlyUsing_Previews: PreviewProvider {
    static var previews: some View {
        CurrentlyUsing()
    }
}
