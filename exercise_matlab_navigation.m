

%% Define locations
latA = 56.172060;
lonA = 10.191384;
latB = 56.150504;
lonB = 10.203161;

dept_of_engineering = [latA, lonA]; 
dept_of_engineering_marker = wmmarker(dept_of_engineering(1), dept_of_engineering(2));

railway_station = [latB, lonB];
%railway_station_marker = wmmarker(latB, lonB);

%% Plot the straight line
%wmline([latA, latB], [lonA, lonB]);

%% Define the waypoints
% Waypoints were measured by hand from a webmap

wp1 = [56.16888, 10.189];
wp2 = [56.16453, 10.19730];
wp3 = [56.15966, 10.19618];
wp4 = [56.15814, 10.19805];
wp5 = [56.15507, 10.19945];
wp6 = [56.15310, 10.20415];

latpts = [latA, wp1(1), wp2(1), wp3(1), wp4(1), wp5(1), wp6(1), latB];
lonpts = [lonA, wp1(2), wp2(2), wp3(2), wp4(2), wp5(2), wp6(2), lonB];

%% Plot the line with waypoints
%wmline(latpts, lonpts);



%% Compute the distance
straight_line_distance =  deg2km(distance(latA, lonA, latB, lonB));
waypoints_line_distance = deg2km(distance(latA, lonA, wp1(1), wp1(2)) + distance(wp1(1), wp1(2), wp2(1), wp2(2)) + distance(wp2(1), wp2(2), wp3(1), wp3(2)) + distance(wp3(1), wp3(2), wp4(1), wp4(2)) + distance(wp4(1), wp4(2), wp5(1), wp5(2)) + distance(wp5(1), wp5(2), wp6(1), wp6(2)) + distance(wp6(1), wp6(2), latB, lonB));

%% Dead reckoning

waypoints = [
    latA lonB; 
    wp1(1) wp1(2); 
    wp2(1) wp2(2); 
    wp3(1) wp3(2); 
    wp4(1) wp4(2); 
    wp5(1) wp5(2); 
    wp6(1) wp6(2); 
    latB lonB
];
time = 0; % Leave at midnight
speed = 3; % Speed in m/s

[drlat, drlon, drtime] = dead_reckon(waypoints, time, speed, [], 1.1);
drAns = [drlat, drlon, drtime];
%wmmarker(drlat, drlon)

%% Exercise 2
% Create a dead reckoning function using other parameters
 

% Compute variation wp-dr
wp = waypoints(2:8,1:2)
dr = [drlat, drlon]

wmmarker(wp(:,1), wp(:,2), 'Color', 'red')
wmmarker(dr(:,1), dr(:,2), 'Color', 'yellow')



