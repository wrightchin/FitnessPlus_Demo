//
//  ContentView.swift
//  Fitness+
//
//  Created by Wright Chin on 11/11/2021.
//

import SwiftUI
import CoreData

@available(iOS 15.0, *)
struct LoginPage : View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView{
        
            VStack {
                Text("Fitness+")
                    .font(.headline)
                Spacer()
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.white)
                    .border(Color.black)
                    .padding(.bottom, 20)
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .border(Color.black)
                    .padding(.bottom, 20)
                Spacer()
                
                Button(action: {print("Button tapped")}) {
                    NavigationLink(destination: ContentView()){
                        Text("LOGIN")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 160, height: 40)
                            .background(Color.blue)
                            .cornerRadius(15.0)
                    }
                }
            }
        }
        .padding()
    }
}

@available(iOS 15.0, *)
struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
