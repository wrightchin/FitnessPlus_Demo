//
//  HomeBar.swift
//  Fitness+
//
//  Created by Lam Perth on 13/11/2021.
//

import SwiftUI

struct ScheduleView: View {
    @EnvironmentObject var studioModel:StudioModel
    @State var studio: Studio
    private var studioIndex: Int {
        studioModel.studios.firstIndex(where: {$0.id==studio.id}) ?? 0
    }
    
    var body: some View {
        List{
            ForEach(self.studio.schedule, id: \.self) { sch in
                NavigationLink(
                    destination: ClassView(studio: studio, classSch: sch),
                    label: {
                        HStack {
                            Text(sch[0])
                            Spacer()
                            Text(sch[1])
                        }
                    }
                )
                    .navigationTitle("Schedule")
            }
        }
    }
}



struct ScheduleView_Previews: PreviewProvider {
    static let studioModel = StudioModel()
    static var previews: some View {
        ScheduleView(studio: studioModel.studios[0])
            .environmentObject(StudioModel())
    }
}
