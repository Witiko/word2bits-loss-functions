FORCE:

vectors/%: FORCE
	make -C vectors $(patsubst vectors/%,%,$@)

%.fsa:
	wget https://nlp.fi.muni.cz/czech-morphology-analyser/w-lt.en.fsa
