//
//  ContentView.swift
//  Fitness+
//
//  Created by Wright Chin on 11/11/2021.
//

import SwiftUI
import CoreData

@available(iOS 15.0, *)
struct ContentView : View {
    
    @State var username: String = ""
    @State var password: String = ""
    @EnvironmentObject var studioModel: StudioModel
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
            FavouriteView()
                .tabItem {
                    Label("Favourite", systemImage: "heart")
                }
            ActivityLogView()
                .tabItem {
                    Label("Activity", systemImage: "figure.walk.circle")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
//            ClassRecordView()
//                .tabItem {
//                    Label("Profile", systemImage: "person")
//                }
        }
    }

}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
