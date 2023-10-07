//
//  CertificateRow.swift
//  RubyMaine
//
//  Created by RubyMaine on 14/08/2023.
//  Copyright © 2019 RubyMaine. All rights reserved.
//

import SwiftUI

struct CertificateRow: View {

   var certificates = certificateData

   var body: some View {
      VStack(alignment: .leading) {
         Text("Сертификаты")
            .font(.system(size: 20))
            .fontWeight(.heavy)
            .padding(.leading, 30)

         ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
               ForEach(certificates) { item in
                  CertificateView(item: item)
               }
            }
            .padding(20)
            .padding(.leading, 10)
         }
      }
   }
}

#if DEBUG
struct CertificateRow_Previews: PreviewProvider {
   static var previews: some View {
      CertificateRow()
   }
}
#endif

struct Certificate: Identifiable {
   var id = UUID()
   var title: String
   var image: String
   var width: Int
   var height: Int
}

let certificateData = [
   Certificate(title: "Создание SwiftUI", image: "Certificate1", width: 230, height: 150),
   Certificate(title: "Анимация UI", image: "Certificate2", width: 230, height: 150),
   Certificate(title: "Расширенный SwiftUI", image: "Certificate3", width: 230, height: 150),
   Certificate(title: "Flutter Разработки", image: "Certificate4", width: 230, height: 150)
]
