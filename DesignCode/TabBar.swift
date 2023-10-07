//
//  TabBar.swift
//  RubyMaine
//
//  Created by RubyMaine on 14/08/2023.
//  Copyright © 2019 RubyMaine. All rights reserved.
//

import SwiftUI

struct TabBar: View {
   var body: some View {
      TabView {
         Home().tabItem {
            Image("IconHome")
            Text("Главная")
         }
         .tag(1)
         ContentView().tabItem {
            Image("IconCards")
            Text("Сертификаты")
         }
         .tag(2)
         Settings().tabItem {
            Image("IconSettings")
            Text("Настройки")
         }
         .tag(3)
      }
      .edgesIgnoringSafeArea(.top)
   }
}

#if DEBUG
struct TabBar_Previews: PreviewProvider {
   static var previews: some View {
      TabBar()
//         .environment(\.colorScheme, .dark)
   }
}
#endif
