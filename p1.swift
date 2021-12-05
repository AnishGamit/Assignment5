enum Myerror: Error{
  case negative
  
  var msg: String{
    switch self{
      case .negative: return "ERROR: Number cannot be negative"
    }
  }
}
func fun(n: Int...) throws{
  for var i in n{
    guard i>0 else{
      throw Myerror.negative
    }
    if(i%2==0){
      print("\(i) is even")
     }
     else{
      print("\(i) is odd")
    }
    mul(&i)
    print("Double of Number is \(i)")
  }
}
func mul(_ i: inout Int){
  i*=2
}
var n=10
//passing inout parameter
  print("Before Calling mul function n= \(n)")
  mul(&n)
  print("after calling mul function n= \(n)")
do{
  try fun(n: 50,20,5,7,-3,20)//pass Variadic parameter
} catch{
  if let error = error as? Myerror{
    print(error.msg)
  }
}
