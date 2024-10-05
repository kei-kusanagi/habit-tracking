//
//  ActivityDetailView.swift
//  habit-tracking
//
//  Created by Juan Carlos Robledo Morales on 04/10/24.
//

import SwiftUI

struct ActivityDetailView: View {
    var activity: Activity
    @ObservedObject var store: ActivityStore
    
    var body: some View {
        VStack {
            Text(activity.description).padding()
            
            Text("Veces completada: \(activity.completionCount)")
                .font(.largeTitle)
                .padding()
            
            Button("Incrementar Contador") {
                if let index = store.activities.firstIndex(of: activity) {
                    store.activities[index].completionCount += 1
                }
            }
            .padding()
        }
        .navigationTitle(activity.title)
    }
}


#Preview {
    ActivityDetailView()
}
