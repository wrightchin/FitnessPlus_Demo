//
//  HomeView.swift
//  Fitness+
//
//  Created by Wright Chin on 14/11/2021.
//

import SwiftUI

struct HomeView: View {
    @State private var index = 0
    @EnvironmentObject var studioModel:StudioModel
    @State private var array = [CardView0(), CardView1(), CardView2()]
    
    let grey = Color(red: 0.5, green: 0.5, blue: 0.5)
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    VStack{
                        TabView(selection: $index) {
                            ForEach((0..<3), id: \.self) { index in
                                if index == 0 {
                                    NavigationLink(
                                        destination: StudioView(studio: studioModel.studios[0]),
                                        label: {
                                            CardView0()
                                        })
                                }
                                if index == 1 {
                                    NavigationLink(
                                        destination: StudioView(studio: studioModel.studios[1]),
                                        label: {
                                            CardView1()
                                        })
                                }
                                if index == 2 {
                                    NavigationLink(
                                        destination: StudioView(studio: studioModel.studios[2]),
                                        label: {
                                            CardView2()
                                        })
                                }
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        HStack(spacing: 2) {
                            ForEach((0..<3), id: \.self) { index in
                                Circle()
                                    .fill(index == self.index ? grey.opacity(0.8) : grey.opacity(0.5))
                                    .frame(width: 10, height: 10)
                            }
                        }
                        .padding(.bottom, 30)
                    }
                    .frame(height: 400)
                    
                    HStack{
                        Text("Featuring")
                            .font(.title)
                            .bold()
                        Spacer()
                    }

                    HStack {
                        NavigationLink(
                            destination: ClassView(studio: studioModel.studios[0], classSch: studioModel.studios[0].schedule[0]),
                            label: {
                                CardView3()
                            })
                        NavigationLink(
                            destination: ClassView(studio: studioModel.studios[0], classSch: studioModel.studios[1].schedule[1]),
                            label: {
                                CardView4()
                            })
                    }
                    
                }
                .padding()
                .navigationBarTitle("Welcome to Fitness+")
            }
        }
    }
}

struct CardView0: View{
    var body: some View{
        VStack{
        Image("icon")
            .resizable()
            .scaledToFill()
            .shadow(radius: 50)
            .padding(.bottom, 10)
        }
    }
}

struct CardView1: View{
    var body: some View{
        VStack {
        Image("yoga")
            .resizable()
            .scaledToFill()
            .shadow(radius: 5)
            .padding(.bottom, 10)
        }
    }
}

struct CardView2: View{
    var body: some View{
        VStack {
        Image("eric")
            .resizable()
            .scaledToFill()
            .shadow(radius: 5)
            .padding(.bottom, 10)
        }
    }
}

struct CardView3: View{
    var body: some View{
        VStack{
        Image("fly")
            .resizable()
            .cornerRadius(20)
            .overlay(ImageOverlay(), alignment: .topLeading)
        }
        .frame(width: 150)
        .frame(height: 150)
        .padding(.trailing, 30)
    }
}

struct CardView4: View{
    var body: some View{
        VStack{
        Image("test")
            .resizable()
            .cornerRadius(20)
            .overlay(ImageOverlay2(), alignment: .bottomTrailing)
        }
        .frame(width: 150)
        .frame(height: 150)
    }
}

struct ImageOverlay: View {
    var body: some View {
        ZStack {
            Text("Flow")
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.black)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(6)
    }
}

struct ImageOverlay2: View {
    var body: some View {
        ZStack {
            Text("Mindfulness")
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.black)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(6)
    }
}
