//
//  ItemRow.swift
//  iDine
//
//  Created by Emese Toth on 09/07/2019.
//  Copyright © 2019 Emese Toth. All rights reserved.
//

import SwiftUI

struct ItemRow : View {
    static let colors: [String: Color] = ["D": .purple, "V": .green, "G": .black, "N": .red, "S": .blue]
    var item: MenuItem
    @EnvironmentObject var order: Order
    @EnvironmentObject var favourites : Favorites

    var body: some View {
        NavigationLink(destination: ItemDetail(item: item).environmentObject(order).environmentObject(favourites)) {

            HStack {
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth:  2))

                VStack(alignment: .leading) {
                    Text(item.name)
                    Text("$\(item.price)")
                }

                Spacer()

                ForEach(item.restrictions.identified(by: \.self)) { restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(Self.colors[restriction, default: .black])
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#if DEBUG
struct ItemRow_Previews : PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
#endif
