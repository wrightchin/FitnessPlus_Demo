//
//  HomeBar.swift
//  Fitness+
//
//  Created by Lam Perth on 13/11/2021.
//

import SwiftUI

struct HomeBar: View {
    @EnvironmentObject var studioModel:StudioModel
    @State var studio: Studio
    private var studioIndex: Int {
        studioModel.studios.firstIndex(where: {$0.id==studio.id}) ?? 0
    }
    var favStudio: Studio
    
    var body: some View {
        HStack (spacing: 10.0) {
            Image(studio.studioImage)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80, alignment: .center)
                .clipped()
                .cornerRadius(10)
            
            VStack (alignment: .leading, spacing:9) {
                HStack{
                    Text(studio.studioName).bold()
                    Spacer()
                    FavoriteButton(isSet: $studioModel.studios[studioIndex].isFavorite)
                }
                Text(studio.type)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
        }
        .padding()
        
    }
}

struct HomeBar_Previews: PreviewProvider {
    static let studioModel = StudioModel()
    static var previews: some View {
        HomeBar(studio: studioModel.studios[0], favStudio: studioModel.studios[0])
            .environmentObject(StudioModel())
    }
}
