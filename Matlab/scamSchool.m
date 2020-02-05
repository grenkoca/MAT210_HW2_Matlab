

ntries = 10000;
nwins = 0;
for attempt=1:ntries
    % Shuffle a deck of cards by randomly ordering 52 numbers
    deck = randperm(52);
    % Now turn those 52 numbers into 4 sets of numbers from 1 to 13.
    deck = mod(deck,13)+1;

    % Pick two distinct numbers between 1 and 13.
    %randomCardValue = ceil(13*rand(2,1));
    permute13 = randperm(13);
    randomCardValue = permute13(1:2);

    % Where in the deck does the 1st card value appear?
    indicesOfCard1 = find(deck == randomCardValue(1));
    % Where in the deck does the 2nd card value appear?
    indicesOfCard2 = find(deck == randomCardValue(2));

    % Does the first card value come after the second?
    if (~isempty(intersect(indicesOfCard1,indicesOfCard2 + 1)))
        fprintf('The cards are side by side. Scam School wins!\n');
        % Does the first card value come before the second?
        nwins = nwins + 1;
    elseif (~isempty(intersect(indicesOfCard1,indicesOfCard2 - 1)))
        fprintf('The cards are side by side. Scam School wins!\n');
        nwins = nwins + 1; 
    else
        fprintf('The cards aren''t side by side. Scam School loses!\n');
    end 
end 
disp(nwins/ntries)
