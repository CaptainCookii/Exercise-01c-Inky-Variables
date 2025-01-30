/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/
VAR pet_name = ""
VAR torches = 0
VAR east_is_lit = 0
VAR west_is_lit = 0
VAR spots_toy = 0
VAR have_coins = 0

-> memory

== memory ==
Before you stands an old and familiar cavern. You haven't tried coming back here since you were very young. You wish your childhood pet was with you now. The cave might be less intimidating then. What was your pet's name?

* [Charlie] 
    ~ pet_name = "Charlie"
    -> cave_mouth
* [Susan]
    ~ pet_name = "Susan"
    -> cave_mouth
* [Spot]
    ~ pet_name = "Spot"
    -> cave_mouth


== cave_mouth ==
You are at the enterance to a cave. {torches == 0: There is a torch on the floor.} The cave extends to the east and west. {torches == 1: You are armed with a trusty torch.}

+ {east_is_lit == 0} [Take the east tunnel] -> east_tunnel
+ {east_is_lit ==1} [Take the east tunnel] -> east_tunnel_lit
+ {west_is_lit == 0} [Take the west tunnel] -> west_tunnel
+ {west_is_lit == 1} [Take the west tunnel] -> west_tunnel_lit
* [Pick up the torch] -> torch_pickup
+ [Go home] -> go_home

== go_home ==
{spots_toy == 0 && have_coins == 0: The cave feels too daunting. You can't deal with it today.} 
{spots_toy == 1 && have_coins == 1: Your glad you came to the cave today. These coins will help pay this months rent hopefully and some more if your lucky.}
{spots_toy == 1 && have_coins == 0: Your glad you came to the cave today. You can't help but feel like you missed something but oh well, at least you got Spot's toy.}
{spots_toy == 0 && have_coins == 1: You leaving feeling sadder than you ever have. You miss {pet_name} so much, and these coins feel like they are draining your very soul. Maybe you shouldn't have come.}
-> END

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] 
    ~ east_is_lit = 1
    -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west tunnel. {pet_name == "Spot": This always was spot's favorite spot.} There is something in the darkness you can't make out.
* {torches > 0} [Light Torch]
    ~ west_is_lit = 1
    -> west_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
~ torches = 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== west_tunnel_lit ==
The light of your torch reveals a lone gravestone marked {pet_name}. How could've you forgot burrying them here. {pet_name == "Spot" && spots_toy == 0: Spot's favorite toy lays by the grave in tribute.}
* {pet_name == "Spot"} [Pick up the toy] -> toy_pickup
+ [Go Back] -> cave_mouth

== toy_pickup ==
~ spots_toy = 1
You pick up the toy, it makes you feel warmed and loved, just like spot used too.
* [Go Back] -> west_tunnel_lit

== east_tunnel_lit ==
The light of your torch glints off a small chest{have_coins == 0: containing some coins.} {have_coins == 1:.}
* [Grab some coins] -> coin_grab
+ [Go Back] -> cave_mouth

== coin_grab ==
~ have_coins = 1
You take hold of the coins. {spots_toy == 0: The coins feel heavy and cold. A presense lingers in your mind saying you should drop them.} {spots_toy == 1: The coins are slightly warm too the touch. You can almost feel Spot's encouraging barks telling you to take them with you.}
+ [Drop the coins]
    ~ have_coins = 0
    -> east_tunnel_lit
+ [Go Back with the coins] -> east_tunnel_lit






