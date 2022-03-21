
import SwiftUI
import AVKit

struct ListView: View {
  @EnvironmentObject var history: HistoryStore
  @State private var showHistory = false
  @State private var showSuccess = false
  @Binding var selectedTab: Int
  let index: Int
  @State private var timerDone = false
  @State private var showTimer = false
    
    @State private var state = 0
    let onColor = Color.red
    let offColor = Color.gray
    @Environment(\.presentationMode) var presentationMode
    @State private var thing = ""
    
  var body: some View {
    GeometryReader { geometry in
      VStack {
          TextField("Thing I Learned", text: $thing)
            .disableAutocorrection(true)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
          Button("Done") {
            history.addDoneExercise(thing)
          }
          
          
          
          
          Text("Todo")
            .font(.title)
            .padding()
          Form {
            ForEach(history.exerciseDays) { day in
              Section(
                header:
                  Text(day.date.formatted(as: "MMM d"))
                  .font(.headline)) {
                      
                ForEach(day.exercises, id: \.self) { exercise in
                    HStack {Text(exercise)
                    Image(systemName: "circle")
                      .foregroundColor(
                        state == 0 ? offColor : onColor)
                      .onTapGesture {
                          if (state == 1 ) {
                              state = 0
                          }
                          else {
                              state = 1
                          }
                      }
                }
                }
              }
            }
          }
      }
    }
  }
}

struct ListView_Previews: PreviewProvider {
  static var previews: some View {
      ListView(selectedTab: .constant(0), index: 0)
      .environmentObject(HistoryStore())
  }
}
