function space_cleaner_game()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     PRESS 'Q' TO EXIT GAME         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
%OPTIONS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
num=0; 
msize=1;
axis_limit= 10;
velocity=1;
angle=pi/2;
limit=2;
regulator=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x =round(axis_limit/2); %starting point
y =1; %starting point
d=0; %missile is not moving in the beginning
for i=1:10
    a(i) =randi([1 axis_limit-1],1);%generates random x coordinate for trash
    b(i) =randi([4 axis_limit-1],1);%generates random y(>=4) coordinate for trash
end
missile(1,1:2)=[x y];%defines the missile for x and y coordinates
size_missile=1;
ex=0;    % used to exit game
trash=[a' b'];%defines trash for a and b coordinates
draw_missile(missile,trash,size_missile,axis_limit,velocity,angle,msize,limit)
figure('KeyPressFcn',@my_callback);
    function my_callback(~,event)%callback function for movement
        switch event.Character 
            case 'q'
                ex=1; %% if you press q, then you quit the game 
            case 30
                if velocity<limit && regulator==0
                   velocity=velocity+1; 
                end
            case 31
                if velocity>1 && regulator==0
                   velocity=velocity-1
                end    
            case 29
                if angle>0 && regulator==0
                    angle=angle-pi/50; %subtract angle by pi/20(to the left)
                    draw_missile(missile,trash,size_missile,axis_limit,velocity,angle,msize,limit)
                end
            case 28
                if angle<pi && regulator==0
                    angle=angle+pi/50; %add angle by 5 degrees(to the left)
                    draw_missile(missile,trash,size_missile,axis_limit,velocity,angle,msize,limit)
                end
            case ' '
                num=num+1;
                playmusic(1)
                d=1;
        end
    end
while (ex~=1)%runs the missile as long as q is not pressed 
    switch d
        case 0 
            regulator=0;
            trash(1:7,1)=trash(1:7,1)+0.05;
            trash(8:9,1)=trash(8:9,1)+0.10;
            trash(10,1)=trash(10,1)+0.03;
            for i=1:10
                if trash(i,1)>=11 
                    trash(i,1)=-1;
                end
            end
        case 1 %calling callback function
            regulator=1;
            missile(1,2)=missile(1,2)+0.1*velocity*sin(angle);
            missile(1,1)=missile(1,1)+0.1*velocity*cos(angle);
            trash(1:7,1)=trash(1:7,1)+0.05;
            trash(8:9,1)=trash(8:9,1)+0.10;
            trash(10,1)=trash(10,1)+0.03;
            for i=1:10
                if trash(i,1)>=11 
                    trash(i,1)=-1;
                end
            end
    end
    draw_missile(missile,trash,size_missile,axis_limit,velocity,angle,msize,limit) %draws the missile
      pause(0.1) %The speed of the game
      for i=1:10
          if abs(trash(i,1)-missile(1,1))<0.45*msize && abs(trash(i,2)-missile(1,2))<0.45*msize %if the missile and trash are in the same position
             trash(i,2) = -100;%The trash disappears
             trash(i,1) = 5;%The trash disappears 
             if i==10
                playmusic(2)
             elseif i==8 || i==9 
                playmusic(3)
             else 
                playmusic(4)
             end
          end
      end 
    if missile(1,1)>10 || missile(1,2)>10 || missile(1,1)<0 || missile(1,2)<0
        missile(1,1:2)=[x y];
        angle=pi/2;
        velocity=1;
        d=0; 
    end
    if trash(10,2)==-100
        msize=2; % you can put the code here as well
    end
    if trash(8,2)==-100 && trash(9,2)~=-100
            limit=4; 
    end 
    if trash(9,2)==-100 && trash(8,2)~=-100
            limit=4; 
    end 
    if trash(8:9,2)==-100 
            limit=8; 
    end 
    if trash(:,2)==-100
        msgbox('You got rid of all the trash in the space!','Mission Complete')
        playmusic(5)
        fprintf('number of missiles used:%d\n',num)
        ex=1;
    end
end
  close all;
end