import SwiftUI

struct HistoryView: View {
  @Binding var showHistory: Bool
  @EnvironmentObject var history: HistoryStore

  var body: some View {
    ZStack(alignment: .topTrailing) {
      // swiftlint:disable:next multiple_closures_with_trailing_closure
      VStack {
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
                Text(exercise)
              }
            }
          }
        }
      }
    }
  }
}

struct HistoryView_Previews: PreviewProvider {
  static var previews: some View {
    HistoryView(showHistory: .constant(true))
      .environmentObject(HistoryStore())
  }
}
