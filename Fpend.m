%Boying Li26742398
function [FW] = Fpend(t, W)
%W=[O1, O2, w1, w2];
ang1 = W(1);
ang2 = W(2);
angV1 = W(3);
angV2 = W(4);

f1 = angV1;
f2 = angV2;
f3 = ((-3).*sin(ang1) - sin(ang1-2.*ang2) - 2.*sin(ang1-ang2).*(angV2.^2 + angV1.^2.*cos(ang1-ang2)))./(3-cos(2.*ang1-2.*ang2));
f4 = (2.*sin(ang1-ang2).*(2.*angV1.^2 + 2.*cos(ang1) + angV2.^2.*cos(ang1-ang2)))./(3-cos(2.*ang1-2.*ang2));
FW = [f1, f2, f3, f4];
end