# 
# Shared 
# 
######

RELEASE_VERSION=$(shell cat VERSION)

######

ATSDIST=ATS-Temptory

######

REPO=https://github.com/githwxi/ATS-Temptory.git

RELBRANCH=tags/v$(RELEASE_VERSION)

######

CAT=cat

CHKOUT=git checkout -b
CLONE=git clone

CPF=cp -f
CPFP=cp -fp
CPRF=cp -rf
CPRFP=cp -rfp

MAKE=make

MKDIR=mkdir
MKDIRP=mkdir -p

RMF=rm -f
RMRF=rm -rf

TARZVCF=tar -zvcf

