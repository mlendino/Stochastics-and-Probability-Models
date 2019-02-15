%% Stochastics Project 1 Aziza, Michael, Nithi
clc;
clear all;
%% Part 1
%what is the probability that any one roll of three dice, you generate an
%ability score of 18, i.e. 6 6 6 
a = randi(6,3,10000);

count = 0;

for i = 1:10000
    if(a(:,i) == [6;6;6])
        count = count+1;
    end
end

prob = count/10000;
%prob approximately matches the expected value of 1/(6*6*6) = 0.0046

%What is the probability using the fun method of generating three scores
%and keeping the highest that you generate an ability score of 18? the fun
%method is generating three values per ability score and keep the highest
%one

a1 = randi(6,3,10000);
a2 = randi(6,3,10000);
a3 = randi(6,3,10000);
sumA = [sum(a1) sum(a2) sum(a3)];
a4 = zeros(1,10000);

for i = 1:10000
    %if(sum(a1(:,i))>=sum(a2(:,i)) && sum(a1(:,i))>=sum(a3(:,i)))
     %   a4(:,i) = a1(:,i);
    %elseif(sum(a2(:,i))>=sum(a1(:,i)) && sum(a2(:,i))>=sum(a3(:,i)))
     %   a4(:,i) = a2(:,i);
    %else
     %   a4(:,i) = a3(:,i);
    %end
    a4(i) = max([sum(a1(:,i)) sum(a2(:,i)) sum(a3(:,i))]);
end

count2=0;
for i = 1:10000
    if(a4(i) == 18)
        count2 = count2+1;
    end
end

prob2 = count2/10000;

%What is the probability using the fun method you generate a character that
%is the most perfect form of a human possible that has 18s in all ability
%scores

c = randi(6, 18, 1000000);

c1 = zeros(1000000,6);

for i = 1:1000000
    c1(i,1) = max([sum(c(1:3,i)) sum(c(1:3,i)) sum(c(1:3,i))]);
    c1(i,2) = max([sum(c(4:6,i)) sum(c(4:6,i)) sum(c(4:6,i))]);
    c1(i,3) = max([sum(c(7:9,i)) sum(c(7:9,i)) sum(c(7:9,i))]);
    c1(i,4) = max([sum(c(10:12,i)) sum(c(10:12,i)) sum(c(10:12,i))]);
    c1(i,5) = max([sum(c(13:15,i)) sum(c(13:15,i)) sum(c(13:15,i))]);
    c1(i,6) = max([sum(c(16:18,i)) sum(c(16:18,i)) sum(c(16:18,i))]);
end

count3=0;
for i = 1:1000000
    if(c1(i,:) == 18)
        count3 = count3+1;
    end
end

prob3 = count3/1000000;

%What is the probability using the fun method, you generate the most
%average, uninteresting character possible that has 9's in all ability
%scores? hint: there are 25 ways to roll a 9 with 3 dice

d = randi(6, 18, 1000000);

d1 = zeros(1000000,6);

for i = 1:1000000
    d1(i,1) = max([sum(d(1:3,i)) sum(d(1:3,i)) sum(d(1:3,i))]);
    d1(i,2) = max([sum(d(4:6,i)) sum(d(4:6,i)) sum(d(4:6,i))]);
    d1(i,3) = max([sum(d(7:9,i)) sum(d(7:9,i)) sum(d(7:9,i))]);
    d1(i,4) = max([sum(d(10:12,i)) sum(d(10:12,i)) sum(d(10:12,i))]);
    d1(i,5) = max([sum(d(13:15,i)) sum(d(13:15,i)) sum(d(13:15,i))]);
    d1(i,6) = max([sum(d(16:18,i)) sum(d(16:18,i)) sum(d(16:18,i))]);
end

count4=0;
for i = 1:1000000
    if(d1(i,:) == 18)
        count4 = count4+1;
    end
end

prob4 = count4/1000000;

%% Question 2 
%what is the average number of hit points each troll has, what is the
%average amount of damage the fireball spell does, find a bound on the
%probability that the fireball does greater than 3 points of damage


meantroll = mean(randi(4,1,10000));
%This value is around 2.5, as expected
meanfireball = mean(randi(2,1,10000) + randi(2,1,10000));
%This value is around 3, as expected

probgreaterthanthree = randi(2,2,10000);

count33 = 0;

for i = 1:10000
    if(probgreaterthanthree(:,i) == [2;2])
        count33 = count33+1;
    end
end

prob33 = count33/10000;
%this value is 0.25 as expected

%write the pmfs for the amount of damage the fireball does and the amount
%of hit points trolls have

%pmf is dependent on the value for fireball, 1/4 for 2 1/2 for 3 1/4 for 4
pmfFireball = [0 1/4 1/2 1/4];
pmftroll = 1/4;

%Suppose there are 6 trolls, and they are all within range of the FIREBALL. What is
%the probability that Keene slays all the trolls with this spell?

%making all six trolls at the same time
troll1 = randi(4,6,10000);
fireball = randi(2,1,10000) + randi(2,1,10000);

count44 = 0;
for i = 1:10000
    if(fireball(i) >= max(troll1(:,i)))
        count44 = count44+1;
    end
end

probslay = count44/10000;

%Unfortunately, the FIREBALL kills all but 1 of the trolls. Given that 5 trolls perished,
%what is the expected amount of hit points that the remaining troll has?

% troll1 = randi(4,5,10000);
% fireball = randi(2,1,10000) + randi(2,1,10000);
% 
% count55 = 0;
% for i = 1:10000
%     if(fireball(i) >= max(troll1(:,i)))
%         count55 = count55+1;
%     end
% end
% 
% prob5die = count55/10000;

diff = zeros(6,10000);

for i = 1:10000
    for j = 1:6
        diff(j,i) = troll1(j,i) - fireball(i);
    end
end

count = diff>0;

newDiff = zeros(6,10000);
for i= 1:10000
    if(sum(count(:,i)) == 1)
        newDiff(:,i) = diff(:,i);
    end        
end

expectedDiff = mean(newDiff(newDiff>0))

% The lone survivor, Shitvam the Troll, flees back to his master, the evil and powerful
% warrior Shedjam. Shedjam brandishes two weapons, the Sword of Tuition and the
% Hammer of Tenure Denial, which do 2d6 and 1d4 points of damage respectively.
% Shedjam furiously attacks, and needs to roll an 11 or greater on a 20 sided die in
% order to hit the wizard Keene with his Sword. If Shedham hits with his Sword, he
% may also attempt an attack with the Hammer, again needing a 11 or greater to hit.
% What is the expected amount of damage Shedjam would do to the Wizard Keene per
% attack?

tuition = randi(6,1,10000) + randi(6,1,10000);
tenure = randi(4,1,10000);
die1 = randi(20,1,10000);
die2 = randi(20,1,10000);

damage = zeros(1,10000);

for i = 1:10000
    temp = 0;
    if(die1(i)>=11)
        temp = tuition(i);
        if(die2(i)>=11)
            temp = temp + tenure(i);
        end
    end
    damage(i) = temp;
end

expecteddamage = mean(damage);


%extra credit 100%







