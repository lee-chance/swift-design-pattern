# Builder

### Conceptual

```swift
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

```

```
A Product: Product(propertyA: "A", propertyB: "")
B Product: Product(propertyA: "", propertyB: "B")
All Product: Product(propertyA: "A", propertyB: "B")
None Product: Product(propertyA: "", propertyB: "")
```

### Example

```swift
struct Pizza {
    var size: String
    var crust: String
    var toppings: [String]

    init(size: String, crust: String, toppings: [String]) {
        self.size = size
        self.crust = crust
        self.toppings = toppings
    }
    
    class Builder {
        private var size: String = ""
        private var crust: String = ""
        private var toppings: [String] = []
        
        func setSize(size: String) -> Builder {
            self.size = size
            return self
        }
        
        func setCrust(crust: String) -> Builder {
            self.crust = crust
            return self
        }
        
        func addTopping(topping: String) -> Builder {
            toppings.append(topping)
            return self
        }
        
        func build() -> Pizza {
            return Pizza(size: size, crust: crust, toppings: toppings)
        }
    }
}

let hawaiianPizza = Pizza.Builder()
    .setSize(size: "large")
    .setCrust(crust: "thin")
    .addTopping(topping: "pineapple")
    .addTopping(topping: "ham")
    .build()

print(hawaiianPizza.size)
print(hawaiianPizza.crust)
print(hawaiianPizza.toppings)
```

```
large
thin
["pineapple", "ham"]
```
