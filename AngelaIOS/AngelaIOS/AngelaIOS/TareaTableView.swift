//
//  TareaTableView.swift
//  AngelaIOS
//
//  Created by ANGELA ROGEL GONZALEZ on 20/1/25.
//

import SwiftUI

struct TareaTableView: View {
    @Binding var username: String
    @State private var tareas = [
        Tarea(title: "Desodorante"),
        Tarea(title: "Limpia cristales"),
        Tarea(title: "Proteínas"),
        Tarea(title: "Compresas"),
        Tarea(title: "Vaselina")
    ]
    
    @State private var nuevaTarea = "" // Declarar la propiedad fuera del body

    var body: some View {
        VStack {
            // Campo de texto y botón para agregar nueva tarea
            HStack {
                TextField("Nueva tarea", text: $nuevaTarea) // Campo de texto
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    // Agregar la nueva tarea solo si no está vacía
                    if !nuevaTarea.isEmpty {
                        tareas.append(Tarea(title: nuevaTarea))
                        nuevaTarea = "" // Limpiar el campo de texto
                    }
                })
                    {
                    Text("+")
                        .padding()
                        .background(Color.purple.opacity(0.35))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        //.frame(width: 40, height: 20)
                }
                    .frame(width: 60, height: 40)
                
            }
            .padding() // Espaciado alrededor del HStack

            // Lista de tareas
            List {
                ForEach(tareas) { tarea in
                    TareaView(tarea: tarea)
                }
                .onDelete { indexSet in
                    tareas.remove(atOffsets: indexSet)
                }
                .onMove { indices, newOffset in
                    tareas.move(fromOffsets: indices, toOffset: newOffset)
                }
            }
        }
        .navigationTitle("Bienvenido/a \(username)")
        .navigationBarItems(trailing: EditButton())
    }
}

struct TareaTableView_Previews: PreviewProvider {
    @State static var name: String = "admin"
    static var previews: some View {
        TareaTableView(username: $name)
    }
}
