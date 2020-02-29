% colors: yellow, red, green
% countries: UR, SZ, OW, NW, LU, ZG
% constraints: UR = yellow, SZ = red

% possible pairs of color of neighboring countries
n(red, green).		n(red, yellow).
n(green, red).		n(green, yellow).
n(yellow, red).		n(yellow, green).

% countries and neighbors
colors(UR, SZ, OW, NW, LU, ZG) :-
	UR = yellow,
    SZ = red,
    n(UR, SZ), n(UR, NW),
    n(UR, OW), n(SZ, ZG),
    n(SZ, LU), n(SZ, NW),
    n(LU, ZG), n(LU, OW),
    n(LU, NW), n(OW, NW).

% ?- colors(UR, SZ, OW, NW, LU, ZG).

% UR = LU, LU = yellow,
% SZ = OW, OW = red,
% NW = ZG, ZG = green ;
% false.