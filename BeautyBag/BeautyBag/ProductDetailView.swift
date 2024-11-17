//
//  SearchDetailView.swift
//  BeautyBag
//
//  Created by Sana Tahir on 11/17/24.
//

import SwiftUI
import UIKit

/*
struct ProductDetailView: View {
    let product: SearchProduct

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: product.imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            } placeholder: {
                ProgressView()
            }
            .padding()

            Text(product.name)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()

            Text("Brand: \(product.brand)")
                .font(.headline)
                .foregroundColor(.gray)
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle("Product Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
*/
struct ProductDetailView: View {
    let product: SearchProduct
    @State private var showAddToRoutineSheet = false
    @State private var showShareSheet = false
    @State private var isSavedToMyBag = false

    // Mock Routines for Example
    @State private var routines = [
        Routine(id: UUID(), name: "Morning Skincare"),
        Routine(id: UUID(), name: "Nighttime Routine"),
        Routine(id: UUID(), name: "Dandy Hacks")
    ]

    var body: some View {
        VStack(spacing: 20) {
            // Product Image
            AsyncImage(url: URL(string: product.imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            } placeholder: {
                ProgressView()
            }
            .padding()

            // Product Name
            Text(product.name)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()

            // Product Brand
            Text("Brand: \(product.brand)")
                .font(.headline)
                .foregroundColor(.gray)
                .padding()

            Spacer()

            // Action Buttons
            VStack(spacing: 15) {
                // Add to Routine Button
                Button(action: {
                    showAddToRoutineSheet = true
                }) {
                    HStack {
                        Image(systemName: "plus")
                        Text("Add to Routine")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .sheet(isPresented: $showAddToRoutineSheet) {
                    RoutineSelectionView(
                        product: .constant(
                            Product(
                                id: Int(product.id) ?? 0,
                                name: product.name,
                                brand: product.brand,
                                type: "General",
                                imageName: product.imageUrl
                            )
                        ),
                        routines: routines
                    )
                }

                // Share with Friends Button
                Button(action: {
                    showShareSheet = true
                }) {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                        Text("Share with Friends")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .sheet(isPresented: $showShareSheet) {
                    ActivityView(activityItems: [product.name, URL(string: product.imageUrl) ?? ""])
                }

                // Save to My Bag Button
                Button(action: {
                    isSavedToMyBag.toggle()
                }) {
                    HStack {
                        Image(systemName: isSavedToMyBag ? "checkmark" : "bag")
                        Text(isSavedToMyBag ? "Saved to My Bag" : "Save to My Bag")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isSavedToMyBag ? Color.gray : Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .padding()

            Spacer()
        }
        .navigationTitle("Product Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ActivityView: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity.ActivityType]? = nil

    func makeUIViewController(context: Context) -> UIActivityViewController {
        return UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

