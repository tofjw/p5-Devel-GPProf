#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include <gperftools/profiler.h>


MODULE = Devel::GPerf		PACKAGE = Devel::GPerf		

int
profiler_start(fname)
    const char* fname;
CODE:
    RETVAL = ProfilerStart(fname);
OUTPUT:
    RETVAL
 
void
profiler_stop()
CODE:
    ProfilerStop();
 
void
profiler_flush()
CODE:
    ProfilerFlush();

 
