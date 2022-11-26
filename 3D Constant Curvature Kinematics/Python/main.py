import numpy as np
import matplotlib.pyplot as plt
from functions import trans_mat_cc
from functions import coupletransformations
# from mpl_toolkits.mplot3d import Axes3D


# from configuration space (kappa, length) to task space (x,y)

# parameters
kappa1 = 1.7035; # 1/m
l1 = 0.1000; # metre
phi1 = np.pi; # rad
kappa2 = 1.0000; # 1/m
l2 = 0.1000; # metre
phi2 = np.pi/2; # rad
kappa3 = 2.0000; # 1/m
l3 = 0.1000; # metre
phi3 = 0; # rad

if kappa1 > 16 or kappa1 < -4:
    print("Please enter the First Curvature values between -4 and 16")
    kappa1 = 0;

elif kappa2 > 16 or kappa2 < -4:
    print("Please enter the Second Curvature values between -4 and 16")
    kappa2 = 0;

elif kappa3 > 16 or kappa3 < -4:
    print("Please enter the Third Curvature values between -4 and 16")
    kappa3 = 0;
    
else:
    print("Curvature Values for Each Segment are Appropriate")
    
    
# section 1
T1_cc = trans_mat_cc(kappa1,l1,phi1)
T1_tip = np.reshape(T1_cc[len(T1_cc)-1,:],(4,4),order='F');

# section 2
T2 = trans_mat_cc(kappa2, l2, phi2);
T2_cc = coupletransformations(T2,T1_tip);
T2_tip = np.reshape(T2_cc[len(T2_cc)-1,:],(4,4),order='F');

# section 3
T3 = trans_mat_cc(kappa3, l3, phi3);
T3_cc = coupletransformations(T3,T2_tip);

ax = plt.figure().add_subplot(projection='3d')
# Plot the trunk with three sections and point the section seperation
# ax.plot_surface([-0, 0],[-0,0],[0], alpha=0.2)
x = np.linspace(-0.05, 0.05, 10)
y = np.linspace(-0.01, 0.01, 10)
x, y = np.meshgrid(x, y)
eq = x * y 

ax.plot_surface(x, y, eq, alpha=0.6, color='black')
ax.scatter(T1_cc[0,12],T1_cc[0,13],T1_cc[0,14],linewidths=5,color = 'black',label="Section Seperation")
ax.plot(T1_cc[:,12],T1_cc[:,13],T1_cc[:,14],'b',linewidth=3,label="First Section")
ax.scatter(T1_cc[-1,12],T1_cc[-1,13],T1_cc[-1,14],linewidths=5,color = 'black')
ax.plot(T2_cc[:,12],T2_cc[:,13],T2_cc[:,14],'r',linewidth=3,label="Second Section")
ax.scatter(T2_cc[-1,12],T2_cc[-1,13],T2_cc[-1,14],linewidths=5,color = 'black')
ax.plot(T3_cc[:,12],T3_cc[:,13],T3_cc[:,14],'g',linewidth=3,label="Third Section")
ax.scatter(T3_cc[-1,12],T3_cc[-1,13],T3_cc[-1,14],linewidths=5,color = 'black')
ax.legend(loc="best")
ax.set_title("2D Continuum Robot")
ax.set_xlabel("X Position (m)")
ax.set_ylabel("Y Position (m)")
ax.set_zlabel("Z Position (m)")
plt.show()