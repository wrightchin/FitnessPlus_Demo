//
//  StudioView.swift
//  Fitness+
//
//  Created by Lam Perth on 13/11/2021.
//

import SwiftUI

struct ClassView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext2
    
    @EnvironmentObject var studioModel:StudioModel
    @State var studio: Studio
    private var studioIndex: Int {
        studioModel.studios.firstIndex(where: {$0.id==studio.id}) ?? 0
    }
    var classSch: Array<String> = Array()
    
    @State private var showActivitySheet = false
    
    var body: some View {
        ScrollView {
            Text(classSch[1])
                .font(.title)
                .bold()
            
            VStack (alignment: .leading) {
                if classSch[1] == "Hatha"{
                    Image("hatha")
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(EdgeInsets(top: 25, leading: 50, bottom: 40, trailing: 50))
                    
                    
                    Text("Description")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    Text("Haṭha yoga is a branch of yoga. The Sanskrit word हठ haṭha literally means force and thus alludes to a system of physical techniques.")
                }
                
                if classSch[1] == "Inversion"{
                    Image("inversion")
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(EdgeInsets(top: 25, leading: 50, bottom: 40, trailing: 50))
                    
                    
                    Text("Description")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    Text("Yoga inversion is believed to release tension, increase circulation and energy levels, and strengthen muscles. It's also thought to promote emotional growth, calm the mind and spirit, guide energy toward the heart, and help you become more connected with the earth.")
                }
                
                if classSch[1] == "Stretch"{
                    Image("stretch")
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(EdgeInsets(top: 25, leading: 50, bottom: 40, trailing: 50))
                    
                    
                    Text("Description")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    Text("Stretching keeps the muscles flexible, strong, and healthy, and we need that flexibility to maintain a range of motion in the joints. Without it, the muscles shorten and become tight. Then, when you call on the muscles for activity, they are weak and unable to extend all the way.")
                }
                
                if classSch[1] == "HIIT"{
                    Image("hiit")
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(EdgeInsets(top: 25, leading: 50, bottom: 40, trailing: 50))
                    
                    
                    Text("Description")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    Text("High-intensity interval training (HIIT) is a form of interval training, a cardiovascular exercise strategy alternating short periods of intense anaerobic exercise with less intense recovery periods, until too exhausted to continue. The method is not just restricted to cardio and frequently includes weights for the short periods as well.")
                }
                
                if classSch[1] == "Power Yoga"{
                    Image("power")
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(EdgeInsets(top: 25, leading: 50, bottom: 40, trailing: 50))
                    
                    
                    Text("Description")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    Text("With power yoga, the emphasis is on the flow from one pose to the next, rather than approaching each pose separately. The poses aren’t disconnected from each other, unlike some other forms of yoga.")
                }
                
                if classSch[1] == "Self Practice Session"{
                    Image("props")
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(EdgeInsets(top: 25, leading: 50, bottom: 40, trailing: 50))
                    
                    
                    Text("Description")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    Text("Enjoy your self practice time here!")
                }
            }
            .padding()
            
            VStack (alignment: .leading) {
                Divider()
                
                Text("Time")
                    .font(.headline)
                    .padding([.bottom, .top], 5)
                HStack{
                    Text(classSch[0])
                    Text(classSch[3])
                }
            }
            .padding()
            
            
            VStack (alignment: .leading) {
                Divider()
                
                
                Text("Studio")
                    .font(.headline)
                    .padding([.bottom, .top], 5)
                Text(studio.studioName)
            }
            .padding()
            
            VStack (alignment: .leading) {
                    
                Divider()
                
                Text("Teacher")
                    .font(.headline)
                    .padding([.bottom, .top], 5)
                Text(classSch[2])
                
            }
            .padding()
            Divider()
            
            HStack {
                Button(action: {
                    addItem()
                }) {
                    Text("Add Class")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 155, height: 40)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                }
                .padding(.trailing, 22)
                Button(action: {
                    showActivitySheet = true
                }, label: {
                    Text("Calorie Calculator")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 155, height: 40)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                })
                .sheet(isPresented: $showActivitySheet) {
                    ActivityView2()
                }
            }
            .padding(.bottom, 50)
            .padding(.top, 25)
            
//            Button(action: {print("Button tapped")}) {
//                Text("Add Class")
//                    .font(.subheadline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(width: 160, height: 40)
//                    .background(Color.blue)
//                    .cornerRadius(15.0)
//            }
            
//            .navigationBarItems(
//                trailing: Button(action: {
//                showActivitySheet = true
//            }, label: {
//                Image(systemName: "plus.circle")
//                    .imageScale(.large)
//            }))
//            .sheet(isPresented: $showActivitySheet) {
//                ActivityView2()
//            }
            
//            https://api.whatsapp.com/send/?phone=%2B85262545065&text&app_absent=0
        }
    }
    private func addItem() {
        withAnimation {
            let newRecord = Record(context: viewContext2)
            newRecord.id = UUID()
            newRecord.date = Date()
            newRecord.dateTime = "\(classSch[0]) - \(classSch[3])"
            newRecord.teacher = classSch[2]
            newRecord.type = classSch[1]
            newRecord.studioName = studio.studioName
            
            do {
                try viewContext2.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ClassView_Previews: PreviewProvider {
//    static var previews: some View {
//        StudioView()
//    }

    static let studioModel = StudioModel()
    var classSch: Array<String> = Array()
    static var previews: some View {
        ClassView(studio: studioModel.studios[0], classSch: studioModel.studios[0].schedule[0])
            .environmentObject(StudioModel())
    }
}
