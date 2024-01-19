import UIKit

// 모델링
// DTO
class Book {
    var title: String
    var price: Int
    var publisher: String
    var author: String
    var webSite: String?
    
    init (title: String, price: Int, publisher: String, author: String) {
        self.title = title
        self.price = price
        self.publisher = publisher
        self.author = author
    }
    
}

var bible = Book(title: "god", price: 23000, publisher: "idontknow", author: "fifi")

print(bible.webSite)


class Movie {
    var title: String
    var director: String?
    
    init (title: String, director: String = "Unknown") {
        self.title = title
    }
}

var newMovie = Movie(title: "Get Out")
print(newMovie.director)


class Manager {
    var name: String
    var age: Int
    var address: String?
    var major: String?
    
    init(name: String, age: Int, address: String? = "None", major: String = "None") {
        self.name = name
        self.age = age
    }
}

var newManager = Manager(name: "Mike", age: 30)
print(newManager.name, newManager.major)
