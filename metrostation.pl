%first line
connected(new_elmarg,elmarg).
connected(elmarg,ezbet_elnakhl).
connected(ezbet_elnakhl,ain_shams).
connected(ain_shams,elmatareyya).
connected(elmatareyya,helmeyet_elzaitoun).
connected(helmeyet_elzaitoun,hadayeq_elzaitoun).
connected(hadayeq_elzaitoun,saray_elqobba).
connected(saray_elqobba,hammamat_elqobba).
connected(hammamat_elqobba,kobri_elqobba).
connected(kobri_elqobba,manshiet_elsadr).
connected(manshiet_elsadr,eldemerdash).
connected(eldemerdash,ghamra).
connected(ghamra,alshohadaa).
connected(alshohadaa,urabi).
connected(urabi,nasser).
connected(nasser,sadat).
connected(sadat,saad_zaghloul).
connected(saad_zaghloul, alsayyeda_zeinab).
connected(alsayyeda_zeinab,elmalek_elsaleh).
connected(elmalek_elsaleh,margirgis).
connected(margirgis,elzahraa).
connected(elzahraa,dar_elsalam).
connected(dar_elsalam,hadayeq_elmaadi).
connected(hadayeq_elmaadi,maadi).
connected(maadi,thakanat_elmaadi).
connected(thakanat_elmaadi,tora_elbalad).
connected(tora_elbalad,kozzika).
connected(kozzika,tora_elasmant).
connected(tora_elasmant,elmaasara).
connected(elmaasara,hadayeq_helwan).
connected(hadayeq_helwan,wadi_hof).
connected(wadi_hof,helwan_university).
connected(helwan_university,ain_helwan).
connected(ain_helwan,helwan).
%second line
connected(shobra_elkheima,koliet_elzeraa).
connected(koliet_elzeraa,mezallat).
connected(mezallat,khalafawy).
connected(khalafawy,sainte_teresa).
connected(sainte_teresa,road_elfarag).
connected(road_elfarag,massara).
connected(massara,alshohadaa).
connected(alshohadaa,ataba).
connected(ataba,naguib).
connected(naguib,sadat).
connected(sadat,opera).
connected(opera,dokki).
connected(dokki,bohooth).
connected(bohooth,cairo_university).
connected(cairo_university,faisal).
connected(faisal,giza).
connected(giza,omm_elmisryeen).
connected(omm_elmisryeen,sakiat_mekki).
connected(sakiat_mekki,elmounib).

% Biconnection
isconnected(A, B) :-			%check the connection between two stations
    connected(A, B);
    connected(B, A).

% Task 1 
%get the full path 

path(SourceStation, SourceStation, _, []).  % Base Case
path(SourceStation, DistinationStation, N, [[SourceStation, SecondStation]|Result]) :- 
    isconnected(SourceStation, SecondStation),   % check connection of source station with first station in the connected line
    SecondStation \= N,  % if Second Station equal N fails, ezn get the path  
    path(SecondStation, DistinationStation, SourceStation, Result). 



%Task 2

countStations([] , 0).                               %the best case if the list size of stations is zero
countStations([_|T] , Result):-                %remove the head
    countStations(T,Result1),
    Result is Result1+1.

getAllStations(Station,L):-
   findStations(Station,[],L).

checkMember(A,[B|T]):-
   A=B;
   checkMember(A,T).

findStations(Station,C,Stations):-
    isconnected(Station,B),
   \+ checkMember(B,C),
    findStations(Station,[B|C],Stations).

% Test function
findStations(_,L,L).
nstations(Station,N):-
    getAllStations(Station,L),
    countStations(L,N).


%Task 3
%get the cost of resarvation a ticket

cost(StartPath, EndPath, N):-
   path(StartPath, EndPath, any, Path),		%get the path first
   countStations(Path, NumOfStations),			%get the length of path(no#stations)
   getCost(NumOfStations ,N).

getCost(NumOfStations, Price):-
   (NumOfStations < 8, Price = '3 EGP');    %Stations <= 7
   (NumOfStations < 16, Price = '5 EGP');   % 7 < stations < 16
   (NumOfStations > 17, Price = '7 EGP').	%stations >= 16 => 7 EGP

%Task 4

checkPath([[X, Y]|T]) :-
    check_path([[X, Y]|T], X).

check_path([], _).				%the best case if the list is empty
check_path([[A, B]|T], P) :-	%to allow many elements in list(lists of list) (p=head)
    isconnected(A, B),			%if the stations are not connected return false
    A = P,
    check_path(T, B).			%remove the head to check the next path