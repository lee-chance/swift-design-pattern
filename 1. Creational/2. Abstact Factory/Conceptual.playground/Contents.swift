import Foundation

protocol AbstractFactory {
    func createProductA() -> AbstractProductA
    func createProductB() -> AbstractProductB
}

struct ConcreteFactory1: AbstractFactory {
    func createProductA() -> AbstractProductA {
        return ConcreteProductA1()
    }
    
    func createProductB() -> AbstractProductB {
        return ConcreteProductB1()
    }
}

struct ConcreteFactory2: AbstractFactory {
    func createProductA() -> AbstractProductA {
        return ConcreteProductA2()
    }
    
    func createProductB() -> AbstractProductB {
        return ConcreteProductB2()
    }
}

protocol AbstractProductA {
    func usefulFunctionA() -> String
}

struct ConcreteProductA1: AbstractProductA {
    func usefulFunctionA() -> String {
        return "The result of the product A1."
    }
}

struct ConcreteProductA2: AbstractProductA {
    func usefulFunctionA() -> String {
        return "The result of the product A2."
    }
}

protocol AbstractProductB {
    func usefulFunctionB() -> String
    func anotherUsefulFunctionB(collaborator: AbstractProductA) -> String
}

struct ConcreteProductB1: AbstractProductB {
    func usefulFunctionB() -> String {
        return "The result of the product B1."
    }
    
    func anotherUsefulFunctionB(collaborator: AbstractProductA) -> String {
        let result = collaborator.usefulFunctionA()
        return "The result of the B1 collaborating with the (\(result))"
    }
}

struct ConcreteProductB2: AbstractProductB {
    func usefulFunctionB() -> String {
        return "The result of the product B2."
    }
    
    func anotherUsefulFunctionB(collaborator: AbstractProductA) -> String {
        let result = collaborator.usefulFunctionA()
        return "The result of the B2 collaborating with the (\(result))"
    }
}

let factory1 = ConcreteFactory1()
let productA = factory1.createProductA()
let productB = factory1.createProductB()

print(productB.usefulFunctionB())
print(productB.anotherUsefulFunctionB(collaborator: productA))
