function jaco_vrep(thetas)
vrep = remApi('remoteApi');
vrep.simxFinish(-1);
[rows,columns] = size(thetas);
clientID = vrep.simxStart('127.0.0.1', 19999, true, true, 5000,5);

if (clientID > -1)
    disp('Connected');
    [returnCode, jaco_arm(1)] = vrep.simxGetObjectHandle(clientID, 'Jaco_joint1', vrep.simx_opmode_blocking)
    [returnCode, jaco_arm(2)] = vrep.simxGetObjectHandle(clientID, 'Jaco_joint2', vrep.simx_opmode_blocking)
    [returnCode, jaco_arm(3)] = vrep.simxGetObjectHandle(clientID, 'Jaco_joint3', vrep.simx_opmode_blocking)
    [returnCode, jaco_arm(4)] = vrep.simxGetObjectHandle(clientID, 'Jaco_joint4', vrep.simx_opmode_blocking)
    [returnCode, jaco_arm(5)] = vrep.simxGetObjectHandle(clientID, 'Jaco_joint5', vrep.simx_opmode_blocking)
    [returnCode, jaco_arm(6)] = vrep.simxGetObjectHandle(clientID, 'Jaco_joint6', vrep.simx_opmode_blocking)
    
    home_position = [0.5*pi 1.5*pi 1.5*pi pi pi pi];
    for i=1:6
        returnCode = vrep.simxSetJointTargetPosition(clientID, jaco_arm(i), home_position(i), vrep.simx_opmode_blocking);
    end
    pause(2)
    
    for i=1:rows
        position = [deg2rad(90+thetas(i,1)) deg2rad(270+thetas(i,2)) deg2rad(270+thetas(i,3)) pi pi pi];
        for j=1:3
        returnCode = vrep.simxSetJointTargetPosition(clientID, jaco_arm(j), position(j), vrep.simx_opmode_blocking);
        end
    end
    vrep.simxFinish(-1);
else
    disp('Connection failure');

end

vrep.delete();

end