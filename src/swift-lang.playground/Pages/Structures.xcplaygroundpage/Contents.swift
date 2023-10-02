import Foundation

// structure can contains variables, constants, and functions
struct Location {
    var x: Double
    var y: Double
    
    func distance(to anotherLocation: Location) -> Double {
        let deltaX = anotherLocation.x - x
        let deltaY = anotherLocation.y - y
        return (deltaX * deltaX + deltaY * deltaY).squareRoot()
    }
}

let home = Location(x: 2.04, y: 3.42)
let work = Location(x: 1.98, y: 5.56)

home.distance(to: work)

// protocol is interface
protocol Shape {
    var area: Double { get }
}

// using extension to add new functionalities to existing types
extension Shape {
    func description() -> String {
        return "Area: \(area)"
    }
}

struct Rectangle: Shape {
    // stored property
    var width: Double
    var height: Double
    
    // computed property
    var area: Double {
        return width * height
    }
}

var rect = Rectangle(width: 5.0, height: 8.0)
rect.area
rect.description()

rect.width = 1.0
rect.height = 1.0
rect.area

// error at rect.area = 1, since rect.area is read-only computed property

struct TV {
    var width: Double
    var height: Double
    let ratioWidth: Double = 16.0
    let ratioHeight: Double = 9.0
    
    var diagonal: Int {
        get {
            return Int((width * width + height * height).squareRoot())
        }
        set {
            let ratioDiagonal = (ratioWidth * ratioWidth + ratioHeight * ratioHeight).squareRoot()
            height = Double(newValue) * ratioHeight / ratioDiagonal
            width = height * ratioWidth / ratioHeight
        }
    }
}

var samsung = TV(width: 53.93, height: 95.87)
samsung.diagonal

samsung.diagonal = 70 // inside diagonal setter, newValue = 70
(samsung.width, samsung.height)

// static variables

struct PrinterJob {
    static var count: Int = 0
    let fileName: String
    var paperSize: String {
        didSet {
            if !printed {
                print("Info: Job `\(fileName)` has changed paper size to \(paperSize)")
            }
        }
    }
    var printMode: String {
        didSet {
            if !printed {
                print("Info: Job `\(fileName)` has changed print mode to \(printMode)")
            }
        }
    }
    
    var printed: Bool
    
    init(fileName: String, paperSize: String, printMode: String) {
        self.fileName = fileName
        self.paperSize = paperSize
        self.printMode = printMode
        self.printed = false
        PrinterJob.count += 1
    }
    
    mutating func doPrint() {
        print("Printed:", fileName, paperSize, printMode)
        PrinterJob.count -= 1
        self.printed = true
    }
}

var doc1 = PrinterJob(fileName: "conference.pdf", paperSize: "us-letter", printMode: "colored")
var doc2 = PrinterJob(fileName: "presentation.pdf", paperSize: "a4", printMode: "grayscale")

PrinterJob.count

doc1.doPrint()

PrinterJob.count

doc2.paperSize = "a3"
doc2.printMode = "colored"
doc2.doPrint()
doc2.printMode = "gray"

PrinterJob.count

// exercise

struct LightBulb {
    static let maxCurrent = 40
    var current = 0 {
        didSet {
            if current > LightBulb.maxCurrent {
                print("""
                      Current is too high,
                      falling back to previous settings.
                      """)
                current = oldValue
            }
        }
    }
}

var light = LightBulb()
light.current = 30
light.current
light.current = 50
light.current

// lazy properties (async)

struct Circle {
    lazy var pi = {
        return ((4.0 * atan(1.0 / 5.0)) - atan(1.0 / 239.0)) * 4.0
    }()
    var radius = 0.0
    var circumference: Double {
        mutating get {
            pi * radius * 2
        }
    }
    init(radius: Double) {
        self.radius = radius
    }
}

var circle = Circle(radius: 5)
circle.circumference

struct IceCream {
    let name: String = "Vanilla"
    lazy var ingredients: [String] = {
        return ["milk", "sugar", "cream", "vanilla extract"]
    }()
}

var haggendaz = IceCream()
haggendaz.ingredients
