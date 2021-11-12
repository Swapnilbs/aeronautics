%%Developed by Swapnil Singh(Aerospace-UoM)
%Version-(BlackScavenger-1.0.1)
AR=8;
tw =[];
twto=[];
twtu=[];
twcl=[];
twa=[];
twst=[];
TWst=[];
twl=[];
TWl=[];
TW=[];
TWto=[];
TWcl=[];
TWtu=[];
TWa=[];
WS=[];
WSto=[];
WScl=[];
WStu=[];
WSa=[];
WSl=[];
K2=-0.01;
CD0=0.012;
e=0.65;
g=9.81;
rho=1.225;
CLmax=0.941;
K1=0.073;
Vstall=11.5
%Vt and ht are rate of change of velocity and Vcr is cruise
%cruise case
for ws= 10:200
Vcr=20.2;
n=1;
q=0.5*rho*Vcr^2;
scr=11500;
tcr=scr/Vcr;
Vt= 0;
ht=0;
tw=(K1*ws)/q + K2 + (CD0*q)/ws;
TW=[TW,tw];
WS=[WS,ws];
end
plot(WS,TW,'-r')
hold on
%Take off case(Hand Launch)
for wsto=10:200
    Vto=12.65;
    nto=1;
    Sgto=50;
    tto=Sgto/Vto;
    kto=1.1;
    qto=0.5*rho*Vto^2;
    Vt=0;
    ht=0;
    twto= (kto^2*wsto)/(Sgto*rho*g*CLmax)
    TWto=[TWto,twto];
    WSto=[WSto,wsto];
end
plot(WSto,TWto,'-g')
hold on
    %Constant Climb
for wscl=10:200
    CDmin=0.012;
    Vcl=((2/rho)*wscl*((K1/(3*CDmin))^0.5))^0.5;
    ht=1;
    Alt=175;
    tcl=Alt/ht;
    qcl=0.5*rho*Vcl^2;
    twcl= (K1*ws)/qcl + K2 + (qcl*CDmin)/wscl + ht/Vcl ;
    TWcl=[TWcl,twcl];
    WScl=[WScl,wscl];
end
plot(WScl,TWcl,'-m')
hold on

    %turning with constant speed
    for wstu=10:200
        Vtu=20;
        qtu=0.5*rho*Vtu^2;
        R=54;
        ntu=((1+(Vtu^2/(g*R)^2)))^0.5;
        twtu= (K1*wstu*ntu^2)/q + K2*ntu + (CD0*q)/wstu;
        TWtu=[TWtu,twtu];
        WStu=[WStu,wstu];
    end
    plot(WStu,TWtu,'-b')
    hold on
  
    %acceleration
        for wsa=10:200
            Vi=12.65;
            Vf=20.2;
            s=100;
            Va=(Vi+Vf)/2;
            qa=0.5*rho*Va^2;
            Vt=(Vf^2-Vi^2)/(2*s);
            ta=(Vf-Vi)/Vt;
            twa=(K1*wsa)/qa + K2 + (CD0*qa)/wsa + Vt/g ;
            TWa=[TWa,twa];
            WSa=[WSa,wsa];
        end
        plot(WSa,TWa,'-k')
        hold on
       % Landing case
       for wsl=10:200
       mu=0.8;
       b=1.5;
       ktd=1.15;
       CD=CD0+K1*CLmax^2;
       Vl=ktd*Vstall;
       ql=0.5*rho*Vl^2;
       epl= CD -mu*CLmax;
       Sgl=50;
       tl=300;
       twl=b*((epl*ktd^2)/(((exp((Sgl*rho*g*epl)/(b*wsl))-1)*CLmax))-mu);
       TWl=[TWl,twl];
       WSl=[WSl,wsl];
       end
       plot(WSl,TWl,'-c')

     %Stability Analysis
     CM0=0.3;
     CLw=0.317;
     CLat=4.802;
     at=-0.087;
     CLt=CLat*at;
     delh=-0.3459;
     Vt=0.5;
     CMcg= CM0 + CLw*delh -CLt*Vt;
     %Mission Time
     tt=tto+tl+ta+tcl+tcr;
     %Energy Consumption
     %Take Off
     
      
      



        
       







        





