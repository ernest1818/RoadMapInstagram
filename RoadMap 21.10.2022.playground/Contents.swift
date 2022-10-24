import UIKit

var greeting = "Hello, playground"

var initi = "инициализаторы"

struct Human {
    let name: String
    let age: Int
    
    init(name2: String) {
        name = name2
        age = 10
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let human = Human(name: "Ernest", age: 2)

class Table {
    var height: Int
    var width: Int
    var color: String
    var isLarge: Bool
    var type: String
    
    var square: Int {
        height * width
    }
    
    init(height: Int, width: Int, color: String, isLarge: Bool, type: String) {
        self.height = height
        self.width = width
        self.color = color
        self.isLarge = isLarge
        self.type = type
    }
    
    convenience init(height: Int, width: Int, color: String, isLarge: Bool) {
        self.init(height: height, width: width, color: color, isLarge: isLarge, type: "default")
    }
    
    convenience init(height: Int, width: Int, color: String) {
        self.init(height: height, width: width, color: color, isLarge: false)
        self.empty()
    }
    
    convenience init(height: Int, width: Int) {
        self.init(height: height, width: width, color: "default")
    }
    
    convenience init(width: Int) {
        self.init(height: 100, width: width)
    }
    
    func empty() {
        print("foo")
    }
}

class IronTable: Table {
    var ironCost = 100
    
    init(cost: Int) {
        self.ironCost = cost
        super.init(height: 100, width: 100, color: "", isLarge: true, type: "")
    }
    
    convenience init(ironCost: Int) {
        self.init(height: 100, width: 100, color: "", isLarge: false, type: "")
        self.ironCost = ironCost
    }
    
    //    init(height: Int, width: Int, color: String, isLarge: Bool, type: String, mood: String) {
    //        super.init(height: height, width: width, color: color, isLarge: isLarge, type: type)
    //    }
    
    //    override init(height: Int, width: Int, color: String, isLarge: Bool, type: String) {
    //        super.init(height: 100, width: 100, color: "", isLarge: true, type: "")
    //    }
    
    override convenience init(height: Int, width: Int, color: String, isLarge: Bool, type: String) {
        self.init(cost: 89)
    }
}

//let ironTable = IronTable(width: 100)
//let iron2 = IronTable(height: 200, width: 200)
//let iron3 = IronTable(


class FourthTable: IronTable {
    var fourthMaterial: String
    
    init(material: String) {
        self.fourthMaterial = material
        super.init(cost: 50)
    }
    
    override init(cost: Int) {
        self.fourthMaterial = "mat"
        super.init(cost: cost)
    }
    
    //     init(material: String) {
    //        self.fourthMaterial = material
    //        super.init(height: 100, width: 100, color: "color", isLarge: true, type: "type", mood: "mood")
    //    }
    
    //    override init(height: Int, width: Int, color: String, isLarge: Bool, type: String) {
    //        super.init(height: 100, width: 200, color: "", isLarge: true, type: "")
    //    }
}


struct Home {
    var price: Int
    
    init?(price: Int) {
        if price > 50 {
            self.price = price
        } else {
            return nil
        }
    }
}

let home = Home(price: 500)
print(home)

class Student {
    let mark: Int
    
    init?(mark: Int) {
        return nil
        self.mark = mark
    }
}

class Shop {
    var cost: Int
    var count: Int
    init(cost: Int, count: Int) {
//        if cost < 0 || count < 0 { return nil }
        self.cost = cost
        self.count = count
    }
}

//class CandyShop: Shop {
//    var candy: String?
//
//    init?(candy: String) {
//        self.candy = candy
//        super.init(cost: cost, count: count)
//        if candy.isEmpty {
//            return nil
//
//        }
//    }
//
//    init() {
//        self.candy = "candy"
//        super.init(cost: 1, count: 1)
//    }
//}

//class ChupaShop: CandyShop {
//    var chupa: String = ""
//
//    override init(candy: String) {
////        self.chupa = "dddddd"
//        if candy.isEmpty {
//            super.init()
//        } else {
//            super.init(candy: candy)
//        }
//    }
//}

class Document {
    var name: String?
    //этот инициализатор создает документ со значением nil свойства name
    init(){}
    //этот инициализатор создает документ с не пустым свойством name
    init?(name: String) {
      if name.isEmpty { return nil }
      self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
//    override init() {
//        super.init()
//        self.name = "[Untitled]"
//    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

let automat = AutomaticallyNamedDocument(name: "")
automat.name
