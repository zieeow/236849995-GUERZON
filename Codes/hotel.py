class HotelReservation:
  reserved_rooms = {'R104', 'R108', 'R111', 'R113', 'R117'}
  total_rooms = {f'R{i}' for i in range(101, 121)}

  def int(self):
    self.name = None
    self.address = None
    self.phone_number = None
    self.room_number = None
    self.check_in_date = None
    self.num_days_staying = None

  def get_input(self, prompt, data_type, condition):
    try:
      user_input = data_type(input(prompt))
      if condition(user_input):
        return user_input
      else:
        print("Invalid input. Please try again.")
        return self.get_input(prompt, data_type, condition)
    except ValueError:
      print("Invalid input. Please enter a valid value.")
      return self.get_input(prompt, data_type, condition)

  def reserve_room(self):
    print("───⋆⋅☆⋅⋆──Welcome to the Puff Hotel───⋆⋅☆⋅⋆──")
    print("[Rooms R104, R108, R111, R113, and R117 are reserved.]")

    self.name = input("✧Please enter your name: ")
    self.address = input("✧Please enter your address: ")
    self.phone_number = input("✧Please enter your phone number: ")

    room_condition = lambda x: x not in self.reserved_rooms and x in self.total_rooms
    self.room_number = self.get_input(
        "✧Please enter your room number (Format: R101 to R120): ", str,
        room_condition)

    check_in_condition = lambda x: True
    self.check_in_date = self.get_input(
        "✧Please enter your date of check-in: ", str, check_in_condition)

    num_days_condition = lambda x: 1 <= x <= 100 and isinstance(x, int)
    self.num_days_staying = self.get_input(
        "✧Please enter how many days you will be staying (Format: 1 to 100): ",
        int, num_days_condition)

  def display_confirmation(self):
    print(
        "\n Puff Hotel Reservation Ticket \n Your reservation has been processed!"
    )
    print(f"Name: {self.name}")
    print(f"Room Number: {self.room_number}")
    print(f"Date of Check-in: {self.check_in_date}")
    print(f"Days Staying: {self.num_days_staying} days")


if __name__ == "__main__":
  reservation = HotelReservation()

  try:
    reservation.reserve_room()
    reservation.display_confirmation()
  except Exception as e:
    print(f"Error: {e}")
