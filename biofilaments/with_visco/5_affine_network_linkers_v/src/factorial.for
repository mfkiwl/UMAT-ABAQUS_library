      SUBROUTINE FACTORIAL(FACT,TERM)
C>    FACTORIAL
      IMPLICIT NONE
      INCLUDE 'PARAM_UMAT.INC'
C
      DOUBLE PRECISION FACT
      INTEGER M,TERM
C
      FACT = 1
C
      DO  M = 1, TERM
           FACT = FACT * M
      ENDDO
C
      RETURN
      END SUBROUTINE FACTORIAL