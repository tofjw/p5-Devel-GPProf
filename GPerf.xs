#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include <gperftools/profiler.h>


MODULE = Devel::GPerf		PACKAGE = Devel::GPerf		

