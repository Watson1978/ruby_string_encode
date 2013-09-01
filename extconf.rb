require 'mkmf'

$DLDFLAGS << " -framework Foundation -ObjC "
create_makefile('conv')