
# You can run "nm -s" or "objdump -f" to verify the contents of the library file. 

# FC = the compiler to use
FC=gfortran

# Compiler options
FFLAGS=-O2

#   # Include the dependency-list created by makedepf90 below
#   include nrf.dep
#    
#   # Create a dependency list using makedepf90. All files
#   # that needs to be compiled to build the program,
#   # i.e all source files except include files, should
#   # be given on the command line to makedepf90.
#   #
#   depend nrf.dep:
#    	makedepf90 *.f > .depend

OBJECTS := $(patsubst %.f,%.o,$(wildcard *.f))

TARGET = libnr.a

$(TARGET): $(OBJECTS)
	rm -f $@
	ar cr $@ $^
	@echo -e "\n***Created $(TARGET) library***\n"

%.o: %.f
	$(FC) -c $< -o $@

clean:
	rm -f *.mod *.o core

realclean:
	rm -f $(TARGET)
