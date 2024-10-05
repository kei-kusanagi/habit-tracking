//
//  ActivityStore.swift
//  habit-tracking
//
//  Created by Juan Carlos Robledo Morales on 04/10/24.
//

import Foundation

// Clase observable que almacenará todas las actividades
@Observable class ActivityStore {
    @Published var activities: [Activity] = []
    
    // Función para guardar las actividades en UserDefaults
    func saveActivities() {
        if let encoded = try? JSONEncoder().encode(activities) {
            UserDefaults.standard.set(encoded, forKey: "activities")
        }
    }
    
    // Función para cargar las actividades desde UserDefaults
    func loadActivities() {
        if let savedData = UserDefaults.standard.data(forKey: "activities") {
            if let decoded = try? JSONDecoder().decode([Activity].self, from: savedData) {
                activities = decoded
            }
        }
    }
}
