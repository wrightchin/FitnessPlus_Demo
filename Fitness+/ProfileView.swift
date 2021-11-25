//
//  ProfileView.swift
//  Fitness+
//
//  Created by Wright Chin on 12/11/2021.
//

import SwiftUI

struct ImagePicker:UIViewControllerRepresentable{
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image:UIImage?
    
    
    var selectedSource:UIImagePickerController.SourceType
    
    func makeUIViewController(context:Context) -> UIImagePickerController{
        let picker=UIImagePickerController()
        picker.sourceType = selectedSource
        picker.delegate = context.coordinator
        return picker
    }
    func updateUIViewController(_ uiViewController:UIImagePickerController,context:Context) {
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(parent:self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate,
        UIImagePickerControllerDelegate {
            let parent: ImagePicker
            init(parent: ImagePicker) {
                self.parent = parent
            }
        func imagePickerController(_ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage=info[.originalImage] as? UIImage{
                parent.image=uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
            }
        }
}

struct ProfileView: View {
    @EnvironmentObject var studioModel: StudioModel
    
    @State private var image:UIImage? = nil
    @State private var showingImagePicker = false
    @State private var selectedImageSource = UIImagePickerController.SourceType.photoLibrary
    @State private var placeHolderImage = Image("test2")
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Record.date, ascending: true)],
        animation: .default)
    private var records: FetchedResults<Record>
    
    var body: some View {
//        NavigationView {
            VStack {
                HStack{
                    Text("\nProfile")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding()
                placeHolderImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .cornerRadius(100)

                HStack {
                    Button("Photo Library") {
                        selectedImageSource = .photoLibrary
                        showingImagePicker = true
                    }
                    Text(" | ")
                    Button("Camera") {
                        selectedImageSource = .camera
                        showingImagePicker = true
                    }
                }
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Name")
                        .font(.title)
                        .padding(.bottom, 10)

                        HStack {
                            Text("Carman")
                            Spacer()
                            Text("HK")
                        }
                        
                        Divider()
                        
                        Text("Class Attended")
                            .font(.title)
                            .padding(.bottom, 10)
                        VStack{
                            HStack {
                                Text("Yoga")
                                Spacer()
                                Text("26")
                            }
                                
                            HStack {
                                Text("Fitness")
                                Spacer()
                                Text("5")
                            }
                        }
                        
                        Divider()
                        
                        Text("Record")
                            .font(.title)
                            .padding(.bottom, 10)
                        HStack {
                            List {
                                ForEach(records) { record in
                                    Text("\(record.dateTime ?? "null") \n \(record.studioName ?? "null") | \(record.teacher ?? "null") | \(record.type ?? "null")")
                                }
                                .onDelete(perform: deleteItems)
                            }
                            .frame(height: 300)
                        }
                        .padding(.bottom, 10)
                    }
                    .padding(20)
                }

                Spacer()
            }.sheet(isPresented: $showingImagePicker, onDismiss: {
                placeHolderImage = (image == nil) ? Image("test2") : Image(uiImage: image!)
            }){
                ImagePicker(image: self.$image, selectedSource: selectedImageSource)
//            }
//        .navigationTitle("User Profile")
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(StudioModel())
    }
}
