//
//  ActivityView.swift
//  Fitness+
//
//  Created by Wright Chin on 12/11/2021.
//

import SwiftUI
import CoreData

struct ActivityView: View {
    @State private var weight:String=""
    @State private var duration:String=""
    @State private var title:String="Yoga Calories Burned Calculator"
    @State private var calorie:String="0"
    @State private var yogaSelect = "Hatha"
    @State private var inputError:Bool = false
    
    let yogaType = ["Hatha", "Nadisohana", "Stretching", "Surya Namasker", "Power"]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.system(size: 20, weight: .heavy, design: .default))
                    .padding([.top], 20)
            }
        
            Divider()

            if inputError {
                Text("Input Error")
                    .frame(maxWidth:.infinity)
                .foregroundColor(.white)
                .background(Color.red)
                .padding([.top], 10)
            }
                
            HStack {
                Text("Yoga type:")
                Picker("Select a yoga type", selection: $yogaSelect) {
                    ForEach(self.yogaType, id: \.self) { yogaSelect in
                        VStack {
                            Text(yogaSelect)
                        }
                    }
                }
                .pickerStyle(.menu)
            }
            
            HStack {
                Text("Weight (kg):")
                TextField("weight in kg", text: $weight)
                    .multilineTextAlignment(.trailing)
            }

            HStack{
                Text("Duation (mins):")
                TextField("duration in minutes", text: $duration)
                    .multilineTextAlignment(.trailing)
            }

            HStack {
                Spacer()
                Button(action: {
                    if weight == "" || duration == "" {
                        inputError = true
                    }
                    else {
                        inputError = false
                    }
                    if let w = Double(weight){
                        if let d = Double(duration){
                            if yogaSelect == "Hatha" {
                                calorie = String(format:"%0.2f", (w*2.5*3.5/200)*d)
                            }
                            if yogaSelect == "Nadisohana" {
                                calorie = String(format:"%0.2f", (w*2*3.5/200)*d)
                            }
                            if yogaSelect == "Stretching" {
                                calorie = String(format:"%0.2f", (w*2.8*3.5/200)*d)
                            }
                            if yogaSelect == "Surya Namasker" {
                                calorie = String(format:"%0.2f", (w*3.3*3.5/200)*d)
                            }
                            if yogaSelect == "Power" {
                                calorie = String(format:"%0.2f", (w*4*3.5/200)*d)
                            }
                        }
                    }
                }){
                    Text("Calculate")
                        .padding(7)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                }
                .padding([.top, .bottom], 20)
                Spacer()
            }
            
            Divider()
            
           
            Text("Calories burned: \(calorie)")
                .padding([.top], 10)
            
            
            
        }
        .padding()
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
