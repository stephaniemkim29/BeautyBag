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
        TabView {
            NavigationView {
                VStack(spacing: 20) {
                    HStack {
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

                    VStack(spacing: 10) {
                        Text("@s.and.s")
                            .font(.title2)
                            .bold()
                        Circle()
                            .fill(Color.gray.opacity(0.5))
                            .frame(width: 100, height: 100)
                            .overlay(
                                Text("SS")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                            )
                    }

                    HStack {
                        Spacer()
                        VStack {
                            Text("# Followers")
                                .font(.subheadline)
                        }
                        Spacer()
                        VStack {
                            Text("# Following")
                                .font(.subheadline)
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
                           
                        }
                        NavigationLink(destination: MyBag()) {
                            ButtonView(title: "My Bag")
                                .frame(width: 150, height: 50) // Custom size
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }

                /*
                    VStack(alignment: .leading) {
                        Text("Routines")
                            .font(.headline)
                            .padding(.leading, 15)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(1..<6) { index in
                                    NavigationLink(destination: Text("Routine \(index)")) { // Placeholder for Routine Detail View
                                        ButtonView(title: "Routine \(index)")
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
            }
            .tabItem {
                Label("Profile", systemImage: "person.circle")
            }

            NavigationView {
                SearchView()
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }

            Text("Camera")
                .tabItem {
                    Label("Camera", systemImage: "camera")
                }

            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
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


