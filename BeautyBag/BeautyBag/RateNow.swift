//
//  RateNow.swift
//  BeautyBag
//
//  Created by Stephanie Kim on 11/16/24.
//

import SwiftUI

struct RateNow: View {
    let onRatingComplete: (Int, Double) -> Void
    let product: Product
    let questions = [
            "Application",
            "Effectiveness",
            "Formula",
            "Finish",
        ]
    @State private var currentQuestionIndex = 0
    @State private var ratings: [Int] = [0, 0, 0, 0]
    @State private var showCalculateButton = false
    var averageRating: Double {
        
            let total = ratings.reduce(0, +)
            return total == 0 ? 0 : Double(total) / Double(ratings.count)
        }

        var body: some View {
            VStack{
                VStack {
                    product.image
                        
                        .resizable()
                        .scaledToFit()
                        .frame(width: 125, height: 124)
                
                        .padding()

                    VStack(spacing:10) {
                        Text(product.name)
                            .font(.headline)
                        
                        
                        Text("Brand: \(product.brand)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        
                        Spacer()
                    }
                }
                
                
                
            }
            
            .navigationTitle("Rate Now")
            
        }
}

#Preview {
    RateNow(
            product: Product(
                id: 1,
                name: "Vanish Airbrush Concealer",
                brand: "Hourglass",
                type: "Face",
                imageName: "hourglass-vanish-concealer"
            )
        )
}
