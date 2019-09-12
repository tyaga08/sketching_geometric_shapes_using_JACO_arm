axis([0, 800, -300, 300, -50, 1000]);
xlabel('X');

ylabel('Y');
zlabel('Z');
box on

D0=275.5; D1=290;e2=7; D4=123.3; e3=42.78; e4=42.78; e5=42.78; e6=42.78; e7=160;
al1=deg2rad(90); a1=0; d1=D0; t1=deg2rad(0);
al2=deg2rad(0); a2=D1; d2=0; t2=deg2rad(0);
al3=deg2rad(90); a3=0; d3=e2; t3=deg2rad(0);
al4=deg2rad(0); a4=0; d4=D4+e3; t4=deg2rad(0);
alh4=deg2rad(-60); ah4=0; dh4=0; th4=deg2rad(-90);
al5=deg2rad(0); a5=0; d5=e4+e5; t5=deg2rad(0);
alh5=deg2rad(60); ah5=0; dh5=0; th5=deg2rad(0);
al6=deg2rad(0); a6=0; d6=e6+e7; t6=deg2rad(0);

t1=0.2770;t2=0.0601;t3=-0.2818;t4=-4.5953;t5=0.7775;t6=4.4905;

A10=[cos(t1) -sin(t1)*cos(al1) sin(t1)*sin(al1) a1*cos(t1);sin(t1) cos(t1)*cos(al1) -cos(t1)*sin(al1) a1*sin(t1);0 sin(al1) cos(al1) d1;0 0 0 1];
A21=[cos(t2) -sin(t2)*cos(al2) sin(t2)*sin(al2) a2*cos(t2);sin(t2) cos(t2)*cos(al2) -cos(t2)*sin(al2) a2*sin(t2);0 sin(al2) cos(al2) d2;0 0 0 1];
A32=[cos((pi/2)+t3) -sin((pi/2)+t3)*cos(al3) sin((pi/2)+t3)*sin(al3) a3*cos((pi/2)+t3);sin((pi/2)+t3) cos((pi/2)+t3)*cos(al3) -cos((pi/2)+t3)*sin(al3) a3*sin((pi/2)+t3);0 sin(al3) cos(al3) d3;0 0 0 1];
A43=[cos(t4) -sin(t4)*cos(al4) sin(t4)*sin(al4) a4*cos(t4);sin(t4) cos(t4)*cos(al4) -cos(t4)*sin(al4) a4*sin(t4);0 sin(al4) cos(al4) d4;0 0 0 1];
A54=[cos(th4) -sin(th4)*cos(alh4) sin(th4)*sin(alh4) ah4*cos(th4);sin(th4) cos(th4)*cos(alh4) -cos(th4)*sin(alh4) ah4*sin(th4);0 sin(alh4) cos(alh4) dh4;0 0 0 1];
A65=[cos(t5) -sin(t5)*cos(al5) sin(t5)*sin(al5) a5*cos(t5);sin(t5) cos(t5)*cos(al5) -cos(t5)*sin(al5) a5*sin(t5);0 sin(al5) cos(al5) d5;0 0 0 1];
A76=[cos(th5) -sin(th5)*cos(alh5) sin(th5)*sin(alh5) ah5*cos(th5);sin(th5) cos(th5)*cos(alh5) -cos(th5)*sin(alh5) ah5*sin(th5);0 sin(alh5) cos(alh5) dh5;0 0 0 1];
A87=[cos(t6) -sin(t6)*cos(al6) sin(t6)*sin(al6) a6*cos(t6);sin(t6) cos(t6)*cos(al6) -cos(t6)*sin(al6) a6*sin(t6);0 sin(al6) cos(al6) d6;0 0 0 1];

T10=A10
T20=A10*A21
T30=A10*A21*A32
Tx0=A10*A21*A32*A43
T40=A10*A21*A32*A43*A54
Ty0=A10*A21*A32*A43*A54*A65
T50=A10*A21*A32*A43*A54*A65*A76
T60=A10*A21*A32*A43*A54*A65*A76*A87

P80=T60*[0;0;0;1];
P70=T50*[0;0;0;1];
P60=Ty0*[0;0;0;1];
P50=T40*[0;0;0;1];
P40=Tx0*[0;0;0;1];
P30=T30*[0;0;0;1];
P20=T20*[0;0;0;1];
P10=T10*[0;0;0;1];

base=line([0 P10(1)],[0 P10(2)],[0,P10(3)], 'Marker','o','LineWidth',4,'Color','b');
ntoshoulder=line([P10(1) P20(1)],[P10(2) P20(2)], [P10(3) P20(3)], 'Marker','o','LineWidth',4,'Color','g');
shouldertoelbow=line([P20(1) P30(1)],[P20(2) P30(2)], [P20(3) P30(3)], 'Marker','o','LineWidth',4,'Color','m');
elbowtowrist=line([P30(1) P40(1)],[P30(2) P40(2)], [P30(3) P40(3)], 'Marker','o','LineWidth',4,'Color','c');
wrist1=line([P40(1) P50(1)-42.78],[P40(2) P50(2)], [P40(3) P50(3)], 'Marker','o','LineWidth',4,'Color','k');
wrist2=line([P50(1) P60(1)],[P50(2) P60(2)], [P50(3) P60(3)], 'Marker','o','LineWidth',4,'Color','k');
wrist3=line([P60(1) P70(1)+42.78],[P60(2) P70(2)], [P60(3) P70(3)], 'Marker','o','LineWidth',4,'Color','k');
endeff=line([P70(1)+42.78 P80(1)],[P70(2) P80(2)], [P70(3) P80(3)], 'Marker','o','LineWidth',4,'Color','r');


view(3);


z0=[0;0;1]
z1=T10*[z0;0];
z1=z1(1:3)
z2=T20*[z0;0];
z2=z2(1:3)
z3=T30*[z0;0];
z3=z3(1:3)
z4=T40*[z0;0];
z4=z4(1:3)
z5=T50*[z0;0];
z5=z5(1:3)

o=[0;0;0];
o1=T10*[o;1];
o1=o1(1:3)

o2=T20*[o;1];
o2=o2(1:3)

o3=T30*[o;1];
o3=o3(1:3)

o4=T40*[o;1];
o4=o4(1:3)

o5=T50*[o;1];
o5=o5(1:3)

oc=T60*[o;1];
oc=oc(1:3)



J=[cross(z0,(oc-o)) cross(z1,(oc-o1)) cross(z2,(oc-o2)) cross(z3,(oc-o3)) cross(z4,(oc-o4)) cross(z5,(oc-o5)); z0 z1 z2 z3 z4 z5]

Jdet=round(det(J))