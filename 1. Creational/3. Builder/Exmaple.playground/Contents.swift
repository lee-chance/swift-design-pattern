import Foundation

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
