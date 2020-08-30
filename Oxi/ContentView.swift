//
//  ContentView.swift
//  Oxi
//
//  Created by Nishan Dudakia on 06/07/2020.
//  Copyright © 2020 Oxi. All rights reserved.
//
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

let db = Firestore.firestore()

var carbonRef: Any = db.collection("Data").document("Carbon Data").setData([
    "fpA": 3.44,
    "fpB": 30,
]) { err in
    if let err = err {
        print("Error writing document: \(err)")
    } else {
        print("Document successfully written!")
    }
}

var priceRef: Any = db.collection("Data").document("Price Data").setData([
    "priceA": 3.40,
    "priceB": 16.10,
]) { err in
    if let err = err {
        print("Error writing document: \(err)")
    } else {
        print("Document successfully written!")
    }
}

func read(){
    
    let docRef = db.collection("cities").document("SF")
    
    docRef.getDocument { (document, error) in
        if let document = document, document.exists {
            let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
            print("Document data: \(dataDescription)")
        } else {
            print("Document does not exist")
        }
        
}

//let docRef = db.collection("Data").document("Carbon Data")
//
//docRef.getDocument { (document, error) -> Tuple  in
//            if let document = document, document.exists {
//                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                print("Document data: \(dataDescription)")
//            } else {
//                print("Document does not exist")
//            }
//}
    return
    
    
}


    




struct ContentView: View {
    
    
    
    // Add a new document with a generated ID
    
    // Add a new document in collection "cities"
    /* db.collection("cities").document("LA").setData([
     "name": "Los Angeles",
     "state": "CA",
     "country": "USA"
     ]) { err in
     if let err = err {
     print("Error writing document: \(err)")
     } else {
     print("Document successfully written!")
     }
     } */
    
    
    
    
    
    // Create a reference to the cities collection
    //let citiesRef = db.collection("Data").document("Carbon Data")
    //print(type(of:citiesRef))
    //print({"Data: \(citiesRef)"})
    //let query = citiesRef.whereField("fpA", isEqualTo: 3.44)
    /* db.collection("cities").whereField("capital", isEqualTo: true)
     .getDocuments() { (querySnapshot, err) in
     if let err = err {
     print("Error getting documents: \(err)")
     } else {
     for document in querySnapshot!.documents {
     print("\(document.documentID) => \(document.data())")
     }
     }
     } */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @State private var selection = 0
    
    @State private var showModalView = false
    @State var modalView = ModalView()
    @State var selectedDate = Date()
    
    @State var fpA : Float = 3.44
    @State var priceA : Float = 3.40
    @State var fpB : Float = 9.79
    @State var priceB : Float = 16.10
    
    @State var xRef : Float = 0.42
    @State var cash : Float = 325.78
    
    private var fpPerMonth : Float {
        return fpA + fpB
    }
    private var c : Int {
        return Int(fpPerMonth)
    }
    private var pricePerMonth : Float {
        return priceA + priceB
    }
    private var x : Float {
        return fpPerMonth/pricePerMonth
    }
    private var deltaX : Float {
        return xRef - x
    }
    private var deltaXFraction : Float {
        return ((xRef - x)/x)
    }
    private var oxiReward : Float {
        return 1 - deltaXFraction
    }
    
    
    
    
    static let taskDateFormat: DateFormatter =     {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var currentDate = Date()
    
    
    
    var body: some View {
        
        
        
        
        
        
        TabView(selection: $selection){
            
            
            
            
            //MARK: CHARTS VIEW
            
            //CONTENT
            VStack {
                ZStack {
                    HStack{
                        //Rectangle 58
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(#colorLiteral(red: 0, green: 0.7599997520446777, blue: 1, alpha: 1)))
                                .frame(width: 77, height: 23)
                            //Back
                            Text("Back").font(.custom("Roboto Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        }
                        .padding(.leading)
                        
                        
                        
                        
                        
                        Spacer()
                        
                        Image(systemName: "gear")
                            .font(Font.title.weight(.ultraLight))
                            .padding(.trailing)
                    }
                    
                    //OxiCard
                    Text("Charts").font(.custom("Roboto Regular", size: 24)).foregroundColor(Color(#colorLiteral(red: 0, green: 0.7599997520446777, blue: 1, alpha: 1)))
                    
                    
                }
                
                Divider()
                
                Spacer()
            }
                
                //TAB ITEM
                .tabItem {
                    VStack {
                        Image(systemName: "chart.bar")
                            .font(Font.title.weight(.ultraLight))
                    }
                    
            }
            .tag(1)
            
            // MARK: HOME VIEW
            
            //CONTENT
            
            
            VStack {
                
                
                
                ZStack {
                    Divider()
                        .background(Color(#colorLiteral(red: 0, green: 0.7599997520446777, blue: 1, alpha: 1)))
                    
                    Image("logo")
                        .resizable()
                        .frame(width: 110, height: 110)
                }
                
                HStack {
                    
                    //My carbon usage:
                    Text("My carbon usage").font(.custom("Roboto Regular", size: 14))
                        .padding(.leading)
                    
                    Spacer()
                    
                    //28th December 2020
                    Text("\(currentDate, formatter: Self.taskDateFormat)")
                        .font(.custom("Roboto Regular", size: 14))
                        .padding(.trailing)
                    
                    
                }
                
                //4 days until reset
                HStack {
                    Spacer()
                    //Text("4 ").font(.custom("Roboto Regular", size: 9)).foregroundColor(Color(#colorLiteral(red: 0, green: 0.7599997520446777, blue: 1, alpha: 1))) + Text("days until reset").font(.custom("Roboto Regular", size: 9))
                    
                    
                }
                .padding([.bottom, .trailing])
                
                
                //Rectangle 5
                ZStack {
                    RoundedRectangle(cornerRadius: 20.846559524536133)
                        .fill(Color(#colorLiteral(red: 0.8772135376930237, green: 0.8772135376930237, blue: 0.8772135376930237, alpha: 0.3)))
                        .frame(width: 250, height: 62.5)
                    
                    HStack {
                        //510Kg
                        Text(" ").font(.custom("Roboto Regular", size: 48)).foregroundColor(Color(#colorLiteral(red: 0, green: 0.7599997520446777, blue: 1, alpha: 1))) + Text("\(c)").font(.system(size: 50, weight: .light)).foregroundColor(Color(#colorLiteral(red: 0, green: 0.7599997520446777, blue: 1, alpha: 1))) + Text("Kg").font(.custom("Roboto Light", size: 36))
                        
                        
                        //(-500)
                        Text("(-500)").font(.custom("Roboto Light", size: 14)).foregroundColor(Color(#colorLiteral(red: 0, green: 1, blue: 0.16000008583068848, alpha: 1)))
                        
                        
                    }
                    
                    
                }
                
                
                Divider()
                    .padding(.top)
                
                //ACCOUNTS
                Text("ACCOUNTS").font(.custom("Roboto Regular", size: 24)).foregroundColor(Color(#colorLiteral(red: 0, green: 0.7599997520446777, blue: 1, alpha: 1))).padding(.top)
                
                HStack {
                    
                    Spacer()
                    
                    VStack {
                        //Rectangle 1
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(#colorLiteral(red: 0, green: 0.7599997520446777, blue: 1, alpha: 1)))
                                .frame(width: 77.5, height: 27)
                            //Oxi A/C
                            Text("Oxi A/C").font(.custom("Roboto Light", size: 18)).foregroundColor(Color(#colorLiteral(red: 0.987500011920929, green: 0.987500011920929, blue: 0.987500011920929, alpha: 1)))
                        }
                        
                        //Rectangle 3
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(#colorLiteral(red: 0.8772135376930237, green: 0.8772135376930237, blue: 0.8772135376930237, alpha: 0.3)))
                                .frame(width: 100, height: 100)
                            //ø22
                            VStack {
                                Text("ø").font(.custom("Roboto Regular", size: 28)).foregroundColor(Color(#colorLiteral(red: 0, green: 0.7599997520446777, blue: 1, alpha: 1))) + Text("22").font(.custom("Roboto Regular", size: 24)).foregroundColor(Color(#colorLiteral(red: 0, green: 0.7599997520446777, blue: 1, alpha: 1)))
                                //£225.63
                                Text("£225.63").font(.custom("Roboto Regular", size: 11)).foregroundColor(Color(#colorLiteral(red: 0.6875, green: 0.6875, blue: 0.6875, alpha: 1)))
                            }
                            
                            
                        }
                        .padding()
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Divider()
                        
                        
                        //Ellipse 1
                        ZStack {
                            Circle()
                                .fill(Color(#colorLiteral(red: 0, green: 0.7599997520446777, blue: 1, alpha: 1)))
                                .frame(width: 43, height: 43)
                                .offset(y: 15)
                            Image(systemName
                                :"arrow.right.arrow.left")
                                .font(Font.title.weight(.ultraLight))
                                .foregroundColor(.white)
                                .offset(y:15)
                        }
                        
                        
                    }
                    
                    Spacer()
                    
                    VStack {
                        //Rectangle 2
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(#colorLiteral(red: 0, green: 0.7599997520446777, blue: 1, alpha: 1)))
                                .frame(width: 77.5, height: 27)
                            //Cash A/C
                            Text("Cash A/C").font(.custom("Roboto Light", size: 18)).foregroundColor(Color(#colorLiteral(red: 0.987500011920929, green: 0.987500011920929, blue: 0.987500011920929, alpha: 1)))
                        }
                        
                        //Rectangle 3
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(#colorLiteral(red: 0.8772135376930237, green: 0.8772135376930237, blue: 0.8772135376930237, alpha: 0.3)))
                                .frame(width: 100, height: 100)
                            
                            //£323.64
                            //Text("£(cash, specifier: "")").font(.custom("Roboto Regular", size: 24)).foregroundColor(Color(#colorLiteral(red: 0, green: 0.7599997520446777, blue: 1, alpha: 1)))
                        }
                        .padding()
                        
                    }
                    
                    Spacer()
                    
                }
                
                //Rectangle 40
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(#colorLiteral(red: 0, green: 0.7599997520446777, blue: 1, alpha: 1)))
                        .frame(width: 294, height: 59)
                        .padding()
                    
                    //Pay with OxiPay
                    Text("Pay with OxiPay").font(.custom("Roboto Light", size: 18)).foregroundColor(Color(#colorLiteral(red: 0.987500011920929, green: 0.987500011920929, blue: 0.987500011920929, alpha: 1)))
                    
                }
                
                
                Spacer()
                
            }
                
                //TAB ITEM
                .tabItem {
                    VStack {
                        Image(systemName:"house")
                            .font(Font.title.weight(.ultraLight))
                    }
            }
            .tag(0)
            
            
            // MARK: CARD VIEW
            
            VStack {
                
                VStack {
                    
                    ZStack {
                        HStack{
                            //Rectangle 58
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(#colorLiteral(red: 0, green: 0.7599997520446777, blue: 1, alpha: 1)))
                                    .frame(width: 77, height: 23)
                                //Back
                                Text("Back").font(.custom("Roboto Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            }
                            .padding(.leading)
                            
                            
                            
                            
                            
                            Spacer()
                            
                            Image(systemName: "gear")
                                .font(Font.title.weight(.ultraLight))
                                .padding(.trailing)
                        }
                        
                        //OxiCard
                        Text("OxiCard").font(.custom("Roboto Regular", size: 24)).foregroundColor(Color(#colorLiteral(red: 0, green: 0.7599997520446777, blue: 1, alpha: 1)))
                    }
                    
                    Divider()
                    
                    //Rectangle 57
                    ZStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(#colorLiteral(red: 0.8772135376930237, green: 0.8772135376930237, blue: 0.8772135376930237, alpha: 0.33)))
                            
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(Color(#colorLiteral(red: 0.6875, green: 0.6875, blue: 0.6875, alpha: 1)), lineWidth: 0.5)
                        }
                        .frame(width: 355, height: 201)
                        .padding(.vertical)
                    }
                    
                    //Cash A/C Balance:
                    HStack {
                        Text("Cash A/C Balance:").font(.custom("Roboto Regular", size: 24)).multilineTextAlignment(.center)
                            .padding(.leading)
                        Spacer()
                        //£323.64
                        Text("£323.64").font(.custom("Roboto Regular", size: 24)).foregroundColor(Color(#colorLiteral(red: 0, green: 0.7599997520446777, blue: 1, alpha: 1))).multilineTextAlignment(.center)
                            .padding(.trailing)
                    }
                    
                    
                    Divider()
                    
                    
                    
                }
                
                Button("button"){
                    self.showModalView.toggle()
                }
                .sheet(isPresented: self.$showModalView) {
                    ModalView()}
                
                Text("\(selectedDate)")
                
                
                
                Spacer()
                
            }
                
                //TAB ITEM
                .tabItem {
                    VStack {
                        Image(systemName: "creditcard")
                            .font(Font.title.weight(.ultraLight))
                    }
            }
            .tag(2)
        }
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
