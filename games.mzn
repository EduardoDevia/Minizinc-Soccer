%Title of the game number
enum GameNumber ;
%Declare integer values
int: minbets;
%Array Declarations odds values
array[GameNumber] of float: odds;
%Array Declarations odds values
array[GameNumber] of float: probability;
%array to validate what the bets should be taken
array[GameNumber] of var bool : bet; 
%Constraints the average of the bet is greater than 23%
constraint sum(i in GameNumber)(probability[i]*bet[i])/sum(i in GameNumber)(bet[i])>=0.23;
%Constraints to select more than five bet
constraint sum(i in GameNumber)(bet[i])>minbets;


%maximize profit
solve maximize(sum(i in GameNumber)(odds[i]*bet[i]));
%solve satisfy;
output ["GameNumber = ", show(GameNumber),"\n"];
output ["Amount = ", show(odds),"\n"];
output ["bet = ", show(bet),"\n"];
output ["probability = ", show(probability),"\n"];
%output ["Satisf = ", show(sum(i in GameNumber|bet[i])(odds[i]*bet[i])),"\n"];