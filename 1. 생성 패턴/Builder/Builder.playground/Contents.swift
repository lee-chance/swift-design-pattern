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
}

class PizzaBuilder {
    private var size: String = ""
    private var crust: String = ""
    private var toppings: [String] = []
    
    func setSize(size: String) -> PizzaBuilder {
        self.size = size
        return self
    }
    
    func setCrust(crust: String) -> PizzaBuilder {
        self.crust = crust
        return self
    }
    
    func addTopping(topping: String) -> PizzaBuilder {
        toppings.append(topping)
        return self
    }
    
    func build() -> Pizza {
        return Pizza(size: size, crust: crust, toppings: toppings)
    }
}

let hawaiianPizzaBuilder = PizzaBuilder()

let hawaiianPizza = PizzaBuilder()
    .setSize(size: "large")
    .setCrust(crust: "thin")
    .addTopping(topping: "pineapple")
    .addTopping(topping: "ham")
    .build()

print(hawaiianPizza.size)  // prints "large"
print(hawaiianPizza.crust) // prints "thin"
print(hawaiianPizza.toppings) // prints ["pineapple", "ham"]

let pepperoniPizza = PizzaBuilder()
    .setSize(size: "medium")
    .setCrust(crust: "thick")
    .addTopping(topping: "pepperoni")
    .addTopping(topping: "mozzarella")
    .build()

print(pepperoniPizza.size)  // prints "medium"
print(pepperoniPizza.crust) // prints "thick"
print(pepperoniPizza.toppings) // prints ["pepperoni", "mozzarella"]
