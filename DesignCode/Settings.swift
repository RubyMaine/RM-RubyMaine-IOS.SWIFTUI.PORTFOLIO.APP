//
//  Settings.swift
//  RubyMaine
//
//  Created by RubyMaine on 14/08/2023.
//  Copyright © 2019 RubyMaine. All rights reserved.
//

import SwiftUI

struct Settings: View {

   @State var receive = false
   @State var number = 1
   @State var selection = 1
   @State var date = Date()
   @State var email = ""
   @State var submit = false

   var body: some View {
      NavigationView {
         Form {
            Toggle(isOn: $receive) {
               Text("Получать уведомления")
            }
            Stepper(value: $number, in: 1...10) {
               Text("\(number) Уведомление\(number > 1 ? "s" : "") в неделю")
            }
            Picker(selection: $selection, label: Text("Любимый курс:")) {
               Text("SwiftUI").tag(1)
               Text("React Native").tag(2)
            }
            DatePicker(selection: $date, label: {
               Text("Дата:")
            })
            Section(header: Text("Электронная почта:")) {
               TextField("Ваш адрес электронной почты: ", text: $email)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Button(action: { self.submit.toggle() }) {
               Text("Сохранить")
            }
            .alert(isPresented: $submit, content: {
               Alert(title: Text("Thanks"), message: Text("Email: \(email)"))
            })
         }
         .navigationBarTitle("Настройки")
      }
   }
}

#if DEBUG
struct Settings_Previews: PreviewProvider {
   static var previews: some View {
      Settings()
   }
}
#endif
