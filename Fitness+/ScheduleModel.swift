//
//  ScheduleModel.swift
//  Fitness+
//
//  Created by Lam Perth on 15/11/2021.
//

import Foundation



class ScheduleModel: ObservableObject {
    @Published var schedules = [Schedule]()
   
    init() {
        schedules.append(Schedule(id: UUID(), date: "Nov 11", className: "Hatha", type: "None", classImage: "yoga", teacher: "Patti"))
        schedules.append(Schedule(id: UUID(), date: "Nov 12", className: "Inversion", type: "None", classImage: "yoga", teacher: "Catti"))
        schedules.append(Schedule(id: UUID(), date: "Nov 13", className: "Stretching", type: "None", classImage: "yoga", teacher: "Eric"))
        
        
    }
}

