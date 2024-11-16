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

             //comment to check commit
                
                //profile information
                VStack (spacing:10) {
                    Text("@s.and.s")
                        .font(.title2)
                        .bold()
                    Circle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 100, height: 100)
                        .overlay(Text("SS"))
                        .foregroundColor(.white)
                        .font(.largeTitle)
                
                

            }
        
    }




}


#Preview {
    ProfileView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
