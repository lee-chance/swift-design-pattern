import Foundation

protocol Product {
    func operation()
}

struct ConcreteProductA: Product {
    func operation() {
        print("A Product")
    }
}

struct ConcreteProductB: Product {
    func operation() {
        print("B Product")
    }
}

protocol Creator {
    func factoryMethod() -> Product
}

extension Creator {
    func doSometing() {
        let product = factoryMethod()
        product.operation()
    }
}

struct ConcreteCreatorA: Creator {
    func factoryMethod() -> Product {
        ConcreteProductA()
    }
}

struct ConcreteCreatorB: Creator {
    func factoryMethod() -> Product {
        ConcreteProductB()
    }
}

ConcreteCreatorA().doSometing()
