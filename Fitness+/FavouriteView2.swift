//
//  FavouriteView2.swift
//  Fitness+
//
//  Created by Wright Chin on 17/11/2021.
//

import SwiftUI
import CoreData

struct FavouriteView2: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Venue.date, ascending: true)],
        animation: .default)
    private var venues: FetchedResults<Venue>

    var body: some View {
        NavigationView {
            List {
                ForEach(venues) { venue in
//                    Text("\(record.dateTime ?? "null") \n \(record.studioName ?? "null") | \(record.teacher ?? "null") | \(record.type ?? "null")")
                    if venue.star {
                        Text("\(venue.date!, formatter: itemFormatter) \(venue.studioName ?? "null") ")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }
    private func addItem() {
        withAnimation {
            let newVenue = Venue(context: viewContext)
            newVenue.date = Date()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { venues[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct FavouriteView2_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView2().environment(\.managedObjectContext, PersistenceController3.preview.container.viewContext)
    }
}
