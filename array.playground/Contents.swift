//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
//
//var da:[[Int]] = [[2,954,67,78],[34,6,68,46],[65,868,75,879],[9879,8675,3446,8699]];
//
//for i in 0...da.count - 1 {
//    da[i].sort()
//    print(da[i])
//}
//
//for i in 0...da.count - 1 {
//    for j in 0...da[i].count - 1 {
//        if ( j+1 < da[i].count && da[i][j] > da[i][j+1]) {
//            
//        }
//    }
//}
//
//func sortD(array:[Int]) {
//    for i in 0...array.count {
//        for j in 0...array.count {
//            
//        }
//    }
//}
//
//extension Array {
//    
//    func groupBy<G: Hashable>(groupClosure: (Element) -> G) -> [[Element]] {
//        var groups = [[Element]]()
//        
//        for element in self {
//            let key = groupClosure(element)
//            var active = Int()
//            var isNewGroup = true
//            var array = [Element]()
//            
//            for (index, group) in groups.enumerate() {
//                let firstKey = groupClosure(group[0])
//                if firstKey == key {
//                    array = group
//                    active = index
//                    isNewGroup = false
//                    break
//                }
//            }
//            
//            array.append(element)
//            
//            if isNewGroup {
//                groups.append(array)
//            } else {
//                groups.removeAtIndex(active)
//                groups.insert(array, atIndex: active)
//            }
//        }
//        
//        return groups
//    }
//}
//
////Usage
//struct User { var age = 0 }
//let users: [User] = [User(age: 2), User(age: 4), User(age: 5), User(age: 5), User(age: 2)]
//let groupedUser = users.groupBy { $0.age }
//print(groupedUser)

let top = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 150))
let containerViewOfOffrer = UIView(frame:CGRect(x: 0, y: 0, width: top.frame.size.width, height: 60));
containerViewOfOffrer.backgroundColor = UIColor.blue
top.addSubview(containerViewOfOffrer);
let target:[String] = ["<html><><span>5% CASHBACK \n ON AXIS BANK</span></body></html>","10% CASHBACK ON \n FREECHARGE WALLET"];

let eachViewWidth = top.frame.size.width/CGFloat(target.count) - CGFloat(target.count - 1)/CGFloat(target.count)

var x:CGFloat = 0;

for (index,item) in target.enumerated() {
    
    let offerView = UIView(frame: CGRect(x: x, y: 0, width: eachViewWidth, height: 60))
    offerView.backgroundColor = UIColor.red

    containerViewOfOffrer.addSubview(offerView)

    let labelText = UITextView(frame: CGRect(x: 8, y: 0, width: eachViewWidth - 16, height: 60));
    labelText.text = item;
    labelText.textAlignment = .center;
    labelText.font = UIFont.systemFont(ofSize: 11)
    
    offerView.addSubview(labelText)
    
    if index != target.count - 1 {
        let separatorView = UIView(frame: CGRect(x: x + eachViewWidth, y: 0, width: 1, height: 60))
        separatorView.backgroundColor = UIColor.white
        
        containerViewOfOffrer.addSubview(separatorView)
        
        x = x + 1
    }
    
    x = x + eachViewWidth
    
}

let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width:320, height: 44));

let leftFlexiButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target:nil , action: nil)
leftFlexiButton.width = -15

let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target:nil , action: nil)

let flexiButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target:nil , action: nil)
flexiButton.width = 10
let cancleButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target:nil , action:nil)

let rightFlexiButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target:nil , action: nil)
rightFlexiButton.width = -10000

toolBar.items = [flexiButton,cancleButton,flexiButton,flexiButton,flexiButton,flexiButton,doneButton,flexiButton];

toolBar


