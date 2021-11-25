//
//  FavouriteView.swift
//  Fitness+
//
//  Created by Wright Chin on 12/11/2021.
//

import SwiftUI

struct FavouriteView: View {
    @EnvironmentObject var studioModel: StudioModel
    
    var body: some View {
        NavigationView {
            List (studioModel.studios) {s in
                if s.isFavorite{
                    NavigationLink(
                        destination: StudioView(studio: s),
                        label: {
                            HStack{
                                Image(s.studioImage)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                Text(s.studioName)
                                    .font(.headline)
                                }
                            if s.isFavorite {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }

                        }
                    )
                }
            }
            .navigationBarTitle("Favourite")
        }
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
            .environmentObject(StudioModel())
    }
}
