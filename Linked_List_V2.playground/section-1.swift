// Playground - noun: a place where people can play

import Cocoa

class Element<T> {
    var Data: T;
    
    init(data: T) {
        Data = data;
    }
}

class LinkedList<T> {
    
    private var size: Int = 0
    
    func Add<T>(item: T) {
        self.size += 1
    }
    
    func Delete(item: T) {
        
    }
    
    func Find<T>(item: T) {
        
    }
    
    func Size() -> Int {
        return self.size;
    }
}

// TC1: New list with 1 Item returns size 1
let list = LinkedList<String>();
list.Add("Hello World")
assert(list.Size() == 1);