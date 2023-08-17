import SwiftUI

struct ContentView: View {
    @AppStorage("FIRST_TERM") private var first : String = ""
    @AppStorage("SECOND_TERM") private var second : String = ""
    @AppStorage("THIRD_TERM") private var third : String = ""
    
    @State private var x1 : String = ""
    @State private var x2 : String = ""
    
    var body: some View {
        VStack {
            Text("Quadratic Solver").font(.largeTitle).padding(5)
            
            Text("The quadratic form is : ").padding(5)
            Image("quadraticForm")
                .resizable()
                .scaledToFit()
            
            VStack {
                Label("Enter the first term", systemImage: "a.circle.fill").padding(26).font(.title)
                TextField("", text: $first).textFieldStyle(.roundedBorder).border(Color.black)
                
                Label("Enter the second term", systemImage: "b.circle.fill").padding(26).font(.title)
                TextField("", text: $second).textFieldStyle(.roundedBorder).border(Color.black)
                
                Label("Enter the third term", systemImage: "c.circle.fill").padding(26).font(.title)
                TextField("", text: $third).textFieldStyle(.roundedBorder).border(Color.black)
            }
                
                Button {
                    guard let a = Double(first) , let b = Double(second), let c = Double(third)
                    else {
                        print("Invalid Input")
                        return
                    }
                    
                    solveForX(a:a , b: b, c: c)
                    
                }label: {
                    Text("Solve for x").font(.title2)
                }.padding()
                
                HStack {
                    Text("x1 = \(x1)").font(.title)
                    Text("x2 = \(x2)").font(.title)
                }
                
            Spacer()
            
        }.padding()
        
    }
    
    func solveForX(a:Double, b:Double, c:Double) {

        let firstTerm = a
        let secondTerm = b
        let thridTerm = c

        let bSquared = secondTerm * secondTerm
        let discriminant = bSquared - (4 * firstTerm * thridTerm)
        let discrimimantAbsSqrt = sqrt(fabs(discriminant))
                
        let topFormula1 = -secondTerm + discrimimantAbsSqrt
        let topFormula2 = -secondTerm - discrimimantAbsSqrt
                
        let bottomFormula = 2 * firstTerm
                
        let totalX1 = topFormula1 / bottomFormula
        let totalX2 = topFormula2 / bottomFormula
                
        x1 = String(format: "%.2f", totalX1)
        x2 = String(format: "%.2f", totalX2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

