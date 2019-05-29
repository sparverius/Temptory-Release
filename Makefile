######
#
# Entry point for building the release
#
######

include share.mk

######

MAKEREL=Makefile_release
MAKEINC=Makefile_include

######

all:: intkind
all:: gmpkind
all:: include

######

intkind:: ; $(MAKE) -f $(MAKEREL) C3NSTRINTKND=intknd all
gmpkind:: ; $(MAKE) -f $(MAKEREL) C3NSTRINTKND=gmpknd all

######

include:: ; $(MAKE) -f $(MAKEINC) all

######

cleanall::; $(RMF) *~
cleanall::; $(RMRF) ATS-Temptory-*

######