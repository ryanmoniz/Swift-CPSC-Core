//
//  main.swift
//  LinkedLists
//
//  Created by Ryan Moniz on 2015-07-18.
//  Copyright © 2015 ryanmoniz. All rights reserved.
//

import Foundation

//A linked list is a basic data structure that provides a way to associate related content

//Singlely linked list using Generics

class SLLNode <T> {
    var key: T?
    var next: SLLNode<T>?
    
    init() {
        key = nil
        next = nil
    }
}

//Doubly Linked List using Generics

class DLLNode <T> {
    var key: T?
    var next: DLLNode<T>?
    var previous: DLLNode<T>?
    
    init() {
        key = nil
        next = nil
        previous = nil
    }
}


public class LinkedList<T: Equatable> {
    //create a doubly linked list
    private var head : DLLNode<T> = DLLNode<T>()
    
    //append new items to linked list
    func addItem(key: T) {
        //establish head
        if head.key == nil {
            head.key = key
            return
        }
        
        //append
        var current: DLLNode? = head
        
        while current != nil {
            if current?.next == nil {
                let child : DLLNode = DLLNode<T>()
                
                child.key = key
                child.previous = current
                current?.next = child
                break
            }
        } //end while
        
        current = current?.next
    } //end while
}

