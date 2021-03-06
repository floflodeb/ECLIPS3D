MODULE mod_init_matrix
  USE mod_init_para
  USE mod_data

  IMPLICIT NONE


  INTEGER :: nlld ! leading dimension, fairly practical
  INTEGER :: nlocr, nlocc



  COMPLEX*16, DIMENSION(:,:), ALLOCATABLE:: mat_evol
  INTEGER, DIMENSION(50) :: desc_mat


  CONTAINS
    SUBROUTINE init_matrix

      INTEGER :: info

      !Size of the local matrices
      nlocr=ntot/(nb*nprow)
      nlocr=nlocr*nb
      nlocr = nlocr + MIN((ntot - nlocr*nprow), nb)

      nlocc=ntot/(nb*npcol)
      nlocc=nlocc*nb
      nlocc = nlocc + MIN((ntot - nlocc*npcol), nb)

      !  leading size
      nlld=MAX(nlocr,nlocc)


      CALL DESCINIT(desc_mat, ntot,ntot,nb,nb,0,0,info_txt,nlld,info)
      ALLOCATE(mat_evol(nlocr,nlocc))

    END SUBROUTINE

END MODULE
