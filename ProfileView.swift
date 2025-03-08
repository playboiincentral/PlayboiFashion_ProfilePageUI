//
//  ProfileView.swift
//  PlayboiFashion
//
//  Created by Playboi In Central on 3/6/25.
//

import SwiftUI

struct ProfileView: View {
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 1)
    ]
    @State private var name: String = ""
    @State private var birth = Date()
    @State private var showDatePicker = false
    @State private var dateText: String = ""
    @State private var selectedGender: String = ""
    @State private var showPicker: Bool = false
    let genders = ["Male", "Female", "Other"]
    let countries = [" 🇺🇸 +1","🇻🇳 +84"]
    @State private var selectedCountry = "🇻🇳 +84"
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    AvatarView()
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: columns, alignment: .leading) {
                            VStack(alignment: .leading) {
                                Text("FULL NAME")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                TextField("Enter your full name...", text: $name)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.black,lineWidth: 0.7)
                                    )
                            }
                            VStack(alignment: .leading) {
                                Text("DATE OF BIRTH")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                
                                TextField("Select your date of birth: mm/dd/yyyy", text: $dateText)
                                    .disabled(true)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.black,lineWidth: 0.7)
                                    )
                                    .overlay(content: {
                                        HStack {
                                            Spacer()
                                            Image(systemName: "chevron.down")
                                                .foregroundStyle(.black)
                                        } .padding(.trailing)
                                    })
                                    .overlay (
                                        Button(action: {
                                            showDatePicker.toggle()
                                        }) {
                                            Color.clear
                                        }
                                    )
                            } .padding(.top)
                            
                            VStack(alignment: .leading) {
                                Text("GENDER")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                
                                TextField("Select your gender...", text: .constant(selectedGender))
                                    .disabled(true)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.black,lineWidth: 0.7)
                                    )
                                    .overlay(content: {
                                        HStack {
                                            Spacer()
                                            Image(systemName: "chevron.down")
                                                .foregroundStyle(.black)
                                        } .padding(.trailing)
                                    })
                                    .overlay(
                                        Button(action: {
                                            showPicker.toggle()
                                        }) {
                                            Color.clear
                                        }
                                    )
                                
                            }
                            .padding(.top)
                            VStack(alignment: .leading) {
                                Text("PHONE NUMBER")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                
                                HStack {
                                    Menu {
                                        ForEach(countries, id: \.self) { country in
                                            Button(country) {
                                                selectedCountry = country
                                            }
                                        }
                                    } label: {
                                        Text(selectedCountry)
                                            .foregroundStyle(.black)
                                            .background(
                                                RoundedRectangle(cornerRadius: 15)
                                                    .fill(.white)
                                            )
                                    }
                                    
                                    TextField("Enter your phone number...", text: $name)
                                        .keyboardType(.phonePad)
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(Color.black,lineWidth: 0.7)
                                        )
                                }
                            }                        .padding(.top)
                            EmailView()
                                .padding(.top)
                        }
                    } .padding()
                    Spacer()
                    DoneButton()
                        .padding(.horizontal)
                        .padding(.bottom)
                }
                
                if showDatePicker {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showDatePicker = false
                        }
                    
                    VStack {
                        DatePicker("", selection: $birth, displayedComponents: .date)
                            .datePickerStyle(.wheel)
                            .labelsHidden()
                            .padding()
                            .background(Color.white)
                            .cornerRadius(30)
                            .padding()
                        Button {
                            dateText = dateFormatter.string(from: birth)
                            showDatePicker = false
                        } label: {
                            Text("Done")
                                .font(.title3)
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .padding()
                                .padding(.horizontal, 55)
                                .background(
                                    RoundedRectangle(cornerRadius: 27)
                                        .fill(.black)
                                )
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(30)
                    .padding()
                    .transition(.move(edge: .bottom))
                }
            } .animation(.easeInOut, value: showDatePicker)
                .sheet(isPresented: $showPicker) {
                    VStack {
                        Picker("", selection: $selectedGender) {
                            ForEach(genders, id: \.self) { gender in
                                Text(gender).tag(gender)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .labelsHidden()
                        .padding()
                        
                        Button("Done") {
                            showPicker = false
                        }
                        .padding()
                    }
                    .presentationDetents([.fraction(1/3), .fraction(7/15)])
                    .presentationDragIndicator(.visible)
                }
                .navigationTitle("EDIT PROFILE")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }
    
}

struct AvatarView: View {
    @State private var avatarImage: UIImage? = UIImage(named: "avatar_without_img")
    @State private var isShowingImagePicker = false
    var body: some View {
        ZStack {
                    if let image = avatarImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                    }

                    Button(action: {
                        isShowingImagePicker = true
                    }) {
                        Image(systemName: "camera.fill")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.black)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    }
                    .offset(x: 40, y: 40)
                    .shadow(radius: 3)
                }
                .frame(width: 120, height: 120)
                .sheet(isPresented: $isShowingImagePicker) {
                    ImagePicker(selectedImage: $avatarImage)
                }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let selectedImage = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage {
                parent.selectedImage = selectedImage
            }
            picker.dismiss(animated: true)
        }
    }
}

struct EmailView: View {
    @State private var email: String = ""
    @State private var isValidEmail = true

    var body: some View {
        VStack(alignment: .leading) {
            Text("EMAIL")
                .font(.subheadline)
                .fontWeight(.semibold)

            TextField("Enter your email...", text: $email)
                .padding()
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black,lineWidth: 0.7)
                )
                .onChange(of: email) { newValue in
                    isValidEmail = isValidEmailFormat(newValue)
                }
            if !isValidEmail {
                            Text("⚠️ Invalid email.")
                                .foregroundColor(.red)
                                .font(.caption)
                                .padding(.leading, 15)
                        }
        }    }
    func isValidEmailFormat(_ email: String) -> Bool {
            let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
            return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
        }
}

struct DoneButton: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Button {
            dismiss()
        } label: {
            Text("Done")
                .font(.title2)
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 27)
                        .fill(.black)
                )
        }

    }
}

#Preview {
    ProfileView()
}
