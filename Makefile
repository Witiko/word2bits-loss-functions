.PHONY: FORCE

FORCE:

vectors/%: FORCE
	make -C vectors $(patsubst vectors/%,%,$@)

analogy/%: FORCE
	make -C analogy $(patsubst analogy/%,%,$@)

analogy_bitwise/%: FORCE
	make -C analogy_bitwise $(patsubst analogy_bitwise/%,%,$@)

%.fsa:
	wget https://nlp.fi.muni.cz/czech-morphology-analyser/w-lt.en.fsa
