######
#
# HX-2013-03:
# for compiling a distribution of ATS-Postiats
# KO-2014-04-09:
# removing [-T] from [install] as the option is
# not supported on MacOS
# IU-2014-04-30:
# removing the space between -m and the following mode
# as it is not supported on freeBSD
#
######

CPF=cp -f
CPR=cp -R
MVF=mv -f
RMF=rm -f
RMRF=rm -rf

######

MAKE=make
MAKEJ4=make -j4

######
#
all:: config.mk
#
all:: bin2_tempopt
all:: lib2_libatsopt
#
all:: bin_tempacc
all:: bin_mytempacc
#
all:: ccomp/atslib/lib/libatslib.a
#
######

configure: ; /bin/bash autogen.sh

######
#
# HX: this seems to be working
#
# config.mk : configure ; ./configure
#
#######
#
config.mk: \
configure ; \
@echo "Please execute './configure'." ; exit 1 ;
#
######
#
# C3NSTRINTKND=gmpknd
#
# C3NSTRINTKND=intknd
#
######
#
src_tempopt: ; \
$(MAKE) C3NSTRINTKND=$(C3NSTRINTKND) -j4 -C srcgen tempopt
#
bin_tempopt: src_tempopt ; $(CPF) srcgen/tempopt bin/tempopt
#
######
#
CCOMP=gcc
#
GCFLAG=
#GCFLAG=-D_ATS_NGC
#GCFLAG=-D_ATS_GCBDW
#GCFLAG=-D_ATS_GCATS
#
CFLAGS=
LDFLAGS=
#
######
#
src2_tempopt: ; \
$(MAKEJ4) -C srcgen/CBOOT tempopt \
CCOMP=$(CCOMP) GCFLAG=$(GCFLAG) LDFLAGS=$(LDFLAGS) 
#
bin2_tempopt: src2_tempopt ; $(CPF) srcgen/CBOOT/tempopt bin/tempopt
#
######

utl_tempacc: ; \
$(MAKE) -C utils/tempacc copy build clean
bin_tempacc: utl_tempacc ; \
$(CPF) utils/tempacc/BUILD/tempacc bin/tempacc

utl_mytempacc: ; \
$(MAKE) -C utils/mytempacc copy build clean
bin_mytempacc: utl_mytempacc ; \
$(CPF) utils/mytempacc/BUILD/mytempacc bin/mytempacc

######
#
src2_libatsopt: ; \
$(MAKE) -C srcgen/CBOOT CCOMP=$(CCOMP) libatsopt
lib2_libatsopt: src2_libatsopt ; \
$(CPF) srcgen/CBOOT/libatsopt.a ccomp/atslib/lib/.
#
######

ccomp/atslib/lib/libatslib.a: ; $(MAKE) -C ccomp/atslib atslib

######

-include config.mk

######
#
# This variable is to be set externally
#
DESTDIR :=
#
######

export TEMPTORYHOME
export TEMPLIBHOME

######

bindir2 := $(DESTDIR)$(bindir)
TEMPTORYLIBHOME := $(DESTDIR)$(TEMPLIBHOME)

######
#
# HX-2011-06-01:
# This part was originally written by Georg Bauhaus
# (bauhausATarcorDOTde): It addresses the issue that
# the [-D] option is not available for $(INSTALL) on MacOSX.
#
.PHONY: install_dirs
.PHONY: install_files
#
install: install_files

install_files: \
  install_files_00 \
  install_files_10 \
  install_files_11 \
  install_files_20 \
  install_files_30 \
  install_files_31 \
  install_files_40 \
  install_files_50 \

install_dirs: ; \
  cd "$(abs_top_srcdir)" && \
  $(MKDIR_P) $(TEMPTORYLIBHOME)/bin && \
  if [ ! -d $(bindir2) ] ; then $(MKDIR_P) $(bindir2) ; fi && \
  for x in share ccomp prelude libats contrib ; do \
    find "$$x" -type d -exec $(MKDIR_P) $(TEMPTORYLIBHOME)/\{} \; -print; \
  done

install_files_00: install_dirs ; \
  for x in share ccomp/runtime prelude libats contrib ; do \
    cd "$(abs_top_srcdir)" && \
    $(INSTALL) -d $(TEMPTORYLIBHOME)/"$$x" && \
    find "$$x" -type l -exec $(CPR) \{} $(TEMPTORYLIBHOME)/\{} \; -print && \
    find "$$x" -type f -exec $(INSTALL) -m644 \{} $(TEMPTORYLIBHOME)/\{} \; -print; \
  done

install_files_10: bin/tempacc ; \
  $(INSTALL) -m755 $< $(TEMPTORYLIBHOME)/bin/tempacc && echo $<
install_files_11: bin/mytempacc ; \
  $(INSTALL) -m755 $< $(TEMPTORYLIBHOME)/bin/mytempacc && echo $<
install_files_20: bin/tempopt ; \
  $(INSTALL) -m755 $< $(TEMPTORYLIBHOME)/bin/tempopt && echo $<

install_files_50: ; \
  for x in \
    ccomp/atslib/lib/libatslib.a \
    ccomp/atslib/lib64/libatslib.a ; \
  do \
    if [ -e "$$x" ] ; then \
      $(INSTALL) -m755 "$$x" $(TEMPTORYLIBHOME)/"$$x" && echo "$$x"; \
    fi; \
  done

######
#
# HX-2017-11-11:
# Please execute the following
# command-lines before reinstall
#
# make -C ccomp/atslib clean
# make -C ccomp/atslib atslib
#
reinstall_atslib: install_files_50  
#
######
#
uninstall:: uninstall_bin
uninstall:: uninstall_home
#
uninstall_bin:: ; $(RMF) $(bindir2)/tempacc
uninstall_bin:: ; $(RMF) $(bindir2)/mytempacc
uninstall_bin:: ; $(RMF) $(bindir2)/tempopt
uninstall_home:: ; $(RMRF) $(TEMPTORYLIBHOME)
#
######

clean::
cleanall:: clean

######

clean:: ; $(RMF) ccomp/atslib/output/*.o
clean:: ; $(MAKE) -C srcgen/CBOOT -f Makefile clean

######

cleanall:: ; $(RMF) stamp-h1
cleanall:: ; $(RMF) config.mk
cleanall:: ; $(RMF) config.log
cleanall:: ; $(RMF) config.status
cleanall:: ; $(RMRF) autom4te.cache

cleanall:: ; $(RMF) bin/tempacc
cleanall:: ; $(RMF) bin/mytempacc
cleanall:: ; $(RMF) bin/tempopt

cleanall:: ; $(RMF) ccomp/atslib/lib/*
cleanall:: ; $(RMF) ccomp/atslib/lib64/*
cleanall:: ; $(RMF) ccomp/atslib/output/*

cleanall:: ; $(MAKE) -C srcgen -f Makefile cleanall
# cleanall:: ; $(MAKE) -C srcgen/CBOOT -f Makefile cleanall
cleanall:: ; $(MAKE) -C utils/tempacc -f Makefile cleanall

######

distclean:: cleanall

######

###### end of [Makefile_dist] ######
