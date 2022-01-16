# =============================================================================
#  Make include file example_QProblem_usr.mk:
#
#   RTI1007 7.16 (02-May-2021)
#   Sat Jan 15 23:29:08 2022
#
#   Copyright 2021, dSPACE GmbH. All rights reserved. Brand names
#   or product names are trademarks or registered trademarks of their
#   respective companies or organizations.
# =============================================================================

# =============================================================================
# ===== Define file version macro. Never change this value. ===================
# =============================================================================
USER_MAKEFILE_VERSION = 2
# =============================================================================

# -----------------------------------------------------------------------------
# Macros for user-specific settings.
#
# All macros below may list several items (files or directories). You can
# separate multiple items with blanks or list them on several lines using
# the \ (backslash) as line continuation character.
#
# The directory names may include absolute or partial path
# descriptions, e.g., ".\project1\sources"
#
# If path names contain white space characters they need to be set
# in double quotes (").
# White space characters and double quotes are not supported
# with file names like "my source.c".
#
# Note that white space characters and double quotes with path
# names are available since RTI/RTI-MP of dSPACE Release 6.0.
# Such paths do not work with previous versions of RTI/RTI-MP.
#
# Examples:
#
# USER_SRCS = file1.c file2.c file3.c
#
# USER_SRCS = \
#    file1.c \
#    file2.c \
#    file3.c
#
# SFCN_DIR = \
#    "\project one\sfcns" \
#    "\project two\sfcns"
#
# -----------------------------------------------------------------------------

# enable C++ support
USER_BUILD_CPP_APPL = ON

# Directories where S-Function C source files are stored.
SFCN_DIR = C:\cygwin64\home\heejink\qpOASES-master\src

# Additional C source files to be compiled (file name extension .c).
USER_SRCS = SQProblem.cpp QProblem.cpp QProblemB.cpp Bounds.cpp Constraints.cpp SubjectTo.cpp Indexlist.cpp Flipper.cpp Utils.cpp Options.cpp Matrices.cpp BLASReplacement.cpp LAPACKReplacement.cpp MessageHandling.cpp

# Additional assembler source files to be compiled (file name extension .asm).
USER_ASM_SRCS =

# Directories where additional C and assembler source files are stored.
USER_SRCS_DIR =

# Path names for user include files.
USER_INCLUDES_PATH = C:\cygwin64\home\heejink\qpOASES-master\src C:\cygwin64\home\heejink\qpOASES-master\include C:\cygwin64\home\heejink\qpOASES-master\interfaces\simulink

# Additional user object files to be linked.
USER_OBJS =

# Additional user libraries to be linked.
USER_LIBS =

# EOF -------------------------------------------------------------------------
