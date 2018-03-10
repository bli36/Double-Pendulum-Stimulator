%Boying Li 26742398

function [W1] = RK4(F, W0, t0, h)
ang1 = W0(1);
ang2 = W0(2);
angV1 = W0(3);
angV2 = W0(4);

fw1 = F(t0,W0);

k1_m1 = fw1(1);
k1_m2 = fw1(2);
l1_m1 = fw1(3);
l1_m2 = fw1(4);

W0_2 = [ang1+k1_m1.*h./2, ang2+k1_m2.*h./2, angV1+l1_m1.*h./2, angV2+l1_m2.*h./2];
fw2 = F(t0+h./2,W0_2); 
k2_m1 = fw2(1);
k2_m2 = fw2(2);
l2_m1 = fw2(3);
l2_m2 = fw2(4);

W0_3 = [ang1+k2_m1.*h./2, ang2+k2_m2.*h./2, angV1+l2_m1.*h./2, angV2+l2_m2.*h./2];
fw3 = F(t0+h./2, W0_3);
k3_m1 = fw3(1);
k3_m2 = fw3(2);
l3_m1 = fw3(3);
l3_m2 = fw3(4);

W0_4 = [ang1+h.*k3_m1, ang2+h.*k3_m2, angV1+h.*l3_m1, angV2+h.*l3_m2];
fw4 = F(t0+h, W0_4);
k4_m1 = fw4(1);
k4_m2 = fw4(2);
l4_m1 = fw4(3);
l4_m2 = fw4(4);

W1_ang1 = ang1 + (h./6)*(k1_m1+ 2.*k2_m1+ 2.*k3_m1+ k4_m1);
W1_ang2 = ang2 + (h./6)*(k1_m2+ 2.*k2_m2+ 2.*k3_m2+ k4_m2);
W1_angV1 = angV1 + (h./6)*(l1_m1+ 2.*l2_m1+ 2.*l3_m1+ l4_m1);
W1_angV2 = angV2 + (h./6)*(l1_m2+ 2.*l2_m2+ 2.*l3_m2+ l4_m2);

W1 = [W1_ang1, W1_ang2, W1_angV1, W1_angV2];


end