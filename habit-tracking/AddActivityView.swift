//
//  AddActivityView.swift
//  habit-tracking
//
//  Created by Juan Carlos Robledo Morales on 04/10/24.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(\.dismiss) var dismiss // Para cerrar el formulario
    @State private var title = ""
    @State private var description = ""
    @ObservedObject var store: ActivityStore
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Título de la actividad", text: $title)
                TextField("Descripción de la actividad", text: $description)
            }
            .navigationTitle("Nueva Actividad")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") {
                        dismiss() // Cerrar el formulario
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Guardar") {
                        let newActivity = Activity(title: title, description: description, completionCount: 0)
                        store.activities.append(newActivity) // Agregar nueva actividad
                        dismiss() // Cerrar el formulario
                    }
                }
            }
        }
    }
}


#Preview {
    AddActivityView()
}
