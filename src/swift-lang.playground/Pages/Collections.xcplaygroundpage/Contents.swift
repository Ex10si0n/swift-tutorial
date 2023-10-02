// collections
var zeros5 = Array(repeating: 0, count: 5)
zeros5.isEmpty
zeros5.count
zeros5.forEach { elm in
    // do something
}
let sliced = zeros5[2...4]
sliced // cannot call sliced[0] due to ArraySlice
Array(sliced)[0]

zeros5.append(1)
zeros5.contains([1, 0])
zeros5.contains([0, 1])
zeros5.firstIndex(of: 0)

var animals = ["🐱", "🐶"]
animals.append("🐵")
animals += ["🐷"]
animals.insert("🐰", at: 0)
animals.remove(at: 0)
animals.popLast()
animals

var names = ["Steve", "Alice", "Bob"]
names.sorted()
names
names.sort()
names

var nameList: String = ""
for (index, name) in names.enumerated() {
    nameList += "\(index + 1): \(name)\n"
}

var str2emoji = ["cat": "🐱", "dog": "🐶", "doggieCat": "🐕"]
str2emoji["doggieCat"]
str2emoji["cattieDog"] = "🐈"
str2emoji

var numberSet = Set([2, 3, 4])
let quote = "the quick brown fox jumps over the lazy dog"
var strSet = Set(quote)
strSet.remove(" ")
strSet.count
