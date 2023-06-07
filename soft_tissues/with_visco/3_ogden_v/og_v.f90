PROGRAM TEST_GENERAL_UMAT
use,intrinsic :: ISO_Fortran_env
INCLUDE 'aba_param.inc'
INCLUDE 'param_umat.inc'

!C     ADD COMMON BLOCKS HERE IF NEEDED ()
!C      COMMON /KBLOCK/KBLOCK

PARAMETER(NTENS = 6, NSTATEV = NSDV, NPROPS = 14, NDI=3, NSHR=3)
PARAMETER(NOEL = 1, NPT = 8)
!
CHARACTER*8 CMNAME
DIMENSION STRESS(NTENS),STATEV(NSTATEV),DDSDDE(NTENS,NTENS),DDSDDT(NTENS),      &
DRPLDE(NTENS),STRAN(NTENS),DSTRAN(NTENS),TIME(2),PREDEF(1),DPRED(1),            &
PROPS(NPROPS),COORDS(3),DROT(3,3),DFGRD0(3,3),DFGRD1(3,3)
!
i=1.0d0
j=1.0d0
DO i=1,NTENS
    DO j=1,NTENS
        DDSDDE(i,j)=0.0D0
    ENDDO
    STRESS(i)=0.0D0
ENDDO
!
! DEFORMATION GRADIENT
DFGRD1(1,1)= 1.1D0
DFGRD1(1,2)= 0.0D0
DFGRD1(1,3)= 0.0D0
DFGRD1(2,1)= 0.0D0
DFGRD1(2,2)= 1.0D0/DFGRD1(1,1)
DFGRD1(2,3)= 0.0D0
DFGRD1(3,1)= 0.0D0
DFGRD1(3,2)= 0.0D0
DFGRD1(3,3)= 1.0D0/DFGRD1(1,1)
!
time(1)=0.d0
time(2)=0.d0
dtime = 0.1d0
kstep = 1
!
! MATERIAL PROPERTIES
!
! ISOTROPIC MATRIX
PROPS(1)=2*1.D0
PROPS(2)=2.D0
PROPS(3)=0.D0
PROPS(4)=2.D0
PROPS(5)=0.D0
PROPS(6)=2.D0
!
! k PENALTY PARAMETER
PROPS(7)=2.d0/100000.d0
! !viscous parameters - maxwell
! v - number of dashpots
PROPS(8)=1
!tau1 %
PROPS(9)=2.0d0
!teta1
PROPS(10)=0.835d0
!tau2 %
PROPS(11)=1.2d0
!teta2
PROPS(12)=7.0d0
!tau3 %
PROPS(13)=12.d0
!teta3
PROPS(14)=2.0d0

!
! !viscous parameters - maxwell
! ! v - number of dashpots
! PROPS(17)=0
! !tau1 %
! PROPS(18)=2.0d0
! !teta1
! PROPS(19)=0.835d0
! !tau2 %
! PROPS(20)=1.2d0
! !teta2
! PROPS(21)=7.0d0
! !tau3 %
! PROPS(22)=12.d0
! !teta3
! PROPS(23)=2.0d0
! !
STATEV=0.D0
!
erf=0.d0
RHO=0.D0
!
!
 DFGRD1(1,1)=  1.0D0
 DFGRD1(1,2)=  0.0D0
 DFGRD1(1,3)=  0.0d0
 DFGRD1(2,1)=  0.0d0
 DFGRD1(2,2)=  1.0D0
 DFGRD1(2,3)=  0.0d0
 DFGRD1(3,1)=  0.0d0
 DFGRD1(3,2)=  0.0d0
 DFGRD1(3,3)=  1.0D0
!
!################################################################################################!
!!     TENSILE MONOTONIC LOAD TEST
 DFGRD1(1,1)=  1.2D0
 DFGRD1(1,2)=  0.0D0
 DFGRD1(1,3)=  0.0d0
 DFGRD1(2,1)=  0.0d0
 DFGRD1(2,2)=  1/sqrt(DFGRD1(1,1))
 DFGRD1(2,3)=  0.0d0
 DFGRD1(3,1)=  0.0d0
 DFGRD1(3,2)=  0.0d0
 DFGRD1(3,3)=  1/sqrt(DFGRD1(1,1))
!
 CALL UMAT(STRESS,STATEV,DDSDDE,SSE,SPD,SCD,RPL,DDSDDT, DRPLDE,DRPLDT,STRAN,     &
DSTRAN,TIME,DTIME,TEMP,DTEMP,PREDEF,DPRED,CMNAME,NDI,NSHR,NTENS,NSTATEV,PROPS,  &
NPROPS,COORDS,DROT,PNEWDT,CELENT,DFGRD0,DFGRD1,NOEL,NPT,LAYER,KSPT,KSTEP,KINC)

 write(*,*) STRESS
 write(*,*)
 write(*,*) DDSDDE
close(150)
!################################################################################################!
!
END PROGRAM
