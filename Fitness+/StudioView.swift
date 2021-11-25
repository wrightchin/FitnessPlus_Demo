//
//  StudioView.swift
//  Fitness+
//
//  Created by Lam Perth on 13/11/2021.
//

import SwiftUI
import MapKit

struct StudioView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext3
    @EnvironmentObject var studioModel:StudioModel
    @State var studio: Studio
    private var studioIndex: Int {
        studioModel.studios.firstIndex(where: {$0.id==studio.id}) ?? 0
    }
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Venue.studioName, ascending: true)],
        animation: .default)
    
    private var venues: FetchedResults<Venue>
    
    @State private var isStar = false
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Image(studio.studioImage)
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(EdgeInsets(top: 25, leading: 50, bottom: 20, trailing: 50))
                Button(action: actionSheet) {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                        Text("Share")
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
            }
            VStack (alignment: .leading) {
//                Image(studio.studioImage)
//                    .resizable()
//                    .scaledToFill()
//                    .cornerRadius(10)
//                    .shadow(radius: 5)
//                    .padding(EdgeInsets(top: 25, leading: 50, bottom: 40, trailing: 50))
                
                Text("Description")
                    .font(.headline)
                    .padding([.bottom, .top], 5)
                Text(studio.type)
                    
                Divider()
                
                Text("Location")
                    .font(.headline)
                    .padding([.bottom, .top], 5)
                Text(studio.studioAddress)
                MapView(coordinate: studio.coordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                
                Divider()
                
                Text("Equipment")
                    .font(.headline)
                    .padding([.bottom, .top], 5)
                
                Text(studio.equipment)
                
            }
            .padding()
            Divider()
            Button(action: {print("Button tapped")}) {
                NavigationLink(destination: ScheduleView(studio: studio)){
                    Text("Class Schedule")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .frame(width: 160, height: 40)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                }
                .navigationTitle(studio.studioName)
                .navigationBarItems(trailing: FavoriteButton(isSet: $studioModel.studios[studioIndex].isFavorite))
//                .navigationBarItems(
//                    trailing: Button(action: addItem, label: {
//                    Image(systemName: "star")
//                        .imageScale(.large)
//                }))
//                .navigationBarItems(
//                    trailing: Button(action: {
//                        isStar = !isStar;
//                        addItem()
//                    }, label: {
//                    if isStar {
//                    Image(systemName: "star.fill")
//                        .imageScale(.large)
//                        .foregroundColor(.yellow)
//                    }
//                    if !isStar {
//                    Image(systemName: "star")
//                        .imageScale(.large)
//                        .foregroundColor(.yellow)
//                    }
//                }))
            }
            .padding(.bottom, 50)
            .padding(.top, 25)
        }
//        .navigationBarTitle (Text(studio.studioName))
    }
    private func addItem() {
        withAnimation {
            let newVenue = Venue(context: viewContext3)
            newVenue.id = UUID()
            newVenue.studioName = studio.studioName
            newVenue.star = true
            newVenue.date = Date()
            
            do {
                try viewContext3.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func actionSheet() {
           guard let urlShare = URL(string: "https://instagram.com/patti.catti.studio?utm_medium=copy_link") else { return }
           let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
           UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
       }
    
//    private func deleteItems() {
//        withAnimation {
//          viewContext3.delete(studio.studioName)
//
//            do {
//                try viewContext3.save()
//            } catch {
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
}
    

struct StudioView_Previews: PreviewProvider {
//    static var previews: some View {
//        StudioView()
//    }
    
    static let studioModel = StudioModel()
    static var previews: some View {
        StudioView(studio: studioModel.studios[0] )
            .environmentObject(StudioModel())
    }
}
