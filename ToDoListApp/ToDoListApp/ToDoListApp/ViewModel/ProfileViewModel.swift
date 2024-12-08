//
//  ProfileViewModel.swift
//  ToDoListApp
//
//  Created by Fabiola Fonseca Rivera on 12/5/24.
//

import SwiftUI
import Combine

@MainActor
class ProfileViewModel: ObservableObject {
    @Published var profile: Profile
    private var originalProfile: Profile
    private let profileKey = "profile_key"
    
    init(profile: Profile = Profile(name: "John Doe", email: "john@example.com")) {
        self.profile = profile
        self.originalProfile = profile
    }
    
    func updateProfile() {
        // Logic to save the profile, e.g., to a database or API
        originalProfile = profile
        saveProfile()
    }
    
    func resetProfile() {
        // Revert to the original profile data
        profile = originalProfile
        saveProfile()
        
    }
    
    private func saveProfile() {
        do {
            let encodedData = try JSONEncoder().encode(profile)
            UserDefaults.standard.set(encodedData, forKey: profileKey)
        }catch {
                print("Error saving profile: \(error)")
        }
    }
    
    private func loadProfile() {
        if let savedData = UserDefaults.standard.data(forKey: profileKey) {
            do {
                profile = try JSONDecoder().decode(Profile.self, from: savedData)
            } catch {
                print("Error decoding notes: \(error)")
                profile = originalProfile
            }
        }
    }
}

