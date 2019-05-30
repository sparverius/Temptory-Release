######
#
# A simple Makefile
#
######

CC=gcc
MAKE=make

######

all:: build
all:: install

######

SOURCES=\
tempacc_dats.c \
atscc_main_dats.c \
atscc_print_dats.c \

######

build:: \
tempacc
tempacc : ; \
$(CC) -o $@ $(SOURCES) \
  -D_GNU_SOURCE -DATS_MEMALLOC_LIBC \
  -I${PATSHOME} -I${PATSHOME}/ccomp/runtime
#
######

install:: ; cp -fp tempacc ./../../bin/


###### end of [Makefile_build] ######
