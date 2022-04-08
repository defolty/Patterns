

// MARK: - Strategy

/// protocols
protocol SwimBehavior {
    func swim()
}

protocol DiveBehavior {
    func dive()
}

/// classes
class ProfessionalSwimmer: SwimBehavior {
    func swim() {
        print("professional swimming")
    }
}

class NewbieSwimmer: SwimBehavior {
    func swim() {
        print("newbie swimming")
    }
}
 
class NonSwimmer: SwimBehavior {
    func swim() {
        print("non swimming")
    }
}

class ProfessionalDiver: DiveBehavior {
    func dive() {
        print("professional diving")
    }
}

class NewbieDiver: DiveBehavior {
    func dive() {
        print("newbie diving")
    }
}

class NonDiving: DiveBehavior {
    func dive() {
        print("non diving")
    }
}

/// main class
class Human {
    
    /// 2 свойства, которые определены протоколами
    private var diveBehavior: DiveBehavior!
    private var swimBehavior: SwimBehavior!
    
    func performSwim() {
        swimBehavior.swim()
    }
    
    func performDive() {
        diveBehavior.dive()
    }
    
    func setSwimBehavior(sb: SwimBehavior) {
        self.swimBehavior = sb
    }
    
    func setDiveBehavior(db: DiveBehavior) {
        self.diveBehavior = db
    }
    
    init(swimBehavior: SwimBehavior, diveBehavior: DiveBehavior) {
        self.swimBehavior = swimBehavior
        self.diveBehavior = diveBehavior
    }
}

let human = Human(swimBehavior: NonSwimmer(), diveBehavior: ProfessionalDiver())

/// если хотим изменить входящий
human.setDiveBehavior(db: ProfessionalDiver())
human.performDive()                             // professional diving
 
human.setDiveBehavior(db: NewbieDiver())
human.performDive()                             // newbie diving

human.setSwimBehavior(sb: NonSwimmer())
human.performSwim()                             // non swimming
