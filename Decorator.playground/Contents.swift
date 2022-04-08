import Foundation
 

// MARK: - Protocol

protocol Porsche {
    func getPrice() -> Double
    func getDescription() -> String
}

// MARK: - Classes

class Boxter: Porsche {
    func getPrice() -> Double {
        return 120
    }
    
    func getDescription() -> String {
        return "Porsche Boxter"
    }
}

// MARK: - Decorator

class PorscheDecorator: Porsche {
    private let decoratedPorsche: Porsche
    
    /// required - обязательный
    required init(dp: Porsche) {
        self.decoratedPorsche = dp
    }
    
    func getPrice() -> Double {
        return decoratedPorsche.getPrice()
    }
    
    func getDescription() -> String {
        return decoratedPorsche.getDescription()
    }
}

// MARK: - Other Classes With Some Equipment For Car

class PremiumSystem: PorscheDecorator {
    
    required init(dp: Porsche) {
        super.init(dp: dp)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 30
    }
    
    override func getDescription() -> String {
        return super.getDescription() + " with premium audio system"
    }
}

class PanoramicSunroof: PorscheDecorator {
    
    required init(dp: Porsche) {
        super.init(dp: dp)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 20
    }
    
    override func getDescription() -> String {
        return super.getDescription() + " with panoramic sunroof"
    }
}


var porscheBoxter: Porsche = Boxter()
porscheBoxter.getPrice()                // 120
porscheBoxter.getDescription()          // "Porsche Boxter"

porscheBoxter = PremiumSystem(dp: porscheBoxter)
porscheBoxter.getDescription()          // "Porsche Boxter with premium audio system"
porscheBoxter.getPrice()                // 150

porscheBoxter = PanoramicSunroof(dp: porscheBoxter)
porscheBoxter.getDescription()          // "Porsche Boxter with premium audio system with panoramic sunroof"
porscheBoxter.getPrice()                // 170


 
