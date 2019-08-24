#!/usr/bin/env sh

######
#
# Author: Kiwamu Okabe
# Author: Hongwei Xi (tidying-up)
#
######
#
# for installing ats-anairiats
#
######
#
ATSVER=$1
#
ATSPACK=\
ats-lang-anairiats-${ATSVER}
#
ATSPACKTGZ=${ATSPACK}.tgz
#
######
#
ATSLANGURL_srcfg=\
https://sourceforge.net/projects/ats-lang
#
ATSLANGURL_github=https://ats-lang.github.io
#
######
#
WGETQ="wget -q"
TARZXF="tar -zxf"
#
######
#
${WGETQ} \
${ATSLANGURL_github}/ATS-Anairiats/${ATSPACKTGZ}
#
# ${WGETQ} \
# ${ATSLANGURL_srcfg}/files/ats-lang/anairiats-latest/${ATSPACKTGZ}
#
######
#
${TARZXF} ${ATSPACKTGZ}
#
######
#
# HX-2014-12-16:
# The rest is moved into .travis.yml
#
######
#
# ./configure; make all
#
######
#
# -- If you do
#
# ./configure; make all_ngc
#
# -- Please remember to use the following
# -- command-line later when building ATS2
#
# make GCFLAG=-D_ATS_NGC all
#
######

(mv -f $ATSPACK $HOME/ATS1)

###### end of [install-ats1.sh] ######
