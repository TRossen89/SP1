
// Declaring a BookingSystem; 
BookingSystem a_booking_system; 





void setup() {
  
  size(700, 700);
  background(150);

  
  // Instantiating a BookingSystem/Creating a BookingSystem object
  a_booking_system = new BookingSystem();


}


void draw() {
  
  // Displaying theater (the method has an if statement making sure the theater only displays if disp_theater = true) 
  a_booking_system.display_theater();  
  
  // Displaying posters (the method has an if statement making sure the posters only displays if disp_theater = false)
  a_booking_system.display_posters();


  



}



// Methods that should be triggered/called if mouse is pressed
void mousePressed() {
  
  // If the mouse is hovering over a "Book Tickets"-button and the moused is pressed the "screen" with the theaters will be displayed
  a_booking_system.book_tickes_button();
  
  
  // Seat/square that the mouse is hovering over is selected (colored) if mouse is pressed
  a_booking_system.seat_selecter();
  
  // If the mouse is hovering over back button and the moused is pressed the "screen" with the posters and "Book Tickets"-buttons will be displayed
  a_booking_system.back_button();
  

}
