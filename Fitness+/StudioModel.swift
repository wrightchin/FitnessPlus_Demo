//
//  StudioModel.swift
//  Fitness+
//
//  Created by Lam Perth on 13/11/2021.
//

import Foundation
import MapKit

class StudioModel: ObservableObject {
    @Published var studios = [Studio]()
   
    init() {
        studios.append(Studio(id: UUID(), studioName: "Patti Catti Studio", type: "Yoga Studio\n", studioImage: "icon", studioAddress: "Room 133, Nova 2, \nCareer & Kenson Industrial Mansion, \n58 Hung To Road, Kwun Tong Hong Kong", equipment: "Yoga Block *6 \nYoga Wheel *6 ", isFavorite: true, coordinate: CLLocationCoordinate2D(latitude: 22.310010, longitude: 114.222380), schedule: [["Mon", "Stretch", "Tracy", "14:00"], ["Wed", "Inversion", "Cavina", "12:00"]]))
        
        studios.append(Studio(id: UUID(), studioName: "Zoe Studio", type: "Yoga Studio\n", studioImage: "yoga", studioAddress: "Hung Hom", equipment: "Yoga Block *4 \nYoga Strap *3 ", isFavorite: false, coordinate: CLLocationCoordinate2D(latitude: 22.307980, longitude: 114.185707), schedule: [["Tue", "Hatha", "Apple", "18:00"], ["Fri", "Hatha", "Zoe", "14:00"]]))
        
        studios.append(Studio(id: UUID(), studioName: "Eric Fitness", type: "Gym Room\n", studioImage: "eric", studioAddress: "The University of Hong Kong", equipment: "Gym eqipmens", isFavorite: false, coordinate: CLLocationCoordinate2D(latitude: 22.282999, longitude: 114.137085), schedule: [["Mon", "HIIT", "Eric", "14:00"], ["Wed", "Power Yoga", "Eric", "1600"]]))
        
        studios.append(Studio(id: UUID(), studioName: "Moon Studio", type: "Self Practice Studio\n", studioImage: "props", studioAddress: "Kwun Tong", equipment: "Yoga Block *6 \nYoga Wheel *6", isFavorite: false, coordinate: CLLocationCoordinate2D(latitude: 22.310010, longitude: 114.222380), schedule: [["Sat", "Self Practice Session", "None", "Whole Day"]]))
        
    }
}
