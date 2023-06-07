      SUBROUTINE SIGISOMATFIC(SFIC,PKFIC,F,DET,NDI)
C>    ISOTROPIC MATRIX:  ISOCHORIC CAUCHY STRESS 
      IMPLICIT NONE
      INCLUDE 'param_umat.inc'
C
      INTEGER NDI
      DOUBLE PRECISION SFIC(NDI,NDI),F(NDI,NDI),
     1                 PKFIC(NDI,NDI)
      DOUBLE PRECISION DET
C
      CALL PUSH2(SFIC,PKFIC,F,DET,NDI)
C
      RETURN
      END SUBROUTINE SIGISOMATFIC