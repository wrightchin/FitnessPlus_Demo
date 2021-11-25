//
//  FavouriteView.swift
//  Fitness+
//
//  Created by Wright Chin on 12/11/2021.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var studioModel: StudioModel
    
    var body: some View {
        NavigationView {
            List (studioModel.studios) {s in
                NavigationLink(
                    destination: StudioView(studio: s),
                    label: {
                        HomeBar(studio: s, favStudio: s)
                    })
            }
            .navigationBarTitle("Explore")
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .environmentObject(StudioModel())

    }
}
