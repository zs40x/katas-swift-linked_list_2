// Playground - noun: a place where people can play

import Cocoa

class Element<T: Equatable> {
    var Item: T? = nil
    
    var Next: Element<T>? = nil
    var Previous: Element<T>? = nil
    
    init(item: T) {
        self.Item = item
    }
}

class LinkedList<T: Equatable>  {
    
    private var firstNode: Element<T>? = nil
    private var lastNode: Element<T>? = nil
    var Count: Int = 0
    
    func Add(item: T) {
        
        if( firstNode == nil ) {
            firstNode = Element(item: item)
            lastNode = firstNode
        }
        else {
            self.lastNode?.Next = Element(item: item)
            self.lastNode?.Next?.Previous = self.lastNode?
            self.lastNode = self.lastNode?.Next
        }
        
        self.updateCount()
    }
    
    func Append(values: T...) {
        for value in values {
            self.Add(value)
        }
    }
    
    func Remove(item: T) {
        var currentNode: Element<T>? = self.firstNode
        
        while( currentNode != nil ) {
            var currentItem: T = currentNode!.Item!
            
            if(currentItem == item) {
                if( currentNode?.Previous? == nil ) {
                    self.firstNode = currentNode?.Next
                    self.firstNode?.Previous = nil
                }
                else {
                    currentNode?.Previous?.Next = currentNode?.Next
                    currentNode?.Next?.Previous = currentNode?.Previous
                }
            }
            
            currentNode = currentNode?.Next
        }
        
        self.updateCount()
    }
    
    private func updateCount() {
        var counter: Int = 0
        var currentNode: Element<T>? = firstNode
        
        while( currentNode != nil ) {
            counter++
            currentNode = currentNode?.Next
        }
        
        self.Count = counter
    }
    
    func getIterator() -> LinkedListIterator<T> {
        return LinkedListIterator(lnkedList: self)
    }
}

class LinkedListIterator<T: Equatable> {
    
    var linkedList: LinkedList<T>?
    var currentNode: Element<T>?
    
    init(lnkedList: LinkedList<T>) {
        self.linkedList = lnkedList
        self.currentNode = lnkedList.firstNode!
    }
    
    func hasNext() -> Bool {
        if( currentNode != nil ) {
            return true
        }
        
        return false
    }
    
    func getNext() -> T {
        var itemToReturn: T? = currentNode?.Item
        currentNode = currentNode?.Next
        return itemToReturn!
    }
}


var testLinkedList = LinkedList<String>()
testLinkedList.Add("Foo")
testLinkedList.Add("Bar")
testLinkedList.Append("Marmelade", "Nutella", "Wurst")
testLinkedList.Count

testLinkedList.Remove("Bar")
testLinkedList.Remove("Foo")
testLinkedList.Remove("Wurst")
testLinkedList.Count

var iterator = testLinkedList.getIterator()

while( iterator.hasNext() ) {
    println(iterator.getNext())
}


