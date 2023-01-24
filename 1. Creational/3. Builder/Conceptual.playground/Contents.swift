import Foundation

struct Product {
    var propertyA: String
    var propertyB: String
}

class Builder {
    private var propertyA: String = ""
    private var propertyB: String = ""
    
    func setProperty(toA property: String) -> Builder {
        self.propertyA = property
        return self
    }
    
    func setProperty(toB property: String) -> Builder {
        self.propertyB = property
        return self
    }
    
    func build() -> Product {
        Product(propertyA: propertyA, propertyB: propertyB)
    }
}

let aProduct: Product = Builder().setProperty(toA: "A").build()
let bProduct: Product = Builder().setProperty(toB: "B").build()
let allProduct: Product = Builder().setProperty(toA: "A").setProperty(toB: "B").build()
let noneProduct: Product = Builder().build()

print("A Product: \(aProduct)")
print("B Product: \(bProduct)")
print("All Product: \(allProduct)")
print("None Product: \(noneProduct)")
