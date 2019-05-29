######
#
# A simple Makefile
#
######

CC=gcc
MAKE=make

######

SOURCES=\
tempacc_dats.c \
atscc_main_dats.c \
atscc_print_dats.c \

######
#
all:: \
tempacc
tempacc : ; \
$(CC) -o $@ $(SOURCES) \
  -D_GNU_SOURCE -DATS_MEMALLOC_LIBC \
  -I${PATSHOME} -I${PATSHOME}/ccomp/runtime
#
######

###### end of [Makefile_build] ######
