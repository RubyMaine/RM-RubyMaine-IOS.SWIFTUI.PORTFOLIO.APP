//
//  UpdateStore.swift
//  RubyMaine
//
//  Created by RubyMaine on 14/08/2023.
//  Copyright © 2019 RubyMaine. All rights reserved.
//

import Combine
import SwiftUI

class UpdateStore: ObservableObject {
   var willChange = PassthroughSubject<Void, Never>()

   var updates: [Update] {
      didSet {
         willChange.send()
      }
   }

   init(updates: [Update] = []) {
      self.updates = updates
   }
}
