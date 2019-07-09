//
//  ItemDetail.swift
//  iDine
//
//  Created by Emese Toth on 09/07/2019.
//  Copyright © 2019 Emese Toth. All rights reserved.
//

import SwiftUI

struct ItemDetail : View {

    var item: MenuItem
    @EnvironmentObject var order: Order
    @EnvironmentObject var favourites : Favorites

    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo:\(item.photoCredit)")
                .padding(4)
                .background(Color.black)
                .font(.caption)
                .foregroundColor(.white)
                .offset(x: -5, y: -5)
            }

            Text(item.description)
            .lineLimit(nil)
            .padding()

            HStack {
                Button(action: {
                    self.order.add(item: self.item)
                }) {
                    Text("Order this")
                    .font(.headline)
                }

                Spacer()

                Button(action: {
                    self.favourites.add(item: self.item)
                }) {
                    Text("Add to Favourites ❤️")
                        .font(.headline)
                }
            }
                .padding(20)
                .offset(x: -5, y: -5)

            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

#if DEBUG
struct ItemDetail_Previews : PreviewProvider {

    static let order = Order()
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}
#endif
