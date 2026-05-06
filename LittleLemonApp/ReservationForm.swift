import SwiftUI

struct ReservationForm: View {
    @EnvironmentObject var model: Model
    var restaurant: Restaurant
    @State var party = 1
    @State var name = ""
    @State var phone = ""
    @State var email = ""
    @State var specialRequests = ""
    @State var showFormInvalidMessage = false
    @State var errorMessage = ""

    init(_ restaurant: Restaurant) {
        self.restaurant = restaurant
    }

    func validateForm() {
        var errors: [String] = []
        if name.count < 3 || !name.allSatisfy({ $0.isLetter || $0.isWhitespace }) {
            errors.append("Names can only contain letters and must have at least 3 characters")
        }
        if phone.isEmpty {
            errors.append("The phone number cannot be blank.")
        }
        if email.isEmpty || !email.contains("@") {
            errors.append("The e-mail is invalid and cannot be blank.")
        }
        if errors.isEmpty {
            model.displayingReservationForm = true
        } else {
            errorMessage = "Found these errors in the form:\n\n" + errors.joined(separator: "\n\n")
            showFormInvalidMessage = true
        }
    }

    var body: some View {
        Form {
            Section {
                HStack {
                    VStack(alignment: .leading) {
                        Text("PARTY").bold()
                        TextField("", value: $party, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .onChange(of: party) { value in
                                if value == 0 { party = 1 }
                            }
                    }
                    Spacer()
                    DatePicker("", selection: .constant(Date()))
                        .labelsHidden()
                }
            } header: {
                Text("\(restaurant.city)\n\(restaurant.neighborhood) – \(restaurant.phone)")
            }

            Section {
                HStack {
                    Text("NAME:").bold()
                    TextField("Your name...", text: $name)
                }
                HStack {
                    Text("PHONE:").bold()
                    TextField("Your phone number...", text: $phone)
                        .keyboardType(.phonePad)
                }
                HStack {
                    Text("E-MAIL:").bold()
                    TextField("Your e-mail...", text: $email)
                        .keyboardType(.emailAddress)
                }
            }

            Section {
                TextField("add any special request (optional)", text: $specialRequests)
            }

            Section {
                Button(action: {
                    validateForm()
                }, label: {
                    Text("CONFIRM RESERVATION")
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(20)
                })
            }
        }
        .alert("ERROR", isPresented: $showFormInvalidMessage, actions: {
            Button("OK", role: .cancel) { }
        }, message: {
            Text(self.errorMessage)
        })
    }
}
