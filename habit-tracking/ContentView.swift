//
//  ContentView.swift
//  habit-tracking
//
//  Created by Juan Carlos Robledo Morales on 04/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var activityStore = ActivityStore() // Instancia observable
    @State private var showingAddActivity = false // Controla la presentación del formulario
    
    var body: some View {
        NavigationView {
            List(activityStore.activities) { activity in
                NavigationLink(destination: ActivityDetailView(activity: activity, store: activityStore)) {
                    VStack(alignment: .leading) {
                        Text(activity.title).font(.headline)
                        Text("Veces completada: \(activity.completionCount)")
                    }
                }
            }
            .navigationTitle("Mis Hábitos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddActivity = true // Mostrar el formulario
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddActivityView(store: activityStore)
            }
        }
        .onAppear {
            activityStore.loadActivities() // Cargar datos cuando la vista aparezca
        }
        .onChange(of: activityStore.activities) { _ in
            activityStore.saveActivities() // Guardar datos cuando haya cambios
        }
    }
}


#Preview {
    ContentView()
}
