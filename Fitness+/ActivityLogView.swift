//
//  ContentView.swift
//  coredata-test
//
//  Created by Wright Chin on 15/11/2021.
//

import SwiftUI
import CoreData

struct ActivityLogView: View {
    @Environment(\.managedObjectContext) private var viewContext

    static let today:Date = Calendar.current.startOfDay(for: Date())

//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Activity.startTime, ascending: true)],
//        predicate:NSPredicate(format: "timestamp >= %@", today as NSDate),
//        animation: .default)
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Activity.startTime, ascending: true)],
        animation: .default)
    
    private var activities: FetchedResults<Activity>

    @State private var showActivitySheet = false
    
    let dateFormatter = DateFormatter()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities) { activity in
                    HStack {
//                        Text(activity.calorieBurned ?? "0")
                        Text("\(activity.startTime!, formatter: dateOnlyFormatter) - \(activity.activityType!) (\(Int(activity.endTime!.timeIntervalSince(activity.startTime!)/60)) min)")
                        Spacer()
                        Text("\(activity.calorieBurned ?? "0")")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationBarTitle("Calories Calculator")
            .navigationBarItems(
                trailing: Button(action: {
                showActivitySheet = true
            }, label: {
                Image(systemName: "plus.circle")
                    .imageScale(.large)
            }))
            .sheet(isPresented: $showActivitySheet) {
                ActivityView2()
            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Activity(context: viewContext)
            newItem.timestamp = Date()

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
            offsets.map { activities[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let dateOnlyFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    return formatter
}()

struct ActivityLogView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityLogView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
