.PHONY: FORCE

.ONESHELL:
SHELL=/bin/bash

LAMBDAS=0.0 0.001 0.01 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 0.99 0.999 1.0
NPROC=$(shell nproc)

FORCE:

num_zeros:
	for i in */*; do printf '%s\t%d\n' $$i `sed s/[^-]//g <$$i | wc -c`; done | tee $@
	sort -t _ -k 1,1 -k 5,5 -o $@ $@

fil8:
	wget http://mattmahoney.net/dc/enwik8.zip
	unzip enwik8.zip
	perl wikifil.pl enwik8 > fil8

%_sparsification: FORCE
	make $(addprefix $@/1b_1000d_vectors_,$(addsuffix _e10_nonbin,$(LAMBDAS)))

%: fil8
	set -e
	(cd ../Word2Bits && git checkout $(patsubst %/,%,$(dir $@))) && \
	make -C ../Word2Bits word2bits && \
	mkdir -p $(dir $@) && \
	../Word2Bits/word2bits -sample 1e-4 -bitlevel 1 -size 1000 -window 10 -negative 24 -threads $(NPROC) -iter 10 -min-count 5 -train $< -sparsification $$(sed -r 's/.*1b_1000d_vectors_(.*)_e10_nonbin$$/\1/' <<<$@) -output $@ -binary 0
