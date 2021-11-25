//
//  FavouriteButton.swift
//  Fitness+
//
//  Created by Lam Perth on 16/11/2021.
//

import SwiftUI

struct AddButton: View {
    @Binding var isSet: Bool

    var body: some View {
        Button {
            isSet.toggle()
        }
        label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
