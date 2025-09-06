//
//  Playground1.swift
//  DemoTheNewDesign
//
//  Created by Ayokunle Fatokimi on 06/09/2025.
//

import Foundation
import Playgrounds

struct Student {
    var name: String
    var age: Int
}

#Playground {
    var boy = Student(name: "Ayo 2", age: 10)
    var car = Car(model: "Benz", year: 2025)
    print("devAYZ", boy.name, car)
}
