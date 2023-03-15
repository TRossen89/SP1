// Class from where you can instantiate a BookingSystem object


class BookingSystem {
  
//////////////////////////////////////////////////////////////////////////////////////////
//----Fields/instansvariable of Bookingsystem---- //

  
  
 ////////////////////////////////////////////////////////////////
 //-- Variables for theater
  
  
  //- Collumns and rows of seats in theater
  int collumns = 20;
  int rows = 15;
    
  //- Size and color of squares representing seats in theater 
  int square_size = 20;
  color colorOfsquare = color(255, 255, 255);
  
  //- Double Array representing the status of the seats: 'Booked' or 'Not booked'
  boolean[][] seats = new boolean[collumns][rows];
  
  boolean seat_selected = false; 
  
  
 //////////////////////////////////////////////////////////////// 
 //-- Variables for Posters and "Book Tickets"-buttons
 
  //- Collumns and rows of posters and buttons
  int poster_collumns = 3;
  int poster_rows = 2;
  
  
  //POSTERS------------------------------
  
  //- ???
  int number_of_posters_in_row = 3;
  int number_of_rows = 2;
  
  
  //- Size of posters
  float poster_size_x = width*.2;
  float poster_size_y = width*.3;
  
  
  
  //- Padding in screen with posters (this is to put the 6 posters in the x-center of the screen)  
  float padding = (width % (number_of_posters_in_row*poster_size_x)) / (number_of_posters_in_row+1);
  
  //- Space between posters
  float spacing_between_posters = height*.1; 
  
  
  
  //BUTTONS------------------------------
  
  //- Size of buttons
  float book_tickets_btn_x = poster_size_x;
  float book_tickets_btn_y = spacing_between_posters *.4;
  
  
  //- Double Array with boolean variables representing the status of "Book Tickets"-buttons: 'Pressed' or 'Not pressed'
  boolean [][] book_tickets_btns = new boolean[poster_collumns][poster_rows];
 
  //- Color of "Book Tickets"-buttons 
  color color_of_book_tickets_text = color(230);
  
  
 



  ///////////////////////////////////////////////////////////////////////
  //-- Variables deciding which "screen" to display: Posters and "Book Tickets"-buttons or Theater 
  
   
  
  //- Number of theaters. The below counter is connected to this number of theaters 
  int number_of_theaters = poster_collumns * poster_rows;
  
  
  //- This is a counter to control which screen to display: When ALL "Book Tickets"-buttons has the status false, screen with posters is shown. 
  //- Else a screen with (one of) the theater(s) will show  
 
  int counting_number_of_false_book_tickets_btns = 0; 
  
  
  //- Boolean deciding which "screen" to display: false: Posters with movies you can book tickets to, true: the theater where you can book seats
  //- The boolean is triggered by the counter above
  boolean is_theater_showing = false;
  
  
  
  
  //// VARIABLE NOT RELEVANT //// VARIABLE NOT RELEVANT //// VARIABLE NOT RELEVANT //// VARIABLE NOT RELEVANT //// VARIABLE NOT RELEVANT //// VARIABLE NOT RELEVANT //// VARIABLE NOT RELEVANT 
  
  //THIS VARIABLE IS A STEP TOWARDS CREATING CODE THAT WILL MAKE THE PROGRAM DISPLAY DIFFERENT THEATERS DEPENDENT ON WHICH "BOOK TICKETS"-BUTTON IS PRESSED//
  
  
  //- Double Array representing the different theaters you can enter (by clicking one of the "Book Tickets"-buttons) and book seats. For now the user will enter the same theater 
  //- no matter which of the "Book Tickets"-buttons the user will press
  int [] theaters = new int [poster_collumns * poster_rows];
  
  //// VARIABLE NOT RELEVANT //// VARIABLE NOT RELEVANT //// VARIABLE NOT RELEVANT //// VARIABLE NOT RELEVANT //// VARIABLE NOT RELEVANT //// VARIABLE NOT RELEVANT //// VARIABLE NOT RELEVANT 
  
  
  
  
  
  
  
  

  
  


  /////////////////////////////////////////////////////////////////////////////////
  // Constructor
  BookingSystem() {
    
    
 //// LOOP NOT USED //// LOOP NOT USED //// LOOP NOT USED //// LOOP NOT USED //// LOOP NOT USED //// LOOP NOT USED //// LOOP NOT USED //// LOOP NOT USED   
    // Giving theaters number-IDs
    for (int ni = 0; ni < theaters.length; ni ++) {
    
      theaters[ni] = ni+1;} 
      
 //// LOOP NOT USED //// LOOP NOT USED //// LOOP NOT USED //// LOOP NOT USED //// LOOP NOT USED //// LOOP NOT USED //// LOOP NOT USED //// LOOP NOT USED
 
 
      
      // Filling double array representing seats with boolean data 
      //(that determines whether a seat is booked)  
      for (int i =0; i < seats.length; i++) {
        
       
        for (int j =0; j < seats[i].length; j++) {
        
          // Filling seats with boolean data. All false to begin with
          seats[i][j] = seat_selected;} 
    } 
    
    
   // Filling "Book Tickets"-buttons with boolean data. All false to begin with
   for (int i = 0; i < number_of_posters_in_row; i++) {
        
       
      for (int j = 0; j < number_of_rows; j++) {   
    
    
    
          book_tickets_btns[i][j] = false;}
    }
  }
  
  

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Method which changes status of a "Book Ticket"-button which trigger screen change to a theater where the user can books seats
  
  void book_tickes_button () {
    
    
    // Changing status ('Booked' (true) or 'Not booked' (false)) of "Book Tickets"-buttons IF the mouse is hovering over the button.
    // The mouse pressed condition is "created" with Processing's MousePressed function/method called in the tab with setup() and draw()
    
    for (int i = 0; i < number_of_posters_in_row; i++) {
        
       
      for (int j = 0; j < number_of_rows; j++) {   
        
        
        // If statement checking if mouse hovering over the button
        if (mouseX > i*(poster_size_x+spacing_between_posters)+padding && mouseX < i*(poster_size_x+spacing_between_posters)+padding+book_tickets_btn_x && mouseY > j*(poster_size_y+spacing_between_posters)+padding+poster_size_y+10 && mouseY < j*(poster_size_y+spacing_between_posters)+padding+poster_size_y+10+book_tickets_btn_y) 
        {
        
          book_tickets_btns[i][j] = true;}
        
      }
    }
  }
  
  
  
  
  
  
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Method displaying the posters (if no "Book Tickets"-buttons has been pressed or the "Back"-button in the theater-screen has been pressed)

  void display_posters () {
    
    
 
    

   // Counting how many "Book Tickets"-buttons has the status: false/'Not pressed'

   for (int px = 0; px < number_of_posters_in_row; px++) {
        
       
    for (int py = 0; py < number_of_rows; py++) {   
       
       
      if (book_tickets_btns[px][py] == false) {
        
        
        counting_number_of_false_book_tickets_btns += 1; 
        }
      }
    }
        
        
         
   
   // If statement checking if all "Book Tickets"-buttons has the status: false/'Not pressed' - if so, the (screen with) posters and "Book Tickets"-buttons will be displayed  
  
   if (counting_number_of_false_book_tickets_btns == number_of_theaters) { 
    
      background(100);
      
      is_theater_showing = false;
      
      
      
      
      
    
      for (int i = 0; i < number_of_posters_in_row; i++) {
          
         
        for (int j = 0; j < number_of_rows; j++) {
          
          
          // Posters
          stroke(0);
          strokeWeight(2);
          noFill();
          
          rect(i*(poster_size_x+spacing_between_posters)+padding, j*(poster_size_y+spacing_between_posters)+padding, poster_size_x, poster_size_y); 
      
      
          // "Book Tickets"-buttons
          fill(10, 168, 100);
          rect(i*(poster_size_x+spacing_between_posters)+padding, j*(poster_size_y+spacing_between_posters)+padding+poster_size_y+10, book_tickets_btn_x, book_tickets_btn_y);
          
          textSize(18);
          fill(color_of_book_tickets_text);
          textAlign(CENTER, TOP);
          
          text("Book tickets", i*(poster_size_x+spacing_between_posters)+padding + (poster_size_x*.5), j*(poster_size_y+spacing_between_posters)+padding+poster_size_y+10);
        
        }
      }
    }
  }


  

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Method displaying a/the theater (if a "Book Tickets"-button has been pressed)
  
  void display_theater () {
  
    
    
    //Checking if a "Book Ticket"-button has been pressed
    
    for (int px = 0; px < number_of_posters_in_row; px++) {
        
       
      for (int py = 0; py < number_of_rows; py++) {  
    
    
        
        
       
        if (book_tickets_btns[px][py] == true) { 
          
          
          // Displaying a "Back"-button (if a "Book ticket"-button has been pressed)
        
          background(100);
          
          stroke(0);
          fill(200, 60, 100);
          rect(width*.75, height*.80, 90, 40);
          
          strokeWeight(5);
           
          fill(210);
          textAlign(CENTER, TOP);
          textSize(18);
          
          
          // MANGLER AT GØRE PARAMETRENE TIL VARIABLE (det gør jeg garanteret også nogle andre steder)
          text("<-- Back",width*.75+45, height*.80 +10); 
          
          
          
          
          is_theater_showing = true;
      
      
      
      
 
   
   
   
          //Displaying theater - where the colors of the seats are dependent on where the mouse is and wether the mouse has been pressed while hovering over a square/seat
          
          for (int i =0; i < seats.length; i++) {
              
             
            for (int j =0; j < seats[i].length; j++) {
              
              
              
      
              
              // Displaying pathways between seats byt displaying NO squares/seats in the two middle collumns (collumns*.5-1 and collumns*.5) and in the middle row ([row 7] =  [j == 7]) 
              if (i == collumns*.5-1 || i == collumns*.5 || j == 7) {
              
                noStroke();
                noFill();
              
                rect(i*20 +50, j*20 +50, square_size, square_size);}
              
                
              
              
              
              
              // Coloring squares/seats
              else {
              
              
              
                // Coloring seat which has been booked
                if (seats[i][j] == true) {
                  
                  
                  // Coloring seat with one color if mouse hovering over the seat
                  if (mouseX > i*20+50 && mouseX < i*20+50+square_size && mouseY > j*20+50 && mouseY < j*20+50+square_size) {
                
                
                    colorOfsquare = color(236, 221, 83);}
                  
                  
                  // Coloring seat with one color if mouse is NOT hovering over the seat
                  else {
                    colorOfsquare = color(0, 180, 255);}
                    }
                
                
          
                
                
              // Coloring seat which has NOT been booked
              else {
                  
                   
                //Coloring seat with one color if mouse hovering over the seat
                
                if (mouseX > i*20+50 && mouseX < i*20+50+square_size && mouseY > j*20+50 && mouseY < j*20+50+square_size) {
                            
                    colorOfsquare = color(0, 180, 0);}
                  
                  
                // Coloring seat with one color if mouse is NOT hovering over the seat
                else {
                  
                    colorOfsquare = color(255, 255, 255);}
                
                }
                
                      
              
      
              //Displaying the square/seat
              strokeWeight(1);
              stroke(0);
              
              fill(colorOfsquare);

              rect(i*20 +50, j*20 +50, square_size, square_size);}
              
            }
          }
        }
      }
    }
  }
  
 
  
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // Method to be called inside mousePressed() in tab with setup(): 
  // When mouse is pressed the state of the square the mouse is hovering over is changing from false to true or reverse, 
  // which will change colorOfscquare
  
  void seat_selecter() {
    
            
     // Going through the seats checking and changing their status ('Booked' (true) or 'Not booked' (false)) if mouse is pressed while mouse is hovering over the square/seat
     for (int i =0; i < seats.length; i++) {
          
      for (int j =0; j < seats[i].length; j++) {
        
        
        
        // If statement checking if mouse is hovering over the square/seat
        if (mouseX > i*20+50 && mouseX < i*20+50+square_size && mouseY > j*20+50 && mouseY < j*20+50+square_size) {
        
          
    
            
            // If statement checking the state of the seat and changing the seats state to the opposite (from BOOKED (true) to UNBOOKED (true) and reversed) 
            if (seats[i][j] == false) {
              
              seats[i][j] = true;
            }
            
            
            else if (seats[i][j] == true) {
              seats[i][j] = false;
            }              
        }
      }
    }
  }




  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // Method displaying "Back"-button (if a/the theater is playing) 
  
  void back_button() {
  
    
    
    if (is_theater_showing = true) {
      
      if (mouseX > width*.75 && mouseX < width*.75+ 90 && mouseY > height*.80 && mouseY < height*.80 + 40) {
        
        
        
        counting_number_of_false_book_tickets_btns = 0;
        
        
        for (int px = 0; px < number_of_posters_in_row; px++) {
        
       
            for (int py = 0; py < number_of_rows; py++) {   
       
       
                book_tickets_btns[px][py] = false;}
                
        }
      }
    }
  }
}
