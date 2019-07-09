//
//  CheckoutView.swift
//  iDine
//
//  Created by Emese Toth on 09/07/2019.
//  Copyright © 2019 Emese Toth. All rights reserved.
//

import SwiftUI

struct CheckoutView : View {
    @EnvironmentObject var order: Order
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    static let tipAmounts = [0,5,10,15,20,25]


    @State var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 0


    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }

    var body: some View {
        Form {
            Section {
                Picker(selection: $paymentType, label: Text("How do you wan to pay?")) {
                    ForEach(0..<Self.paymentTypes.count){
                        Text(Self.paymentTypes[$0])
                    }
                }
            }

            Toggle(isOn: $addLoyaltyDetails){
                Text("Add iDine loyalty card")
            }

            if addLoyaltyDetails {
                TextField("Enter your iDine id", text: $loyaltyNumber)
            }

            Section(header: Text("Add a tip?")) {
                SegmentedControl(selection: $tipAmount) {
                    ForEach(0..<Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }
            }

            Section(header: Text("TOTAL: \(totalPrice)")) {
                Button(action: {

                }) {
                    Text("Confirm order")
                }
            }
      }
    }
}

#if DEBUG
struct CheckoutView_Previews : PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
#endif
