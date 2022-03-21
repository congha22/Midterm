import SwiftUI

struct ListView: View {
  @EnvironmentObject var history: HistoryStore
  @State private var state = 0
  let onColor = Color.red
  let offColor = Color.gray
  @State private var thing = ""

  var body: some View {
    GeometryReader { geometry in
      VStack {
        TextField("Add new!!!", text: $thing)
          .disableAutocorrection(true)
          .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
        Button("Add Reminder") {
          history.addDoneExercise(thing)
        }

        Text("To-do List")
          .font(.title).padding()
        Form {
          ForEach(history.exerciseDays) { day in
            Section(
              header:
                Text(day.date.formatted(as: "MMM dd"))
                .font(.headline)
            ) {

              ForEach(day.exercises, id: \.self) { exercise in
                HStack {
                  Image(systemName: "circle")
                    .foregroundColor(
                      state == 0 ? offColor : onColor
                    )
                    .onTapGesture {
                      if state == 0 { state = 1 } else { state = 0 }
                    }
                  Text(exercise)
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
    ListView()
      .environmentObject(HistoryStore())
  }
}
