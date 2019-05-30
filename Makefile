######
#
# Entry point for building the release
#
######

include share.mk

######

MAKEBUILD=Makefile_build

######

all:: make_build

######

make_build:: ; $(MAKE) -f $(MAKEBUILD)

######

# Note: the following are automatically called
#       by Makefile_build

######

clean::; $(MAKE) -f $(MAKEBUILD) clean

######

cleanall::; $(MAKE) -f $(MAKEBUILD) cleanall

######
