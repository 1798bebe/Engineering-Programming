function draw_missile(missile,trash,size_missile,axis_limit,velocity,angle,msize,limit)
      theta = linspace(0,2*pi,100);
      plot(5 + 0.2*limit*cos(theta),1 + 0.2*limit*sin(theta),'m')
      hold on;
      for p = 1:size_missile
          plot(missile(p,1),missile(p,2), 'bo','markersize',15*msize)
          hold on
      end
      for i=1:7
        plot(trash(i,1),trash(i,2), 'rs');
        hold on 
      end
      plot(trash(8:9,1),trash(8:9,2), 'cs');
      hold on;
      plot(trash(10,1),trash(10,2), 'ys');
      hold on;
      whitebg([0 0 0])%creates black background
      axis([0, axis_limit, 0, axis_limit])%creates the axis for gameplay 
      plot([5 5+0.2*velocity*cos(angle)], [1 1+0.2*velocity*sin(angle)])
      hold off;

