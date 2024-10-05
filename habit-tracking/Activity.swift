//
//  Activity.swift
//  habit-tracking
//
//  Created by Juan Carlos Robledo Morales on 04/10/24.
//

import Foundation

// Struct para representar una actividad
struct Activity: Identifiable, Codable, Equatable {
    let id = UUID() // Identificador único para cada actividad
    let title: String
    let description: String
    var completionCount: Int // Veces completada la actividad
}
