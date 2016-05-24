//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



/***** Function Type *****/
func addVAT(source: Double) -> Double {
    return source * 1.1
}

func couponDiscount(source: Double) -> Double {
    return source * 0.9
}

var additional: (Double) -> Double

let transaction1 = 120.7
additional = addVAT

let price1 = additional(transaction1)

func finalPrice(source: Double, additional: (Double) -> (Double)) -> Double {
    let price = additional(source)
    return price
}

let price2 = finalPrice(350.0, additional: couponDiscount)



/***** Closure *****/
let addVATClosure = { (source: Double) -> Double in
    return source * 1.1
}

let couponeDiscount = { (source: Double) -> Double in
    return source * 0.9
}

let price3 = addVATClosure(157.6)



/***** Closure 축약 *****/
let addVATClosure2 = { source in
    return source * 1.1
}

let addVATClosure3 = { source in
    source * 1.1
}

let addVATClosure4 = {
    $0 * 1.1
}

let couponeDiscount2 = { source in
    return source * 0.9
}

let couponeDiscount3 = { source in
    source * 0.9
}

let couponeDiscount4 = {
    $0 * 0.9
}

let price4 = addVATClosure2(157.6)
let price5 = couponeDiscount4(200.0)



/***** Curring, 함수를 반환하는 함수 *****/
func makeAdder(x: Int) -> (Int) -> Int {
    func adder(a: Int) -> Int  {
        return x + a
    }
    
    return adder
}

func makeAdder2(x: Int) -> (Int) -> Int {
    let adder: (Int) -> Int = {
        return $0 + x
    }
    
    return adder
}

func makeAdder3(x: Int) -> (Int) -> Int {
    return {
        return $0 + x
    }
}

let add5 = makeAdder(5)
let add10 = makeAdder(10)

print(add5(2))
print(add10(2))

print(makeAdder3(5)(2))



/***** Map *****/
let transactions = [560.0, 321.5, 190.0, 672.8, 1190.0, 450.0]
func addVATToArr(source: Double) -> Double {
    return source * 1.1
}

var vatPrices: [Double] = []

for transaction in transactions {
    vatPrices += [addVATToArr(transaction)]
}

let vatMapPrices = transactions.map({ transaction -> Double in
    return transaction * 1.1
})

let vatMapPrices2 = transactions.map({
    $0 * 1.1
})



/***** Filter *****/
var bigTransactions: [Double] = []

for price in vatPrices {
    if price >= 500 {
        bigTransactions += [price]
    }
}

let bigFilterTransactions = vatPrices.filter { $0 >= 500 }

var meetingRooms: [String : Int] = ["Banksy" : 4, "Rivera" : 8, "Kahlo" : 8, "Picasso" : 10, "Cezanne" : 20, "Matisse" : 30]

let members = 9
let available = meetingRooms.filter { $0.1 >= members }

// print("\(available["Picasso"])")
print("\(available[1])")



/***** Sort *****/
func ascendantSort (sort1: Double, sort2: Double) -> Bool {
    return sort1 > sort2
}

let sortedPrice = vatPrices.sort(ascendantSort)
let sortedPrice2 = vatPrices.sort({ sort1, sort2 in
    return sort1 > sort2
})
let sortedPrice3 = vatPrices.sort({ $0 > $1 })
let sortedPrice4 = vatPrices.sort(>)

let sortedMeetingsRooms = meetingRooms.sort({ $0.1 > $1.1 })
print("\(sortedMeetingsRooms)")



/***** Reduce *****/
func priceSum (base: Double, adder: Double) -> Double {
    return base + adder
}

var sum: Double = 0.0
for price in vatPrices {
    sum = priceSum(sum, adder: price)
}
print("\(sum)")

var sum2: Double = 0.0
let sumReduce = vatPrices.reduce(sum2, combine: priceSum)
let sumReduce2 = vatPrices.reduce(0.0, combine: { base, adder in
    base + adder
})
let sumReduce3 = vatPrices.reduce(0.0, combine: +)

let priceIntString = vatPrices.reduce("", combine: { $0 + "\($1)\n" })
print(priceIntString)


let descriptionString = meetingRooms.reduce("We have meeting rooms : \n", combine: { $0 + "\($1.0) for \($1.1) person.\n" })

