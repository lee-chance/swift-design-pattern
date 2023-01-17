# Factory Method

### Conceptual

```swift
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
```

```
A Product
```

### Example

```swift
protocol Device {
    func display()
}

struct KoreaIPhone: Device {
    func display() {
        print("아이폰에서 보여짐")
    }
}

struct IPhone: Device {
    func display() {
        print("displayed on iPhone")
    }
}

struct KoreaIPad: Device {
    func display() {
        print("아이패드에서 보여짐")
    }
}

struct IPad: Device {
    func display() {
        print("displayed on iPad")
    }
}

protocol DeviceCreator {
    var language: String { get }
    
    func createDevice(language: String) -> Device
}

extension DeviceCreator {
    func display() {
        let device = createDevice(language: language)
        device.display()
    }
}

struct iPhoneCreator: DeviceCreator {
    let language: String
    
    func createDevice(language: String) -> Device {
        if language == "kor" {
            return KoreaIPhone()
        } else {
            return IPhone()
        }
    }
}

struct iPadCreator: DeviceCreator {
    let language: String
    
    func createDevice(language: String) -> Device {
        if language == "kor" {
            return KoreaIPad()
        } else {
            return IPad()
        }
    }
}

iPhoneCreator(language: "kor").display()
iPadCreator(language: "eng").display()
```

```
아이폰에서 보여짐
displayed on iPad
```



