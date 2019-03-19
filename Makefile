FORCE:

vectors/%: FORCE
	make -C vectors $(patsubst vectors/%,%,$@)
