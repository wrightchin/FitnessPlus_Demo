//
//  Persistence.swift
//  Fitness+
//
//  Created by Wright Chin on 11/11/2021.
//

import CoreData

enum ActivityType:String, CaseIterable {
    case hatha = "Hatha"
    case nadisohana = "Nadisohana"
    case stretching = "Stretching"
    case suryaNamasker = "Surya Namasker"
    case power = "Power"
}

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        for _ in 0..<4 {
            let newItem = Activity(context: viewContext)
            newItem.id = UUID()
            newItem.activityType = ActivityType.allCases[Int.random(in: 0..<ActivityType.allCases.count)].rawValue
            newItem.startTime = Date()
            newItem.endTime = Date()
            newItem.weight = String()
            newItem.calorieBurned = String()
       }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Fitness_")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}

struct PersistenceController2 {
    static let shared = PersistenceController2()

    static var preview: PersistenceController2 = {
        let result = PersistenceController2(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newRecord = Record(context: viewContext)
            newRecord.date = Date()
            newRecord.id = UUID()
            newRecord.studioName = String()
            newRecord.type = String()
            newRecord.classImage = String()
            newRecord.teacher = String()
            newRecord.dateTime = String()
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "coredata_test")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}

struct PersistenceController3 {
    static let shared = PersistenceController3()

    static var preview: PersistenceController3 = {
        let result = PersistenceController3(inMemory: true)
        let viewContext = result.container.viewContext
        
        for _ in 0..<4 {
            let newVenue = Venue(context: viewContext)
            newVenue.id = UUID()
            newVenue.date = Date()
            newVenue.star = false
            newVenue.studioName = String()
       }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Fitness_")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
