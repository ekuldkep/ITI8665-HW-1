% clear everything
clc
clear

n = 1000;
dimensions = 3;
% cluster 1, first dimension 2-4
cluster_1_x_min=2;
cluster_1_x_max=4;

cluster_1_y_min=3;
cluster_1_y_max=5;

cluster_1_z_min=0;
cluster_1_z_max=2;

cluster_1_x=cluster_1_x_min+rand(n,1)*(cluster_1_x_max-cluster_1_x_min);
cluster_1_y=cluster_1_y_min+rand(n,1)*(cluster_1_y_max-cluster_1_y_min);
cluster_1_z=cluster_1_z_min+rand(n,1)*(cluster_1_z_max-cluster_1_z_min);

cluster_1_columns = horzcat(cluster_1_x, cluster_1_y, cluster_1_z);


cluster_2_x_min=5;
cluster_2_x_max=7;

cluster_2_y_min=6;
cluster_2_y_max=8;

cluster_2_z_min=0;
cluster_2_z_max=2;

cluster_2_x=cluster_2_x_min+rand(n,1)*(cluster_2_x_max-cluster_2_x_min);
cluster_2_y=cluster_2_y_min+rand(n,1)*(cluster_2_y_max-cluster_2_y_min);
cluster_2_z=cluster_2_z_min+rand(n,1)*(cluster_2_z_max-cluster_2_z_min);

cluster_2_columns = horzcat(cluster_2_x, cluster_2_y, cluster_2_z);

cluster_3_x_min=5;
cluster_3_x_max=7;

cluster_3_y_min=2;
cluster_3_y_max=0;

cluster_3_z_min=4;
cluster_3_z_max=6;

cluster_3_x=cluster_3_x_min+rand(n,1)*(cluster_3_x_max-cluster_3_x_min);
cluster_3_y=cluster_3_y_min+rand(n,1)*(cluster_3_y_max-cluster_3_y_min);
cluster_3_z=cluster_3_z_min+rand(n,1)*(cluster_3_z_max-cluster_3_z_min);

cluster_3_columns = horzcat(cluster_3_x, cluster_3_y, cluster_3_z);

clusters_one_two = vertcat(cluster_2_columns, cluster_1_columns);
clusters_three_two = vertcat(cluster_2_columns, cluster_3_columns);
clusters_one_three = vertcat(cluster_1_columns, cluster_3_columns);

matrix = vertcat(cluster_1_columns, cluster_2_columns, cluster_3_columns);

fraction = 0.7;
disp("uniform data sets 1,2");
disp([
    Hopkins(clusters_one_two(:,1), fraction);
    Hopkins(clusters_one_two(:,2), fraction);
    Hopkins(clusters_one_two(:,3), fraction)
]);

disp("uniform data sets 2,3");
disp([
    Hopkins(clusters_three_two(:,1), fraction);
    Hopkins(clusters_three_two(:,2), fraction);
    Hopkins(clusters_three_two(:,3), fraction)
]);

disp("uniform data sets 1,3");
disp([
    Hopkins(clusters_one_three(:,1), fraction);
    Hopkins(clusters_one_three(:,2), fraction);
    Hopkins(clusters_one_three(:,3), fraction)
]);

fh(1) = figure(1);
clf(fh(1))

plot3(cluster_1_x, cluster_1_y, cluster_1_z, '.')
hold on
plot3(cluster_2_x, cluster_2_y, cluster_2_z, 'o')
hold on
plot3(cluster_3_x, cluster_3_y, cluster_3_z, '+')
hold on


axis equal
grid on
   
   
 