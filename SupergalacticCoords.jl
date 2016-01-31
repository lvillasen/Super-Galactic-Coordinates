function gal2sgal(l,b)
# The input galactic longitude can be a number or 1D array
# The input galactic  latitude can be a number or 1D array 
# The output supergalactic longitude is a number or 1D array in degrees from 0° to 360°
# The output supergalactic latitude is a number or 1D array in degrees from 90° to -90°
# The rotation matrix R is derived from the fact that the north 
# supergalactic pole (SGB=90°) lies at galactic 
# coordinates (l =47.37°, b =+6.32°) and
# the zero point (SGB=0°, SGL=0°) lies at (l=137.37°, b=0°)
    Rx=[-0.7357425748043749,-0.07455377836523475,0.6731453021092076]
    Ry=[0.6772612964138943,-0.08099147130697638,0.7312711658169645]
    Rz=[0,0.9939225903997749,0.11008126222478193]
    R=reshape([Rx;Ry;Rz],3,3);
    SGL=float(l);SGB=float(b)
    l=deg2rad(l);b=deg2rad(b);
    for i=1:length(l)
        X_gal=[sin(pi/2-b[i])*cos(l[i]),sin(pi/2-b[i])*sin(l[i]),cos(pi/2-b[i])]
        X_sgal=R*X_gal
        if length(l) == 1; 
            SGL=rad2deg(atan2(X_sgal[2],X_sgal[1]))
            if SGL<0; SGL+=360;end
            SGB=rad2deg(atan2(X_sgal[3],sqrt(X_sgal[1]^2+X_sgal[2]^2)))
        else
            SGL[i]=rad2deg(atan2(X_sgal[2],X_sgal[1]))
            if SGL[i]<0; SGL[i]+=360;end
            SGB[i]=rad2deg(atan2(X_sgal[3],sqrt(X_sgal[1]^2+X_sgal[2]^2)))
        end      
    end
    return SGL,SGB        
end

function sgal2gal(SGL,SGB)
# The input supergalactic longitude can be a number or 1D array
# The input supergalactic  latitude can be a number or 1D array 
# The output galactic longitude is a number or 1D array in degrees from 0° to 360°
# The output galactic latitude is a number or 1D array in degrees from 90° to -90°
# The rotation matrix R is derived from the fact that the north 
# supergalactic pole (SGB=90°) lies at galactic 
# coordinates (l =47.37°, b =+6.32°) and
# the zero point (SGB=0°, SGL=0°) lies at (l=137.37°, b=0°)
    Rx=[-0.7357425748043749,-0.07455377836523475,0.6731453021092076]
    Ry=[0.6772612964138943,-0.08099147130697638,0.7312711658169645]
    Rz=[0,0.9939225903997749,0.11008126222478193]
    R=inv(reshape([Rx;Ry;Rz],3,3))
    l=float(SGL);b=float(SGB)
    L=deg2rad(SGL);B=deg2rad(SGB);
    for i=1:length(SGL)
        X_sgal=[sin(pi/2-B[i])*cos(L[i]),sin(pi/2-B[i])*sin(L[i]),cos(pi/2-B[i])]
        X_gal=R*X_sgal
        if length(SGL) == 1; 
            l=rad2deg(atan2(X_gal[2],X_gal[1]))
            if l<0; l+=360;end
            b=rad2deg(atan2(X_gal[3],sqrt(X_gal[1]^2+X_gal[2]^2)))
        else
            l[i]=rad2deg(atan2(X_gal[2],X_gal[1]))
            if l[i]<0; l[i]+=360;end
            b[i]=rad2deg(atan2(X_gal[3],sqrt(X_gal[1]^2+X_gal[2]^2)))
        end  
    end
    return l,b   
end
