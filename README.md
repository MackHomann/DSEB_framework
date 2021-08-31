# DSEB_framework
Button framework to use in debugging in gms2.3+ 

To create new set of buttons do : (buttons can be any name)

buttons = new buttonMaker();

buttons.Init();
  
To add a new button do :

buttons.Create(x, y, width, height, text, function, data);

When a button is pressed it will exacute the function that is supplied.

You can a. Refrence an already made script so maybe something like :

buttons.Create(100, 200, 100, 100, "Load", loadPlayerData); // loadPlayerData() loads players data
 
OR you can b. create a simple script in the Create function and supply a var or a struct in 7th argument (data).

buttons.Create(100, 200, 100, 100, "Load", function () {show_message(string(_text))}, "This button shows this text");

The Clear function will just clear the ds_list of all buttons.

The draw function should be called in the draw_gui event

The run function should be in the step event.

  

   
   
   
 
