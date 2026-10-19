# Build/test conventions for a morloc-dungeon example.
#
# dungeon-master drives exactly these three targets:
#
#   make build   build the program; nonzero exit on any build failure
#   make test    run it and diff against test/exp.txt; nonzero exit on mismatch
#   make clean   remove build products
#
# `test` depends on `build`, so `make test` builds and checks in one step.
# `diff` exits nonzero on any mismatch, which is what marks the test as failed.

EXE := smiles
SRC := main.loc

.PHONY: build test clean

build:
	morloc make -o $(EXE) $(SRC)

test: build
	rm -f test/obs.txt
	./$(EXE) canonicalize "C1=NC2=NC=NC(=C2N1)N" >> test/obs.txt
	./$(EXE) mw "C1=NC2=NC=NC(=C2N1)N" >> test/obs.txt
	./$(EXE) formula "C1=NC2=NC=NC(=C2N1)N" >> test/obs.txt
	diff -u test/exp.txt test/obs.txt

clean:
	rm -rf $(EXE) $(EXE)-build test/obs.txt __pycache__/
