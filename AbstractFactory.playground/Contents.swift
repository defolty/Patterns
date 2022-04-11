


protocol Car {
    
    func drive()
}

class LittleSizeCar: Car {
    
    func drive() {
        print("drive a little car")
    }
}

class MiddleSizeCar: Car {
    
    func drive() {
        print("drive a middle car")
    }
}

protocol Bus {
    
    func drive()
}

class LittleSizeBus: Bus {
    
    func drive() {
        print("drive a little bus")
    }
}

class MiddleSizeBus: Bus {
    
    func drive() {
        print("drive a middle size bus")
    }
}


protocol Factory {
    
    func produceBus() -> Bus
    func produceCar() -> Car
}

class LittleSizeFactory: Factory {
    
    func produceBus() -> Bus {
        print("Little bus is created")
        return LittleSizeBus()
    }
    
    func produceCar() -> Car {
        print("Little size car is creates")
        return LittleSizeCar()
    }
}

class MiddleSizeFactory: Factory {
    
    func produceBus() -> Bus {
        print("Middle bus is created")
        return MiddleSizeBus()
    }
    
    func produceCar() -> Car {
        print("Middle size car is creates")
        return MiddleSizeCar()
    }
}

let littleFactory = LittleSizeFactory()
littleFactory.produceCar()


let middleFactory = MiddleSizeFactory()
middleFactory.produceBus()





