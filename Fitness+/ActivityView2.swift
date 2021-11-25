//
//  ActivityView2.swift
//  Fitness+
//
//  Created by Wright Chin on 16/11/2021.
//

import SwiftUI

struct ActivityView2: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    @State var activity: Activity?
    @State private var activityTypeIndex=0
    @State private var calorieBurned:String=""
    @State private var weight:String=""
    @State private var startTime=Date()
    @State private var endTime=Date()+3600
    @State private var timestamp=Date()
    
    
    var body: some View {
        NavigationView{
            Form {
                Section (header: Text("Yoga: ")) {
                    Picker(selection: $activityTypeIndex, label: Text("Activity")) {
                        ForEach(0..<ActivityType.allCases.count) {
                            Text(ActivityType.allCases[$0].rawValue).tag($0)
                        }
                    }
                    
                }
                Section (header: Text("Weight: ")) {
                    TextField("Weight in kg", text: $weight)
                }
                Section (header:Text("startTime:")){
                    DatePicker(selection: $startTime, label: {Text("At")})
                }
                Section (header:Text("endTime:")){
                    DatePicker(selection: $endTime, label: {Text("At")})
                }
                Button(action: {
                    if activity == nil {
                        activity = Activity(context:viewContext)
                        activity!.id = UUID()
                    }
                    
                    let d = Double(endTime.timeIntervalSince(startTime)/60)
                    
                    if let w = Double(weight){
                        
                            if ActivityType.allCases[activityTypeIndex].rawValue == "Hatha" {
                                calorieBurned = String(format:"%0.2f", (w*2.5*3.5/200)*d)
                            }
                            if ActivityType.allCases[activityTypeIndex].rawValue == "Nadisohana" {
                                calorieBurned = String(format:"%0.2f", (w*2*3.5/200)*d)
                            }
                            if ActivityType.allCases[activityTypeIndex].rawValue == "Stretching" {
                                calorieBurned = String(format:"%0.2f", (w*2.8*3.5/200)*d)
                            }
                            if ActivityType.allCases[activityTypeIndex].rawValue == "Surya Namasker" {
                                calorieBurned = String(format:"%0.2f", (w*3.3*3.5/200)*d)
                            }
                            if ActivityType.allCases[activityTypeIndex].rawValue == "Power" {
                                calorieBurned = String(format:"%0.2f", (w*4*3.5/200)*d)
                            }
                        
                    }
                    
                    activity!.calorieBurned = calorieBurned
                    activity!.activityType = ActivityType.allCases[activityTypeIndex].rawValue
                    activity!.startTime = startTime
                    activity!.endTime = endTime
                    activity!.weight = weight
                    activity!.timestamp = Calendar.current.startOfDay(for: Date())
                    do {
                        try viewContext.save()
                    } catch {
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Spacer()
                        Text(activity==nil ? "Add" : "Update")
                        Spacer()
                    }
                }
            }
            .navigationTitle("Create Activity")
            .navigationBarItems(leading:
                Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
                }
            )
        }
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {setIndices()})
    }
    
    private func setIndices () {
        if activity != nil {
            activityTypeIndex = ActivityType.allCases.firstIndex(where: {$0.rawValue==activity!.activityType})!
        }
    }
}


struct ActivityView2_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView2()
    }
}

