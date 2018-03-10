%Boying Li26742398
function [W4] = PC(F, W0, W1, W2, W3, t3, h)
t4 = t3 + h;
t2 = t3 - h;
t1 = t2 - h;
t0 = t1 - h;

fw3 = F(t3,W3);
fw2 = F(t2,W2);
fw1 = F(t1,W1);
fw0 = F(t0,W0);
%4-step explicit A-B method
W4_star_ang1 = W3(1) + (h./24).*(55.*fw3(1)-59.*fw2(1)+37.*fw1(1)-9.*fw0(1));
W4_star_ang2 = W3(2) + (h./24).*(55.*fw3(2)-59.*fw2(2)+37.*fw1(2)-9.*fw0(2));
W4_star_angV1 = W3(3) + (h./24).*(55.*fw3(3)-59.*fw2(3)+37.*fw1(3)-9.*fw0(3));
W4_star_angV2 = W3(4) + (h./24).*(55.*fw3(4)-59.*fw2(4)+37.*fw1(4)-9.*fw0(4));
W4_star = [W4_star_ang1,W4_star_ang2,W4_star_angV1,W4_star_angV2];
%3-step Adam-molton Implicit method
fw4r = F(t4, W4_star);

W4_ang1 = W3(1)+(h./24).*(9.*fw4r(1)+19.*fw3(1)-5.*fw2(1)+fw1(1));
W4_ang2 = W3(2)+(h./24).*(9.*fw4r(2)+19.*fw3(2)-5.*fw2(2)+fw1(2));
W4_angV1 = W3(3)+(h./24).*(9.*fw4r(3)+19.*fw3(3)-5.*fw2(3)+fw1(3));
W4_angV2 = W3(4)+(h./24).*(9.*fw4r(4)+19.*fw3(4)-5.*fw2(4)+fw1(4));

W4 = [W4_ang1,W4_ang2,W4_angV1,W4_angV2];

end