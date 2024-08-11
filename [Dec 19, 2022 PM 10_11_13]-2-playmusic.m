function playmusic(musicno)
    

    fs=44100;
    time0=0:1/fs:0.1;
    time1=0:1/fs:0.4;
    time2=0:1/fs:0.2;
    
    launchsound1=sin(2*pi*196*time0);
    launchsound2=sin(2*pi*138.6*time0); 

    growupsound1=0.4*sin(2*pi*523.25*time1);
    growupsound2=0.4*sin(2*pi*659.26*time1);
    growupsound3=0.4*sin(2*pi*783.99*time1);
    growupsound4=0.4*sin(2*pi*1046.5*time1);
    
    hitsound1=0.2*sin(2*pi*932.33*time0);
    hitsound2=0.2*sin(2*pi*1244.51*time0);

    s1=0.4*sin(2*pi*2*466.16*time2);
    s2=0.4*sin(2*pi*2*622.25*time2);
    s3=0.4*sin(2*pi*2*622.25*time1);
    s4=0.4*sin(2*pi*2*698.46*time2);
    s5=0.4*sin(2*pi*2*783.99*time1);
    s6=0.4*sin(2*pi*2*783.99*time2);
    s7=0.4*sin(2*pi*2*830.61*time2);
    s8=0.4*sin(2*pi*2*932.33*time1);
    s9=0.4*sin(2*pi*2*932.33*time2);
    switch musicno
        case 1 
            sound(launchsound1,fs);
            pause(0.1)
            sound(launchsound2,fs);
        case 2 
            sound(growupsound1,fs);
            sound(growupsound2,fs);
            sound(growupsound3,fs);
            sound(growupsound4,fs);
        case 3 
            for k=1:3
               speedupsoundk=0.8*sin(2*pi*1396.9*(2)^(1/6)^(k-1)*time0);
               sound(speedupsoundk,fs);
               pause(0.1)
            end
        case 4 
            sound(hitsound1,fs);
            sound(hitsound2,fs);
        case 5
            soundsc(s5,fs);
            pause(0.45)
            soundsc(s5,fs);
            pause(0.4)
            soundsc(s5,fs);
            pause(0.18)
            soundsc(s4,fs);
            pause(0.18)
            soundsc(s2,fs);
            pause(0.18)
            soundsc(s4,fs);
            pause(0.32)
            soundsc(s8,fs);
            pause(0.40)
            soundsc(s8,fs);
            pause(0.50)
            soundsc(s6,fs);
            pause(0.22)
            soundsc(s9,fs);
            pause(0.18)
            soundsc(s7,fs);
            pause(0.33)
            soundsc(s5,fs);
            pause(0.33)
            soundsc(s2,fs);
            pause(0.18)
            soundsc(s1,fs);
            pause(0.18)
            soundsc(s4,fs);
            pause(0.18)
            soundsc(s3,fs);
            pause(0.18)
    end
