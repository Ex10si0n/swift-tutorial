// assign functions to a constant or variable

var multiply = { (a: Int, b: Int) -> Int in
    return a * b
}

let add: (Int, Int) -> Int = {
    return $0 + $1
}
add(1, 1)

func operate(_ a: Int, _ b: Int, on operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}

let justPrint: () -> Void = {
    print("Hello World")
}
justPrint()

// the function `multiply` and `add` are closures (callback in JavaScript),
// which could be called as parameter of a function

operate(2, 3, on: add)

// a callback using context variables is a closure (in JavaScript)
// callback can be regarded as closure (in Swift)

var counter = 0
let count: () -> Void  = {
    counter += 1
    print(counter)
}

// which equivalent to

let _count = {
    counter += 1
    print(counter)
}

for _ in 0..<10 {
    count()
}

// create new counter with multiple closures

func countingClosure() -> () -> Int {
    var counter = 0
    let count: () -> Int = {
        counter += 1
        return counter
    }
    return count
}
let count1 = countingClosure()
let count2 = countingClosure()
count1()
count2()
count1()
count1()
count2()

// custom sorting with closures

let students = ["Jane", "King", "Freddie", "Steve"]
students.sorted(by: {
    $0.count > $1.count // 6 times comparison of 4 names
})

// forEach iterations with closures

let values = [1, 2, 3, 4, 5, 6]
values.forEach({
    print("\($0): \($0*$0)")
})

// filtering with closures
let prices = [1.5, 10, 4.99, 2.30, 8.10]
let largePrices = prices.filter({
    $0 > 5
})

// mapping with closures
let salePrices = prices.map({
    $0 * 0.9
})

let array = ["1", "2", "🐶", "4", "5", "6"]
let integers = array.compactMap({
    Int($0)
})

let nested = [["0", "1"], ["a", "b", "c"], ["🐕"]]
let flattened = nested.flatMap({ $0 })

// reduce mapping with closures
let stock = [1.5: 5, 10: 2, 4.99: 20, 2.30: 5, 8.19: 30]
let stockSum = stock.reduce(0, {
    $0 + $1.key * Double($1.value)
})

// lazy collections

let isPrime: (Int) -> Bool = {
    if $0 == 1 { return false }
    if $0 == 2 || $0 == 3 { return true }
    for i in 2...Int(Double($0).squareRoot()) {
        if $0 % i == 0 { return false }
    }
    return true
}

let primes = (1...)
    .lazy
    .filter({ isPrime($0) })
    .prefix(10)

primes.forEach({ print($0) })

// short-handed for closures

func repeatTask(times: Int, task: () -> Void) {
    for _ in 1...10 {
        task()
    }
}

var val = 0

repeatTask(times: 10) {
    val += 1
    print("Val: \(val)")
}
