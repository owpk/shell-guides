#!groovy

// [ identifiers ]
def map = [:] // map
map."some identifier" = "ALLOWED"
map.'some-identifier' = "ALLOWED"
println map

// [ arrays ]
// all arrays are List implementations
arr = 1..10  // IntRange
arr2 = [1, 2, 3] // ArrayList
linked = [1, 2, 3] as LinkedList
println arr.class
println arr2.class
println linked.class

// add element to List
arr3 = [1, 2, 3]
arr3 << 4
println arr3

// [ strings ]
s = """
A
B
C
"""
println(s)

s = "St"
println s*2 // StSt

// triple quoted strings - series of charaters
chars = '''Hello world!'''
chars = '''Hello world!
line two
'''
string = "a"
println string.class

// [ closure ]
// closure may have 'owner' and delegate
def clousre0 = { String x, int y -> println "some valid closure ${x} : ${y}" }
clousre0 "aboba", 3

def item = 2
def closure1 = { item++ }
println  closure1() //2

closure3 = { -> ++item }
println closure3() //4
println item //4

closure4 = { x,a -> x.endsWith(a) }
println closure4("aboba", "b") //false
println closure4("aboba", "a") //true

// implicit
greeting = { "Hello $it!" } // equals { it -> "Hello $it" }
println greeting('Patric') // Hello Patric!

// var args
joins = { String... args -> args.join(' ') }
println joins("a", "b", "c") // a b c

multiConcat = { int n, String... args ->
    args.join('')*n
}
println multiConcat(2, "A", "B", "C") // ABCABC

// delegations
class Person {
    String name
    int age
    String toString() { "$name is $age years old" }

    def cl = {x -> String msg = this.toString()
            println "some variable $x"
            msg // return statement
        }

    String dump() {
        println cl // Person$closure
        cl(2) // return statement
    }

    def gOwner() {
       def wIsOwner = { getOwner() }
       def wOwner = { owner }
       def wDelegate = { {delegate}.call() }
       println "Delegate: ${wDelegate() == wDelegate }" // true
       println "This: ${this.class}"
       println "Owner of closure: ${wOwner().class}"
       println wIsOwner() == this // true
       println wOwner() == this
    }
}

def p = new Person(name:'Janice', age:74)
println p.dump()
println p.gOwner()

class Thing {
    String name
}

def p2 = new Person(name: 'Norman')



