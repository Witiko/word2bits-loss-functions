.PHONY: FORCE use-non-binary-compute-accuracy

.ONESHELL:
SHELL=/bin/bash

LAMBDAS=0.0 0.001 0.01 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 0.99 0.999 1.0

FORCE:

use-non-binary-compute-accuracy:
	set -e
	cd ../Word2Bits
	git checkout non-binary-compute-accuracy
	make compute_accuracy

%_sparsification: FORCE
	make $(addprefix $@/1b_1000d_vectors_,$(addsuffix _e10_nonbin,$(LAMBDAS)))

%:
	set -e
	(cd ../vectors && make $@)
	mkdir -p $(dir $@)
	../Word2Bits/compute_accuracy ../vectors/$@ <../Word2Bits/data/google_analogies_test_set/questions-words.txt >$@
