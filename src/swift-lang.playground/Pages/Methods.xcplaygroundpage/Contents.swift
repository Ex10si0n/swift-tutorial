import Foundation

// methods

let months =  ["January", "February", "March",
               "April", "May", "June",
               "July", "August", "September",
               "October", "November", "December"]

struct SimpleDate {
    var month: String = "January"
    var day: Int = 1
    
    func monthsUntilWinterBreak() -> Int {
        months.firstIndex(of: "December")! - months.firstIndex(of: month)!
    }
    mutating func advance() {
        let monthIndex = months.firstIndex(of: month)!
        let daysInMonth = getDaysInMonth(monthIndex: monthIndex)
        if day == daysInMonth {
            day = 1
            if monthIndex == 11 {
                month = months[0]
            } else {
                month = months[monthIndex + 1]
            }
        } else {
            day += 1
        }
    }
    
    private func getDaysInMonth(monthIndex: Int) -> Int {
        switch monthIndex {
        case 1:
            if isLeapYear() {
                return 29
            } else {
                return 28
            }
        case 3, 5, 8, 10:
            return 30
        default:
            return 31
        }
    }
    
    private func isLeapYear() -> Bool {
        let year = Calendar.current.component(.year, from: Date())
        if year % 4 != 0 {
            return false
        } else if year % 400 == 0 {
            return true
        } else if year % 100 == 0 {
            return false
        } else {
            return true
        }
    }
}

extension SimpleDate {
    init(month: Int, day: Int) {
        self.month = months[month-1]
        self.day = day
    }
}

let valentinesDay = SimpleDate(month: "February", day: 14)

valentinesDay.monthsUntilWinterBreak()

var arbitaryDate = SimpleDate()
arbitaryDate.month
arbitaryDate.day
arbitaryDate.advance()
arbitaryDate.day

let birthDay = SimpleDate(month: 1, day: 12)
birthDay.month
birthDay.day

var dec31 = SimpleDate(month: 12, day: 31)
dec31.advance()
dec31.month
dec31.day


// extensions

struct Math {
    static func factorial(of number: Int) -> Int {
        (1...number).reduce(1, *)
    }
}

Math.factorial(of: 6)

extension Math {
    static func primeFactors(of value: Int) -> [Int] {
        var remainingValue = value
        var testFactor = 2
        var primes: [Int] = []
        while testFactor * testFactor <= remainingValue {
            if remainingValue % testFactor == 0 {
                primes.append(testFactor)
                remainingValue /= testFactor
            }
            else {
                testFactor += 1
            }
        }
        if remainingValue > 1 {
            primes.append(remainingValue)
        }
        return primes
    }
}

Math.primeFactors(of: Math.factorial(of: 6))
