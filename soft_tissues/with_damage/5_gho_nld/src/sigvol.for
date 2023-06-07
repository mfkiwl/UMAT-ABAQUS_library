      SUBROUTINE SIGVOL(SVOL,PV,UNIT2,NDI)
C>    VOLUMETRIC CAUCHY STRESS 
      IMPLICIT NONE
      INCLUDE 'param_umat.inc'
C
      INTEGER NDI,I1,J1
      DOUBLE PRECISION UNIT2(NDI,NDI),SVOL(NDI,NDI)
      DOUBLE PRECISION PV
C
      DO I1=1,NDI
        DO J1=1,NDI
          SVOL(I1,J1)=PV*UNIT2(I1,J1)
        END DO
      END DO
C
      RETURN
      END SUBROUTINE SIGVOL