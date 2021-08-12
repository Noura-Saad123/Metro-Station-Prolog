# Metro-Station-Prolog
Metro Stations:
Given Cairo tunnel Metro stations attached in the file metroStations.pl, You are required to help the user in solving some of his/her question.
Task 1:
Show the full path taken by the metro, from a source station to a destination with limit number of Stations (can be any number or ‘any’ if u don’t care), given by the user.
Ex:
Input: ?- Path(ataba,dokki,any,Z).
Output: Z = [[ataba, naguib], [naguib, sadat], [sadat, opera], [opera, dokki]].
Input: ?- Path(ataba,dokki,2,Z).
Output: false.
Input: ?- path(urabi,dar_elsalam,any,Z).
Output: Z = [[urabi, nasser], [nasser, sadat], [sadat, saad_zaghloul], [saad_zaghloul, alsayyeda_zeinab], [alsayyeda_zeinab, elmalek_elsaleh], [elmalek_elsaleh, margirgis], [margirgis, elzahraa], [elzahraa, dar_elsalam]].
Input: ?- path(ataba,sheratoon,any,Z).
Output: false.
Task 2:
Count number of stations directly connected to a given station. (Don’t use any built in predicate (findall , bagof … ).
Input: nstations(sadat,N).
Output: N = 4.
Input: nstations(helwan,L).
Output: L = 1.
Task 3:
Help the passengers and tell them the cost of moving from one station to another.
Rules:
• Stations <= 7 and one Line => 3 EGP
• 7 < stations < 16 or more than one Line => 5 EGP
• stations >= 16 => 7 EGP
EX:
Input: cost(sadat,ataba,N). Output: N = 3 EGP.
Input: cost(urabi,dar_elsalam,N).
Output: N = 5 EGP.
Task 4:
Check if a given path is valid. You have to make sure that you can travel with this path through the metro tunnel.
Ex:
Input: checkPath([[sadat,saad_zaghloul],[saad_zaghloul,alsayyeda_zeinab]]).
Output: True.
Input: checkPath([[sadat,saad_zaghloul],[opera,dokki]]).
Output: false.
