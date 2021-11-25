//
//  ClassRecordView.swift
//  Fitness+
//
//  Created by Wright Chin on 16/11/2021.
//

import SwiftUI
import CoreData

struct ClassRecordView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Record.date, ascending: true)],
        animation: .default)
    private var records: FetchedResults<Record>

    var body: some View {
        NavigationView {
            List {
                ForEach(records) { record in
                    Text("\(record.dateTime ?? "null") \n \(record.studioName ?? "null") | \(record.teacher ?? "null") | \(record.type ?? "null")")
                }
                .onDelete(perform: deleteItems)
            }
        }
    }
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { records[$0] }.forEach(viewContext.delete)

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

struct ClassRecordView_Previews: PreviewProvider {
    static var previews: some View {
        ClassRecordView().environment(\.managedObjectContext, PersistenceController2.preview.container.viewContext)
    }
}
