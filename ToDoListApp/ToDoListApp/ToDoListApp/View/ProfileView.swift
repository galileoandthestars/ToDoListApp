//
//  ProfileView.swift
//  ToDoListApp
//
//  Created by Fabiola Fonseca Rivera on 12/5/24.
//


import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var showingSuccessMessage: Bool = false
    @State private var showingEditAlert: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            // Profile Picture
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)
                .shadow(radius: 10)

            // Name
            VStack(alignment: .leading, spacing: 5){
                Text("Name: ")
                    .font(.headline)
                    .foregroundColor(.secondary)
                TextField("Name", text: $viewModel.profile.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
            }
            //E-mail
            VStack(alignment: .leading, spacing: 5){
                Text("E-mail: ")
                    .font(.headline)
                    .foregroundColor(.secondary)
                TextField("Email", text: $viewModel.profile.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
            }

            // Buttons
            HStack(spacing: 40) {
                Button(action: {
                    showingEditAlert = true
                }) {
                    Text("Save")
                        .font(.headline)
                        .padding()
                        .frame(width: 100)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                Button(action: {
                    viewModel.resetProfile()
                    dismiss()
                }) {
                    Text("Cancel")
                        .font(.headline)
                        .padding()
                        .frame(width: 100)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding(.top, 20)
            
            if showingSuccessMessage{
                Text("Profile updated successfully")
                    .font(.callout)
                    .foregroundColor(Color.green)
                    .transition(.opacity)
                    .padding(.top, 10)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Profile")
        .alert(isPresented: $showingEditAlert) {
            Alert(
                title: Text("Update Profile"),
                message: Text("Are you sure you want to update this profile?"),
                primaryButton: .destructive(Text("Update")) {
                        viewModel.updateProfile()
                        showSuccess()
                        //dismiss()
                },
                secondaryButton: .cancel()
            )
        }
    }
    private func showSuccess(){
        withAnimation{
            showingSuccessMessage = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            withAnimation{
                showingSuccessMessage = false
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel())
    }
}

