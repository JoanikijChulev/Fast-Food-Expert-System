
:- dynamic existant/1, non_existant/1.

foodinfo(Question) :-
  (
    existant(Question) -> true;
    non_existant(Question) -> false;
    format('~w?~n', [Question]),
    Answer = read(yes),
    Answer -> assertz(existant(Question)); 
    assertz(non_existant(Question)), false).


food(fish_and_chips) :-  foodinfo('Does the food contain fish'),          foodinfo('Is the food deep fried') ;     		   foodinfo('Is the food carbohydrate-rich (containing dough, potatoes, flour...)').

/* The mutation is in the food(fish_and_chips) rule. It is an logial mutation. The second operator in the rule was changed from ,(and) to an or(;). To test-awnser no to the second fish_and_chip questions or awnser yes to the first 2 fish_and_chip questions!*/

food(grilled_fish) :-  	 foodinfo('Does the food contain fish'), foodinfo('Is the food grilled').
food(a_burger) :-        foodinfo('Is the food meaty'),                            foodinfo('Is the food American'),		     foodinfo('Is the food grilled and between two buns').  
food(doner) :-           foodinfo('Is the food meaty'),                 	   foodinfo('Is the food Turkish'),		     foodinfo('Is the food in a form of a sandwich').
food(pasta) :-       	 foodinfo('Is the food carbohydrate-rich (containing dough, potatoes, flour...)'),     		   foodinfo('Is the food combined with sauces'),     foodinfo('Is the food Italian').
food(pizza) :-           foodinfo('Is the food carbohydrate-rich (containing dough, potatoes, flour...)'),    		   foodinfo('Is the food baked'),                    foodinfo('Is the food disk shaped'),		        foodinfo('Is the food Italian').
food(potato_crisps) :-   foodinfo('Is the food carbohydrate-rich (containing dough, potatoes, flour...)'),     		   foodinfo('Is the food deep fried'), 		     foodinfo('Is the food based on a vegetable/vegetables').
food(barbecue_grill) :-  foodinfo('Is the food meaty'),                   	   foodinfo('Is the food grilled'),           	     foodinfo('Is the food based on animal cuts').
food(waffles) :-         foodinfo('Is the food carbohydrate-rich (containing dough, potatoes, flour...)'),            	   foodinfo('Is the food sweet'),          	     foodinfo('Is the food Belgian'), 				foodinfo('Is the food toatsed').
food(donuts) :-          foodinfo('Is the food carbohydrate-rich (containing dough, potatoes, flour...)'),                       foodinfo('Is the food sweet'), 		     foodinfo('Is the food American'), 				foodinfo('Is the food often glazed').
food(tacos) :-           foodinfo('Is the food meaty'),                       	   foodinfo('Is the food Mexican'),                  foodinfo('Does it contain salsa/cheese/guacamole').
food(nachos) :-          foodinfo('Is the food carbohydrate-rich (containing dough, potatoes, flour...)'),                       foodinfo('Is the food Mexican'),                  foodinfo('Does it contain salsa/cheese/guacamole').
food(fried_chicken) :-   foodinfo('Is the food meaty'),                            foodinfo('Is the food deep fried'), 		     foodinfo('Is the food based on animal cuts').
food(sushi) :-   	 foodinfo('Does the food contain fish'),    		   foodinfo('Is the food carbohydrate-rich (containing dough, potatoes, flour...)'),           foodinfo('Is the food Japanese').
food(noodles) :-         foodinfo('Is the food carbohydrate-rich (containing dough, potatoes, flour...)'),                       foodinfo('Is the food Japanese'). 
food(a_salad) :-    	 foodinfo('Is the food based on a vegetable/vegetables'),  foodinfo('Is the food combined with sauces'). 
food(a_toast) :-         foodinfo('Is the food carbohydrate-rich (containing dough, potatoes, flour...)'),                       foodinfo('Is the food in a form of a sandwich'),  foodinfo('Is the food toatsed').
food(abstract):-	 \+ foodinfo('Is the food carbohydrate-rich (containing dough, potatoes, flour...)'), 		   \+ foodinfo('Is the food meaty'), 		     \+ foodinfo('Is the food based on a vegetable/vegetables'), \+foodinfo('Does the food contain fish').

begin :-
    nl,
    write('Hello I am an Expert System in suggesting you foods!'), nl,
    write('Cannot think of anything to eat? Think of a food option, I will try my best guess of the provided info to suggest it!'), nl,
    write('For my System to work proparly, answer in the exact-correct format: yes. or no.'), nl,
    write('Are you ready?'), nl,
    repeat,
    read(Ready), nl,
    run(Ready), nl,
    remove_values,
    write('If you would like another suggestion type begin.').


run(yes) :- (food(A) -> format('I think your food is ~w.~n', [A]); false). 
run(no) :-  halt.
remove_values :- retract(existant(_)),fail. 
remove_values :- retract(non_existant(_)),fail.
remove_values.