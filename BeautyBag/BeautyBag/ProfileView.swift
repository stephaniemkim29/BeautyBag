//
//  ContentView.swift
//  BeautyBag
//
//  Created by Stephanie Kim on 11/16/24.
//

import SwiftUI
import CoreData

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack{
                    Spacer()
                    Text("My Profile")
                        .font(.headline)
                    Spacer()
                    Button(action: {
                    }) {
                        Image(systemName: "square.and.arrow.up")
                    }
                    .padding(.trailing, 10)
                }
                .padding(.top, 10)
                
                //Profile
                VStack(spacing: 10){
                    Text("@s.and.s")
                        .font(.title2)
                        .bold()
                    Circle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width:100, height: 100)
                        .overlay(
                            Text("SS")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                        )
                }

                HStack{
                    Spacer()
                    VStack{
                        Text("#Followers")
                            .font(.subheadline)
                    }
                    Spacer()
                    VStack {
                        Text("#Following")
                            .font(.headline)
                    }
                    Spacer()
                }
                
                VStack(spacing: 20) {
                    HStack(spacing: 10) {
                        NavigationLink(destination: CurrentlyUsing()) {
                            ButtonView(title: "Currently Using")
                        }
                        NavigationLink(destination: MustHaves()) {
                            ButtonView(title: "Must Haves")
                        }
        //                NavigationLink(destination: MyBag()) {
          //                  ButtonView(title: "My Bag")
            //            }
                    }
                }
         
                /*
                //Routines
                VStack(alignment: .leading) {
                    Text("Routines")
                        .font(.headline)
                        .padding(.leading, 15)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(1..<5) {
                                index in
                                NavigationLink(destination: RoutineView(routineName: "Routine \(index)")) {
                                    ButtonView(title: "Routine\(index)")
                                }
                            }
                        }
                        .padding(.horizontal, 15)
                    }
                }
                */
                
            
                Spacer()
            }
            .navigationBarHidden(true)
            //Navigation bar. This comment can be undone when the Routine View is ready to go
//            .navigationTitle("", displayMode: .inline)
        }
    }
}


#Preview {
    ProfileView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

struct ButtonView: View {
    let title: String
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.gray.opacity(0.3))
            .frame(width: 100, height: 100)
            .overlay(
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.black)
            )
    }
}
