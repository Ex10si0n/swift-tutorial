import Foundation

/*
Classes
     • Useful for representing objects with an identity.
     • Implicit sharing of objects.
     • Internals can remain mutable even when declared with let.
     • Slower memory allocation (heap).
 
Structures
    • Useful for representing values.
    • Implicit copying of values.
    • Becomes completely immutable when declared with let.
    • Fast memory allocation (stack).
*/


class PersonClass {
    var name: String
    init(name: String) {
        self.name = name
    }
}

struct PersonStruct {
    var name: String
    init(name: String) {
        self.name = name
    }
}

// classes are reference types to instances
var john = PersonClass(name: "John")
var doe = john
john.name
doe.name
doe.name = "Doe"
john.name
doe.name

// while structures store values
var steve = PersonStruct(name: "Steve")
var yan = steve
steve.name
yan.name
yan.name = "Yan"
steve.name
yan.name


struct Grade {
    let letter: String
    let points: Double
    let credits: Double
}

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

// inheritance
class Student: Person {
    var grades: [Grade] = []
    
    var gpa: Double {
        return self.grades.reduce(0, {
            $0 + $1.points
        }) / self.grades.reduce(0, {
            $0 + $1.credits
        })
    }
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}

let jane = Student(firstName: "Jane", lastName: "Liu")
let history = Grade(letter: "B", points: 9.0, credits: 3.0)
let math = Grade(letter: "A", points: 16.0, credits: 4.0)
let programming = Grade(letter: "A-", points: 18.0, credits: 4.0)

jane.recordGrade(history)
jane.recordGrade(math)
jane.recordGrade(programming)

jane.gpa

// polymorphism
func phonebookName(_ person: Person) -> String {
    return "\(person.lastName), \(person.firstName)"
}

let person = Person(firstName: "Johnny", lastName: "Appleseed")
let student = Student(firstName: "Steve", lastName: "Yan")

phonebookName(person)
phonebookName(student)

// multiple inheritance: OboePlayer <- BandMember <- Student <- Person
class BandMember: Student {
    var minimumPracticeTime = 2
}

class OboePlayer: BandMember {
    override var minimumPracticeTime: Int {
        get {
            super.minimumPracticeTime * 2
        }
        set {
            super.minimumPracticeTime = newValue / 2
        }
    }
}

// casting
let oboePlayer = OboePlayer(firstName: "Jane", lastName: "Liu")
let janeAsOboePlayer = oboePlayer as Student
janeAsOboePlayer.recordGrade(math)
janeAsOboePlayer.gpa


