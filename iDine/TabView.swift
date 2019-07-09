//
//  TabView.swift
//  iDine
//
//  Created by Emese Toth on 09/07/2019.
//  Copyright © 2019 Emese Toth. All rights reserved.
//

import SwiftUI

struct TabView : View {
    @EnvironmentObject var order: Order

    var body: some View {
        TabbedView {
            ContentView()
                .tabItemLabel(
                    VStack {
                        Image("system-list")
                        Text("Menu")
                    }
            ).tag(0)

            OrderView()
            .tabItemLabel(
                VStack {
                    Image("system-list")
                    Text("Order")
                }
            ).tag(1)

            FavoritesView()
                .tabItemLabel(
                    VStack {
                        Image("system-list")
                        Text("Favourites")
                    }
            ).tag(2)
        }
    }
}

#if DEBUG
struct TabView_Previews : PreviewProvider {
    static let order = Order()
    static var previews: some View {
        TabView().environmentObject(order)
    }
}
#endif
