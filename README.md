**********************************************************************
   **How to use qpOASES on dSPACE using Windows Cygwin environemnt**    
            By Heejin Kim (heejink@umich.edu)                      
**********************************************************************

**Note:**
This document provides a comprehensive step-by-step guide on how to install, compile and use qpOASES on dSPACE. The manual from qpOASES is not complete and it needs additional steps in order to compile successfully, which I’ve notated as “(ADDITIONAL STEP)” in this document.

**System descrition**

•	Operating system: Windows
•	Compiler version: gcc-g++ 11.2.0-1 on Cygwin
•	dSPACE platform: DS1107
•	MATLAB release: R2021a
•	qpoases manual: https://github.com/coin-or/qpOASES/blob/master/doc/manual.pdf 

**1. Compilation of qpoases***

•	Install Cygwin via: https://cygwin.com/install.html
•	(ADDITIONAL STEP) In Cygwin, please install following packages: gcc-debuginfo, gcc-g++, gcc-objc, gcc-objc++, gdb, git, lapack-debuginfo, liblapack-devel, liblapack-doc, liblapack0, libopenblas, make, openssh, python3, vim
•	Download qpoases in the <install-dir> of Cygwin via: https://github.com/coin-or/qpOASES 
•	Open “make.mk”  comment make_linux.mk and uncomment make_cygwin.mk
•	(ADDITIONAL STEP) Create a folder in the <install-dir> of qpoases named “bin”
•	Open Cygwin terminal and command “make”

**2. Test a user-defined problem in qpoases**

•	Assume you have “example_user.cpp” in <install-dir>/examples. For how to create a problem, refer to the manual.
•	Open “Makefile” in <install-dir>/examples. Modify such that “QPOASES_EXES” include the “example_user” in the same format.
•	Also, in “Makefile”, add:
${BINDIR}/example_heejink${EXE}: example_heejink.${OBJEXT}
	@${ECHO} "Creating" $@
	@${CPP} ${DEF_TARGET} ${CPPFLAGS} $< ${QPOASES_LINK} ${LINK_LIBRARIES}
•	Go to <install-dir> and command “make”
•	A “example_user.o” will be created in <install-dir>/examples. Also, “example_user.exe” will be created in <install-dir>/bin. You will be able to run it in the terminal.

**3. Compiling qpoases on Simulink**

•	The manual is very straightforward on this step

**4. Compiling qpoases on dSPACE**

•	The above step 2 and step 3 are necessary for this step to work. Although the manual tells to install the dSPACE C++ integration kit, since DS1107 already has the C++ compiler, there is no need. If your dSPACE platform is different and the compilation process results in “identifier ‘class’ is undefined”, then that means the dSPACE needs additional installation of the C++ compiler.
•	In <install-dir>/include/qpOASES/Types.hpp, uncomment the line 45
•	Run “make” in Cygwin terminal.
•	Open one of the three .mdl projects in <install-dir>/interfaces/Simulink and compile on dSPACE so that MK (make) file is generated by dSPACE. It is okay if the compilation results in error for now, we just need the MK file.
•	Open the MK file and add the following lines:
o	#enable c++ support
o	USER_BUILD_CPP_APPL = ON
o	USER_SRCS = SQProblem.cpp QProblem.cpp QProblemB.cpp Bounds.cpp Constraints.cpp SubjectTo.cpp Indexlist.cpp Flipper.cpp Utils.cpp Options.cpp Matrices.cpp BLASReplacement.cpp LAPACKReplacement.cpp MessageHandling.cpp
o	SFCN_DIR = C:\cygwin64\home\heejink\qpOASES-master\src
o	USER_INCLUDES_PATH = C:\cygwin64\home\heejink\qpOASES-master\src C:\cygwin64\home\heejink\qpOASES-master\include C:\cygwin64\home\heejink\qpOASES-master\interfaces\simulink
•	(ADDITIONAL STEP) In <install-dir>/examples/Makefile , delete example4, example4CP, qrecipe, and qrecipeSchur. 
•	(ADDITIONAL STEP) In <install-dir>/src/Utils.cpp, comment the lines 56 – 67.
•	Compile the .mdl project again and it should be loaded successfully
