//
//  Checkbox.swift
//  AngelaIOS
//
//  Created by ANGELA ROGEL GONZALEZ on 20/1/25.
//

import SwiftUI

struct Checkbox: View {
    @Binding var checked: Bool

        var body: some View {
            Image(systemName: checked ? "checkmark.square.fill" : "square")
                .foregroundColor(checked ? Color(UIColor.systemPurple) : Color.secondary)
                .onTapGesture {
                    self.checked.toggle()
                }
        }
}

struct Checkbox_Previews: PreviewProvider {
    struct CheckBoxViewHolder: View {
            @State var checked = false

            var body: some View {
                Checkbox(checked: $checked)
            }
        }

        static var previews: some View {
            CheckBoxViewHolder()
        }
}
