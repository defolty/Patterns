import Foundation


// MARK: - Observer

protocol Subject {
    /// добавляем наблюдателя
    func add(observer: ProphertyObserver)
    
    /// удаляет наблюдателя
    func remove(observer: ProphertyObserver)
    
    /// уведомляет всех наблюдателей Teacher в данном случае
    func notify(withString string: String)
}

// протокол, который будут реализовывать все наши наблюдатели
protocol ProphertyObserver {
    /// когда наблюдатель получает какое-либо уведомление он что-то с ним должен сделать
    
    /// первый метод  - получено новое задание
    func didGet(newTask task: String)
}

/// за объектом Teacher наблюдают Pupil
class Teacher: Subject { // Teacher реализует протокол Subject
    
    /// для чего нужен NSMutableSet (другими словами журнал учителя):
    /// на деле нужна коллекция, которую мы можем изменять
    /// и в которой все элементы будут находится в единственном экземпляре
    var observerCollection = NSMutableSet() // Foundation позволяет импортировать классы, которые были реализованы в obj c
    
    /// после того когда мы даём новое задание, мы также хотим чтобы у учителя это задание тоже было записано
    /// для чего это нужно, для того чтобы автоматически потом вызывать метод notify
    /// когда появляется появляется домашная работа, срабатывает метод notify
    var homeTask = "" {
        didSet {
            /// newValue берём из homeTask и помещаем в notify, который в свою очередь вызывает у каждого нашего наблюдателя метод didGet
            notify(withString: homeTask)
        }
    }
    
    // добавляет в коллекцию элемент
    func add(observer: ProphertyObserver) {
        observerCollection.add(observer)
    }
    
    // удаляет из коллекции элемент
    func remove(observer: ProphertyObserver) {
        observerCollection.remove(observer)
    }
    
    func notify(withString string: String) {
        for observer in observerCollection {
            
            // нужно чтобы обратиться к методу, который будет реализован в протоколе ProphertyObserver
            (observer as! ProphertyObserver).didGet(newTask: string)
        }
    }
}

class Pupil: NSObject, ProphertyObserver { // для чего NSObject, для того чтобы поместить класс Pupil в коллекцию NSMutableSet
    
    var homeTask = ""
    
    func didGet(newTask task: String) {
        homeTask = task
        print("new homework to be done. | новая д/р которую нужно сделать.")
    }
}

let teacher = Teacher()
let pupil = Pupil()

teacher.add(observer: pupil)
teacher.homeTask = "Задача №3 на стр. 21"

pupil.homeTask // "Задача №3 на стр. 21"
