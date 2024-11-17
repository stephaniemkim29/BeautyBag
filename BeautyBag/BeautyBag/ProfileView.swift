//
//  ContentView.swift
//  BeautyBag
//
//  Created by Stephanie Kim on 11/16/24.
//

//
//import SwiftUI
//import CoreData
//
//struct ProfileView: View {
//    @StateObject private var vm = ViewModel()
//    @State private var showingCamera = false
//    
//    var body: some View {
//        TabView {
//            NavigationView {
//                VStack(spacing: 20) {
//                    HStack {
//                        Spacer()
//                        Text("My Profile")
//                            .font(.headline)
//                        Spacer()
//                        Button(action: {
//                        }) {
//                            Image(systemName: "square.and.arrow.up")
//                        }
//                        .padding(.trailing, 10)
//                    }
//                    .padding(.top, 10)
//
//                    VStack(spacing: 10) {
//                        Text("@s.and.s")
//                            .font(.title2)
//                            .bold()
//                        Circle()
//                            .fill(Color.gray.opacity(0.5))
//                            .frame(width: 100, height: 100)
//                            .overlay(
//                                Text("SS")
//                                    .foregroundColor(.white)
//                                    .font(.largeTitle)
//                            )
//                    }
//
//                    HStack {
//                        Spacer()
//                        VStack {
//                            Text("# Followers")
//                                .font(.subheadline)
//                        }
//                        Spacer()
//                        VStack {
//                            Text("# Following")
//                                .font(.subheadline)
//                        }
//                        Spacer()
//                    }
//
//                    VStack(spacing: 20) {
//                        HStack(spacing: 10) {
//                            NavigationLink(destination: CurrentlyUsing()) {
//                                ButtonView(title: "Currently Using")
//                            }
//                            NavigationLink(destination: MustHaves()) {
//                                ButtonView(title: "Must Haves")
//                            }
//                           
//                        }
//                        NavigationLink(destination: MyBag()) {
//                            ButtonView(title: "My Bag")
//                                .frame(width: 150, height: 50) // Custom size
//                                .background(Color.blue)
//                                .foregroundColor(.white)
//                                .cornerRadius(10)
//                        }
//                    }
//
//                /*
//                    VStack(alignment: .leading) {
//                        Text("Routines")
//                            .font(.headline)
//                            .padding(.leading, 15)
//
//                        ScrollView(.horizontal, showsIndicators: false) {
//                            HStack(spacing: 10) {
//                                ForEach(1..<6) { index in
//                                    NavigationLink(destination: Text("Routine \(index)")) { // Placeholder for Routine Detail View
//                                        ButtonView(title: "Routine \(index)")
//                                    }
//                                }
//                            }
//                            .padding(.horizontal, 15)
//                        }
//                    }
//                    
//                */
//                    
//                    
//
//                    Spacer()
//                }
//                .navigationBarHidden(true)
//            }
////            .tabItem {
////                Label("Profile", systemImage: "person.circle")
////            }
////
////            NavigationView {
////                SearchView()
////            }
////            .tabItem {
////                Label("Search", systemImage: "magnifyingglass")
////            }
////
////            Text("Camera")
////                .tabItem {
////                    Label("Camera", systemImage: "camera")
////                }
////
////            Text("Settings")
////                .tabItem {
////                    Label("Settings", systemImage: "gearshape")
////                }
//            Text("Socials")
//               .tabItem {
//                   Label("Socials", systemImage: "person.3")
//               }
//
//               NavigationView {
//                   SearchView()
//               }
//               .tabItem {
//                   Label("Search", systemImage: "magnifyingglass")
//               }
//
//               .sheet(isPresented: $showingCamera) {
//                   CameraView(isPresented: $showingCamera)
//                       .environmentObject(vm)
//                       .task {
//                           await vm.requestDataScannerAccessStatus()
//                       }
//               }
//           }
//           .environmentObject(vm)
//
//               Text("Profile")
//                   .tabItem {
//                       Label("Profile", systemImage: "person.circle")
//                   }
//        
//    }
//}
//
//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//            .environmentObject(ViewModel())
//    }
//}
//
//struct ButtonView: View {
//    let title: String
//    var body: some View {
//        RoundedRectangle(cornerRadius: 10)
//            .fill(Color.gray.opacity(0.3))
//            .frame(width: 100, height: 100)
//            .overlay(
//                Text(title)
//                    .font(.subheadline)
//                    .foregroundColor(.black)
//            )
//    }
//}
//
//
/*
import SwiftUI
import CoreData

struct ProfileView: View {
    @StateObject private var vm = ViewModel()
    @State private var showingCamera = false
    @State var isPresented = false
    
    var body: some View {
        TabView {
            // Profile Tab
            NavigationView {
                VStack(spacing: 20) {
                    profileHeader

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
                    Spacer()
                }
                .navigationBarHidden(true)
            }
            .tabItem {
                Label("Profile", systemImage: "person.circle")
            }

            // Search Tab
            NavigationView {
                SearchView()
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }

            // Camera Tab
            Text("Open the Camera")
                .tabItem {
                    Label("Camera", systemImage: "camera")
                }
                .onTapGesture {
                    showingCamera = true
                }
                .sheet(isPresented: $showingCamera) {
                    CameraView(isPresented: $showingCamera)
                        .environmentObject(vm)
                        .task {
                            await vm.requestDataScannerAccessStatus()
                        }
                }



            // Socials Tab
            Text("Socials")
                .tabItem {
                    Label("Socials", systemImage: "person.3")
                }
        }
        .environmentObject(vm)
    }

    // Profile Header
    private var profileHeader: some View {
        HStack {
            Spacer()
            Text("My Profile")
                .font(.headline)
            Spacer()
            Button(action: {
                // Share action
            }) {
                Image(systemName: "square.and.arrow.up")
            }
            .padding(.trailing, 10)
        }
        .padding(.top, 10)
    }
}

// Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ViewModel())
    }
}

// Button View
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
*/

import SwiftUI

struct ProfileView: View {
    @StateObject private var vm = ViewModel()
    @State private var showingCamera = false
    @State private var routines: [String] = ["Morning Skincare", "Nighttime Routine", "Dandy Hacks"]
    @State private var isPresented = false

    var body: some View {
        TabView {
            // Profile Tab
            NavigationView {
                VStack(spacing: 20) {
                    profileHeader

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

                    // Dynamic Routines Section
                    
                    
                    
                    VStack(alignment: .leading) {
                        Text("Routines")
                            .font(.headline)
                            .padding(.leading, 15)

                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack(spacing: 10) {
                                // Existing Routines
                                ForEach(routines, id: \.self) { routine in
                                    NavigationLink(destination: RoutineDetailView(routine: routine)) {
                                        ButtonView(title: routine)
                                    }
                                }

                                // "+" Button for Adding a New Routine
                                Button(action: {
                                    isPresented = true
                                }) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.blue.opacity(0.7))
                                        .frame(width: 100, height: 100)
                                        .overlay(
                                            Image(systemName: "plus")
                                                .font(.largeTitle)
                                                .foregroundColor(.white)
                                        )
                                }
                                .sheet(isPresented: $isPresented) {
                                    SearchView()
                                }
                            }

                            .padding(.horizontal, 15)
                        }
                    }

                    Spacer()
                }
                .navigationBarHidden(true)
            }
            .tabItem {
                Label("Profile", systemImage: "person.circle")
            }

            // Search Tab
            NavigationView {
                SearchView()
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }

            // Camera Tab
            Text("Open the Camera")
                .tabItem {
                    Label("Camera", systemImage: "camera")
                }
                .onTapGesture {
                    showingCamera = true
                }
                .sheet(isPresented: $showingCamera) {
                    CameraView(isPresented: $showingCamera)
                        .environmentObject(vm)
                        .task {
                            await vm.requestDataScannerAccessStatus()
                        }
                }

            // Socials Tab
            Text("Socials")
                .tabItem {
                    Label("Socials", systemImage: "person.3")
                }
        }
        .environmentObject(vm)
    }

    // Profile Header
    private var profileHeader: some View {
        HStack {
            Spacer()
            Text("My Profile")
                .font(.headline)
            Spacer()
            Button(action: {
                // Share action
            }) {
                Image(systemName: "square.and.arrow.up")
            }
            .padding(.trailing, 10)
        }
        .padding(.top, 10)
    }
}

// Routine Detail View
struct RoutineDetailView: View {
    let routine: String

    var body: some View {
        VStack {
            Text(routine)
                .font(.largeTitle)
                .padding()

            Text("Details about \(routine)")
                .font(.body)
                .foregroundColor(.gray)
                .padding()

            Spacer()
        }
        .navigationTitle("Routine")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Button View
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
                    .multilineTextAlignment(.center)
            )
    }
}

// Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ViewModel())
    }
}

