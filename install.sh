export GCC=gcc
export CLANG=clang
export ATSHOME=${HOME}/ATS1
export ATSHOMERELOC=ATS-0.2.12
export PATH=${PATH}:${ATSHOME}/bin
export PATSHOME=${HOME}/ATS2
export PATH=${PATH}:${PATSHOME}/bin
bash travis-ci/install-ats1.sh 0.2.12
cd ${ATSHOME} && ./configure && make CC=${GCC} all_ngc

