//
//  RoutineSelectionView.swift
//  BeautyBag
//
//  Created by Sana Tahir on 11/17/24.
//
import SwiftUI
struct RoutineSelectionView: View {
    @Binding var product: Product?
    let routines: [Routine]

    var body: some View {
        NavigationView {
            List(routines) { routine in
                Button(action: {
                    print("\(product?.name ?? "") added to \(routine.name)")
                }) {
                    Text(routine.name)
                }
            }
            .navigationTitle("Select a Routine")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        product = nil
                    }
                }
            }
        }
    }
}
