// Each device (e.g. a gate) has a certain number of actions associated to them
// Each action has a "type," this type tells the app the functionality offered to the user
// For example, a residential gate can only "open" (ActionType.on) usually
// a house gate, however, can be "open and closed" (ActionType.onAndOff)
enum ActionType {
  on,
  onAndOff,
}
