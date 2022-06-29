test('Japan',['Historical places','National parks','Festivals','Local
restaurants','Museums','Urban','Rural','Nothing'],'Open budget','Asia').
test('South Korea',['Historical places','National parks','Local
restaurants','Rural','Nothing'],'Open budget','Asia').
test('India',['National parks','Rural','Nothing'],'Open-Limited budget','Asia').
test('Singapore',['National parks','Local restaurants','Urban','Nothing'],'Open-Limited
budget','Asia').
test('Saudi Arabia',['Local restaurants','Urban','Nothing'],'Open-Limited budget','Asia').
test('France',['Historical places','Local
restaurants','Museums','Urban','Rural','Nothing'],'Open budget','Europe').
test('United Kingdom',['Museums','Urban','Festivals','Nothing'],'Open budget','Europe').
test('Germany',['National parks','Urban','Rural','Nothing'],'Open budget','Europe').
test('Italy',['Museums','Festivals','Urban','Rural','Nothing'],'Open budget','Europe').

test('Norway',['National parks','Urban','Rural','Nothing'],'Open budget','Europe').
test('United states',['National parks','Urban','Rural','Nothing'],'Open budget','North
America').
test('Canada',['National parks','Urban','Rural','Nothing'],'Open budget','North America').
test('Mexico',['Historical places','Local restaurants','National
parks','Urban','Rural','Nothing'],'Open-Limited budget','North America').
test('Brazil',['Historical places','Local restaurants','National
parks','Urban','Rural','Nothing'],'Open-Limited budget','South America').

test('Argentina',['Historical places','Local restaurants','Urban','Rural','Nothing'],'Open-
Limited budget','South America').

test('Peru',['National parks','Local restaurants','Urban','Rural','Nothing'],'Open-Limited
budget','South America').
test('Chile',['National parks','Local restaurants','Urban','Rural','Nothing'],'Open-Limited
budget','South America').
test('Bolivia',['Local restaurants','Urban','Rural','Nothing'],'Open-Limited budget','South
America').

test('Australia',['Historical places','Local restaurants','Urban','Rural','Nothing'],'Open-
Limited budget','Australia').

test('New Zealand',['Historical places','Urban','Rural','Nothing'],'Open-Limited
budget','Australia').
test('Egypt',['Historical places','Local restaurants','Urban','Rural','Nothing'],'Open-Limited
budget','Africa').
test('South Africa',['National parks','Urban','Rural','Nothing'],'Open-Limited
budget','Africa').
test('Morocco',['National parks','Urban','Rural','Nothing'],'Open-Limited budget','Africa').
test('Algeria',['Historical places','Urban','Rural','Nothing'],'Open-Limited budget','Africa').
test('Nigeria',['Local restaurants','Urban','Rural','Nothing'],'Open-Limited
budget','Africa').

con:-
nl,write('***Welcome To The Travel Agent***'),nl,

nl,write('Choose your continent, 1- Asia, 2- Europe, 3- North America, 4- South
America, 5- Australia, 6- Africa.'),nl,
write('Enter a number: '),
read(N),
num(N).

num(N):-
N==1,K='Asia',write('Asia'),con2(K);
N==2,K='Europe',write('Europe'),con2(K);
N==3,K='North America',write('North America'),con2(K);
N==4,K='South America',write('South America'),con2(K);
N==5,K='Australia',write('Australia'),con2(K);
N==6,K='Africa',write('Africa'),con2(K).

con2(K):-
nl,write('Choose any features!, 1- Historical places , 2- National parks , 3- Festivals, 4-
Local restaurants, 5- Museums, 6- Urban, 7- Rural, 8- Nothing.'),nl,
write('Enter a number: '),
read(N2),
num2(K,N2).

num2(K,N2):-
N2==1,K2='Histroical places',write(K2),con3(K,K2);
N2==2,K2='National parks',write(K2),con3(K,K2);
N2==3,K2='Festivals',write(K2),con3(K,K2);
N2==4,K2='Local restaurants',write(K2),con3(K,K2);
N2==5,K2='Museums',write(K2),con3(K,K2);
N2==6,K2='Urban',write(K2),con3(K,K2);
N2==7,K2='Rural',write(K2),con3(K,K2);
N2==8,write('Nothing'),write(K2),con3(K,K2).

con3(K,K2):-
nl,write('Is there any other features?, 1- Historical places , 2- National parks , 3-
Festivals, 4- Local restaurants, 5- Museums, 6- Urban, 7- Rural, 8- Nothing.'),nl,
write('Enter a number: '),
read(N3),
num3(K,K2,N3).

num3(K,K2,N3):-
N3==1,K3='Histroical places',write(K3),con4(K,K2,K3);
N3==2,K3='National parks',write(K3),con4(K,K2,K3);
N3==3,K3='Festivals',write(K3),con4(K,K2,K3);
N3==4,K3='Local restaurants',write(K3),con4(K,K2,K3);
N3==5,K3='Museums',write(K3),con4(K,K2,K3);
N3==6,K3='Urban',write(K3),con4(K,K2,K3);
N3==7,K3='Rural',write(K3),con4(K,K2,K3);
N3==8,write('Nothing'),write(K3),con4(K,K2,K3).

con4(K,K2,K3):-

nl,write('Which budget you would like?, 1- Open budget , 2- Limited budget, 3- Open-
Limited budget'),nl,

write('Enter a number: '),
read(N4),
num4(K,K2,K3,N4).

num4(K,K2,K3,N4):-
N4==1,K4='Open budget',write(K4),suggest(K,K2,K3,K4);
N4==2,K4='Limited budget',write(K4),suggest(K,K2,K3,K4);
N4==3,K4='Open-Limited budget',write(K4),suggest(K,K2,K3,K4).

get_score(_,[],0).

get_score([H,T],[H1|T1],S):- get_score([H,T],T1,S1), member(H1, T), S is S1+1.
get_score([H,T],[H1|T1],S):- get_score([H,T],T1,S1), not(member(H1, T)), S is S1.

get_best_match([],_,Best,_,Best).
get_best_match([H|T],[K2,K3],Curr,Score,Best):- get_score(H,[K2,K3],CS),H = [A,_],
CS = Score, append(Curr,[A],New), get_best_match(T,[K2,K3],New,CS,Best).
get_best_match([H|T],[K2,K3],_,Score,Best):- get_score(H,[K2,K3],CS),H = [A,_], CS >
Score, New = A, get_best_match(T,[K2,K3],[New],CS,Best).
get_best_match([H|T],[K2,K3],Curr,Score,Best):- get_score(H,[K2,K3],CS), not(CS >
Score), get_best_match(T,[K2,K3],Curr,Score,Best).

suggest(K,K2,K3,K4):- nl,findall([C,F],test(C,F,K4,K),Lis),nl,Lis =
[[_,_]|_],get_best_match(Lis,[K2,K3],[],0,AllBest),random_member(Best,
AllBest),format('The best matching country for your preferences is ~w.',[Best]).
suggest(K,_,_,K4):- nl,findall([C,F],test(C,F,K4,K),Lis),nl, Lis = [], format('Sorry, we
could not find a match for your preferences.').