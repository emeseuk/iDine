//
//  FavoritesView.swift
//  iDine
//
//  Created by Emese Toth on 09/07/2019.
//  Copyright © 2019 Emese Toth. All rights reserved.
//

import SwiftUI

struct FavoritesView : View {
    @EnvironmentObject var favourites: Favorites
    var body: some View {
        VStack {
            Section {
                Text("❤️ Favourites ❤️")
                    .font(.caption)
                    .fontWeight(.medium)
                    .padding(5)
            }

            List {
                Section {
                    ForEach(favourites.items) {item in
                        HStack {
                            Image(item.thumbnailImage)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth:  2))

                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .bold()
                            }
                        }
                    }
                }
            }
        }
    }
}

#if DEBUG
struct FavoritesView_Previews : PreviewProvider {
    static let favourite = Favorites()
    static var previews: some View {
        FavoritesView().environmentObject(favourite)
    }
}
#endif
