//
//  RateNow.swift
//  BeautyBag
//
//  Created by Stephanie Kim on 11/16/24.
//

import SwiftUI

struct RateNow: View {
    let product: Product

        var body: some View {
            VStack {
                product.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
            
                    .padding()

                Text("Rate \(product.name)")
                    .font(.largeTitle)
                    .padding()

                Text("Brand: \(product.brand)")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding()

                Spacer()
            }
            .navigationTitle("Rate Now")
            .navigationBarTitleDisplayMode(.inline)
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
