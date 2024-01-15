import UIKit

// 1. 구구단: 나
let range = 1...9

for i in range {
    if i == 1 {
        continue
    }
    
    for j in range  {
        print("\(i) * \(j) = \(i*j)")
    }
    print("------------")
}

// 1-1. 구구단: 예제
for i in 2...9 {
    for j in 1...9 {
        print("\(i) * \(j) = \(i*j)")
    }
}


// 2. 배수 출력하기: 나
for i in 1...100 where i % 3 == 0 {
    print("3의 배수 발견: \(i)")
}

for i in stride(from: 0, through: 100, by: 3) {
    if i == 0 {
        continue
    }
    print(i)
}

// 2-1. 배수 출력하기: 예제
for i in 1...100 {
    if (i % 3 == 0) {
        print("3의 배수 발견: \(i)")
    }
}

for i in 1...100 {
    if i % 3 != 0 {
        continue
    }
    print("3의 배수 발견: \(i)")
}

// 3. 논리 구성: 나
for i in 1...5 {
    for j in 1...5 {
        if j <= i {
            print("🩷", terminator: "")
        }
    }
    print() // print("\n")
}

