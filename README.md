# Julia language 

Converts sky coordinates from galactic to supergalactic and vice versa

#Usage
SGL,SGB = gal2sgal(l,b)

The input galactic longitude can be a number or 1D array
The input galactic  latitude can be a number or 1D array 
The output supergalactic longitude is a number or 1D array in degrees from 0° to 360°
The output supergalactic latitude is a number or 1D array in degrees from 90° to -90°

#Usage
l,b = sgal2gal(SGL,SGB)

The input supergalactic longitude can be a number or 1D array
The input supergalactic  latitude can be a number or 1D array 
The output galactic longitude is a number or 1D array in degrees from 0° to 360°
The output galactic latitude is a number or 1D array in degrees from 90° to -90°

