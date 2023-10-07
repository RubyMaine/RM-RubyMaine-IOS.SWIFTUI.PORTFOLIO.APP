//
//  UpdateList.swift
//  RubyMaine
//
//  Created by RubyMaine on 14/08/2023.
//  Copyright © 2019 RubyMaine. All rights reserved.
//

import SwiftUI

struct UpdateList: View {

   var updates = updateData
   @ObservedObject var store = UpdateStore(updates: updateData)

   func addUpdate() {
      store.updates.append(Update(image: "Certificate1", title: "New Title", text: "New Text", date: "JUL 1"))
   }

   func move(from source: IndexSet, to destination: Int) {
      store.updates.swapAt(source.first!, destination)
   }

   var body: some View {
      NavigationView {
         List {
            ForEach(store.updates) { item in
               NavigationLink(destination: UpdateDetail(title: item.title, text: item.text, image: item.image)) {
                  HStack(spacing: 12.0) {
                     Image(item.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .background(Color("background"))
                        .cornerRadius(20)

                     VStack(alignment: .leading) {
                        Text(item.title)
                           .font(.headline)

                        Text(item.text)
                           .lineLimit(2)
                           .lineSpacing(4)
                           .font(.subheadline)
                           .frame(height: 50.0)

                        Text(item.date)
                           .font(.caption)
                           .fontWeight(.bold)
                           .foregroundColor(.gray)
                     }
                  }
               }
               .padding(.vertical, 8.0)
            }
            .onDelete { index in
               self.store.updates.remove(at: index.first!)
            }
            .onMove(perform: move)
         }
         .navigationBarTitle(Text("Обновления"))
         .navigationBarItems(
            leading: Button(action: addUpdate) { Text("Добавить обновление") },
            trailing: EditButton()
         )
      }
   }
}

#if DEBUG
struct UpdateList_Previews: PreviewProvider {
   static var previews: some View {
      UpdateList()
   }
}
#endif

struct Update: Identifiable {
   var id = UUID()
   var image: String
   var title: String
   var text: String
   var date: String
}

let updateData = [
   Update(image: "Illustration1", title: "SwiftUI", text: "Узнайте, как создавать собственные представления и элементы управления в SwiftUI с расширенными возможностями композиции, компоновки, графики и анимации. Посмотрите демонстрацию высокопроизводительного анимированного элемента управления и посмотрите, как он шаг за шагом создается в коде. Получите более глубокое понимание системы компоновки SwiftUI.", date: "14.08.2023"),
   Update(image: "Illustration2", title: "Framer X", text: "Узнайте, как создавать собственные представления и элементы управления в SwiftUI с расширенными возможностями композиции, компоновки, графики и анимации. Посмотрите демонстрацию высокопроизводительного анимированного элемента управления и посмотрите, как он шаг за шагом создается в коде. Получите более глубокое понимание системы компоновки SwiftUI.", date: "13.08.2023"),
   Update(image: "Illustration3", title: "CSS Layout", text: "Узнайте, как объединить CSS Grid, Flexbox, анимацию и адаптивный дизайн для создания красивого прототипа в CodePen.", date: "MAY 26"),
   Update(image: "Illustration4", title: "React Native Full", text: "Узнайте, как реализовать жесты, анимацию Lottie и вход в Firebase.", date: "12.08.2023"),
   Update(image: "Certificate1", title: "Unity", text: "Курс Unity, обучение основам, C#, активам, дизайну уровней и игровому процессу", date: "11.08.2023"),
   Update(image: "Certificate2", title: "React Native для Designers", text: "Создайте собственное приложение для iOS и Android с пользовательскими анимациями, данными Redux и API.", date: "10.08.2023"),
   Update(image: "Certificate3", title: "Vue.js", text: "Создайте веб-приложение для панели инструментов с полной системой входа в систему, темным режимом и анимированными диаграммами для ваших данных.", date: "09.08.2023")
]
