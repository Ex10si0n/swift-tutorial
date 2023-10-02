import Foundation

// functions
func power(x: Int) -> Int {
    if x == 1 { return 1 }
    else { return x * power(x: x - 1) }
}
power(x: 6)

// external and internal names
func exponent(_ x: Double, by y: Double) -> Double {
    return pow(x, y)
}
exponent(2, by: 31)

// closure, same outcome as function

let MSEloss: ([Double], [Double]) -> Double = { y_pred, y_true in
    let n = y_pred.count
    var sum = 0.0
    for i in 0..<n {
        sum += pow(y_pred[i] - y_true[i], 2)
    }
    return sum / Double(n)
}

//func MSEloss(y_pred: [Double], y_true: [Double]) -> Double {
//    let n = y_pred.count
//    var sum = 0.0
//    for i in 0..<n {
//        sum += pow(y_pred[i] - y_true[i], 2)
//    }
//    return sum / Double(n)
//}


func trainNN(X: [Double], y: [Double], loss: ([Double], [Double]) -> Double, epoch: Int) -> Double {
    var weight: Double = 0.0
    
    let model: (Double) -> Double = { x in
        return weight * x
    }
    
    for _ in 0...epoch {
        let y_pred = X.map(model)
        let currentLoss = loss(y_pred, y)
        for i in 0..<X.count {
            let x = X[i]
            let y_pred = model(x)
            let dLdy = y_pred - y[i]
            let dLdx = dLdy * 2
            let lr: Double = 0.01
            weight -= lr * dLdx
        }
        currentLoss
    }
    let resLoss: Double = loss(X.map(model), y)
    return resLoss
}

trainNN(X: [1.0, 2.0, 3.0], y: [2.0, 3.0, 4.0], loss: MSEloss, epoch: 40)
