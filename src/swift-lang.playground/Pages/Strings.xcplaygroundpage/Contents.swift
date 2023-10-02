let myString = "Steve"
for char in myString {
    print(char)
}
myString.count

// error at myString[3], why? -> grapheme clusters

"👍🏽".count
"👍\u{1f3fd}".count

"café".unicodeScalars.count
"cafe\u{0301}".unicodeScalars.count

for code in "cafe\u{0301}".unicodeScalars {
    // print decimal values
    print(code.value)
}

// how to indexing
let begin = myString.startIndex
let charE = myString.firstIndex(of: "e")
myString[charE!]

let lhs = "é"
let rhs = "e\u{0301}"
let eq = lhs == rhs

// raw string
let raw = #"Raw "No Escaping" \(no interpolation!). ### Use all the \ you want!"#
let name = "Steve"
let template = #"My name is \#(name)"#

let multiLineRaw = #"""
 ______     ______   ______     __   __   ______
/\  ___\   /\__  _\ /\  ___\   /\ \ / /  /\  ___\
\ \___  \  \/_/\ \/ \ \  __\   \ \ \'/   \ \  __\
 \/\_____\    \ \_\  \ \_____\  \ \__|    \ \_____\
  \/_____/     \/_/   \/_____/   \/_/      \/_____/
                                                    
"""#

print(multiLineRaw)

// splitting
let email = "me@aspires.cc"
var extractedName: Substring?
var domain: Substring?

if let index = email.firstIndex(of: "@") {
    extractedName = email[..<index]
}

if let index = email.firstIndex(of: "@") {
    let startIndex = email.index(index, offsetBy: 1)
    domain = email[startIndex...]
}

extractedName
domain

// +: ASCII unicode: 1 code unit
// ½: 2 code units
// ⇨: 3 code units
// 🙃: 4 code units
let characters = "+ \u{00bd} \u{21e8} \u{1f643}"
for i in characters.utf8 {
    if i == 32 {
        print()
        continue
    }
    print("\(i) : \(String(i, radix: 2))")
}

// word count example
let lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vel diam erat. Maecenas accumsan efficitur urna a rhoncus. Aenean vestibulum nunc vestibulum nulla aliquet, vitae scelerisque ex placerat. Nam nec egestas ante. Cras ut tortor in tellus blandit condimentum. Sed venenatis pharetra luctus. Praesent tortor orci, aliquam et lorem vel."

var wordCount = 0
var afterSpace = true
for char in lorem {
    if char.isWhitespace || char.isNewline || char.isPunctuation {
        // count whitespaces segments
        if !afterSpace { wordCount += 1 }
        afterSpace = true
    } else {
        afterSpace = false
    }
}
if !afterSpace {
    wordCount += 1
}
wordCount

// name formatter
let fullName = "Yan, Steve"
func formatName(_ name: String) -> String? {
    if name.filter({ $0 == "," }).count != 1 {
        return nil
    }
    if let commaIndex = name.firstIndex(of: ",") {
        let startIndex = name.index(commaIndex, offsetBy: 1)
        return String(name[startIndex...]) + " " + String(name[..<commaIndex])
    } else {
        return nil
    }
}
formatName(fullName)
