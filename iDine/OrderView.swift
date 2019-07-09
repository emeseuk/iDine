//
//  OrderView.swift
//  iDine
//
//  Created by Emese Toth on 09/07/2019.
//  Copyright © 2019 Emese Toth. All rights reserved.
//

import Combine
import SwiftUI

struct OrderView : View {
    @EnvironmentObject var order: Order

    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) {item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }

                Section {
                    
                    NavigationLink(destination: Text("Check out")) {
                        Text("Place order")
                    }
                }
                    .navigationBarTitle(Text("Order"))
                    .listStyle(.grouped)
            }
        }
    }
}

#if DEBUG
struct OrderView_Previews : PreviewProvider {
    static let order =  Order()
    
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
#endif
