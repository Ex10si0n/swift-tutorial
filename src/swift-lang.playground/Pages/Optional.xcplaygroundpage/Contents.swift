// optional and force unwrapping
var optString: String?
let parsedIntFailed: Int? = Int("dog")
var parsedIntSucess: Int? = Int("30")
if optString != nil { "String: \(optString!)" } else { "String is empty" }

// optional binding
var optStringA: String?
var optStringB: String? = "hello"
if let stringA = optStringA { "failed" }
if let stringB = optStringB { "success" }
if optString != nil { optString = nil } else { optString = "hello" }

// optional guard
func tryLogin(username: String?) -> String {
    guard let loggedInUsername = username else {
        return "User not registered"
    }
    return "Welcome back \(loggedInUsername)"
}
tryLogin(username: "Steve")
tryLogin(username: nil)

// nil coalescing
var optInt: Int? = nil
var mustHaveResult = optInt ?? 0
